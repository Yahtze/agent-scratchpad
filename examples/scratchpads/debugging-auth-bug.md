# Scratchpad: Fix intermittent 401 errors on /api/user endpoint

## Status: in-progress

## Goal

Users report getting random 401 errors on the /api/user endpoint. Happens ~10% of requests. Fix the root cause.

## Plan

- [x] Step 1: Reproduce the issue locally
- [x] Step 2: Check auth middleware for race conditions
- [x] Step 3: Inspect token validation logic
- [ ] Step 4: Check Redis session store connection pooling
- [ ] Step 5: Implement fix
- [ ] Step 6: Add regression test

## Findings

- Reproduced: happens when 2+ requests hit simultaneously with same token
- Auth middleware at `src/middleware/auth.ts:45` — validates token then checks Redis
- Token validation is synchronous (JWT verify) — not the bottleneck
- Redis lookup at line 52 is async but has no timeout handling
- Found: `redis.getClient()` returns same connection without locking — possible race

## Hypotheses

1. Redis connection pool exhaustion under load — rejecting connections silently
2. Race condition in `getClient()` — two requests get same connection, second one fails
3. Token cache TTL mismatch — cache expires between validation steps

Most likely: #2 — the `getClient()` function at `src/redis/pool.ts:23` has no mutex.

## Notes

- Issue started after upgrading `ioredis` from 4.x to 5.x last Tuesday
- Related PR: #1247 (the upgrade)
- Slack thread: #backend channel, June 15
