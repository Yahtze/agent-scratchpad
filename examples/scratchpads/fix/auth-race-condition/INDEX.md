Active: INDEX.md

# Scratchpad: fix/auth-race-condition

## Status: in-progress

## Goal

Fix intermittent 401 errors on `/api/user` endpoint. Happens ~10% of requests under concurrent load.

## Design Decisions

- Root cause identified: race condition in Redis connection pool (`src/redis/pool.ts:23`)
- Chose connection locking over request queuing — simpler, lower latency impact
- Will not upgrade ioredis again until we have integration tests for connection pooling

## Approaches Tried

1. **Increased pool size to 20** — reduced frequency but did not fix. Rejected: masks the race, doesn't solve it.
2. **Added mutex to `getClient()`** — works but blocks all requests under contention. Rejected: unacceptable latency.
3. **Per-request connection with timeout** — current approach. Testing.

## Architecture Notes

- Auth middleware at `src/middleware/auth.ts:45`
  - Synchronous JWT verify → async Redis session lookup
  - `redis.getClient()` returns shared connection (the bug)
- Redis pool config in `src/redis/pool.ts`
- Token cache TTL is 5 min, session TTL is 30 min — mismatch causes edge case

## Open Questions

- Should we add integration tests for connection pooling before merging?
- Is the per-request connection approach safe under high concurrency, or do we need a circuit breaker?
- Related PR #1247 (ioredis upgrade) — should we revert if this fix is too complex?
