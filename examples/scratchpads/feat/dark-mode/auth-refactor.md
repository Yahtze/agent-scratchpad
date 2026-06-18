Active: auth-refactor.md

# Scratchpad: auth-refactor

## Status: in-progress

## Goal

Refactor auth middleware to support per-user theme preference in session token.

## Design Decisions

- Embedding theme preference in JWT claims — no extra Redis lookup on each request
- Claims schema: `{ theme: "light" | "dark" | "system" }`
- Backward compatible: missing claim defaults to system preference

## Approaches Tried

1. **Separate theme API call on page load** — rejected. Extra network round-trip, flash of wrong theme.
2. **Cookie-based theme** — rejected. Doesn't integrate with user profile sync.

## Architecture Notes

- JWT signing at `src/auth/token.ts:34`
- Claims validation at `src/auth/token.ts:52`
- Middleware reads claims at `src/middleware/auth.ts:45`

## Open Questions

- Should theme claim be in access token (short-lived) or refresh token (long-lived)?
- Max token size concern if we add more claims later?
