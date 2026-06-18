Active: auth-refactor.md

# Scratchpad: feat/dark-mode

## Status: in-progress

## Overview

Adding dark mode to the app. CSS custom properties are in place, ThemeProvider created. Currently refactoring auth middleware to embed theme preference in JWT claims. Toggle component not yet built.

## Goal

Add dark mode toggle to user settings page. Persist preference to user profile, apply theme site-wide.

## Key Decisions

- Using CSS custom properties (already in `src/styles/variables.css`) — no new dependencies
- Theme state via React context (`ThemeProvider`) — matches existing pattern for auth/i18n
- System preference detection with `prefers-color-scheme` as default, user can override
- Toggle in settings page, not header — design team decision (Figma: #design channel, June 16)

## Scopes
- [auth-refactor.md](auth-refactor.md) — refactoring auth middleware to support theme persistence

## Open Questions

- Design mockup not finalized for mobile — waiting on design team.
- Should theme apply before React hydrates to prevent flash? Requires SSR consideration.
