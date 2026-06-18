Active: auth-refactor.md

# Scratchpad: feat/dark-mode

## Status: in-progress

## Goal

Add dark mode toggle to user settings page. Persist preference to user profile, apply theme site-wide.

## Design Decisions

- Using CSS custom properties (already in `src/styles/variables.css`) — no new dependencies
- Theme state via React context (`ThemeProvider`) — matches existing pattern for auth/i18n
- System preference detection with `prefers-color-scheme` as default, user can override
- Toggle in settings page, not header — design team decision (Figma: #design channel, June 16)

## Approaches Tried

1. **Tailwind dark: prefix** — rejected. Project uses CSS variables, not Tailwind utilities. Would require full migration.
2. **Media query only** — rejected. Need user override for system preference. No persistence.

## Scopes
- [auth-refactor.md](auth-refactor.md) — refactoring auth middleware to support theme persistence

## Open Questions

- Design mockup not finalized for mobile — waiting on design team.
- Should theme apply before React hydrates to prevent flash? Requires SSR consideration.
