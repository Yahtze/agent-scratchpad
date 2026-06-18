# Scratchpad: feat/dark-mode

## Status: in-progress

## Goal

Add dark mode toggle to user settings page. Persist preference to user profile, apply theme site-wide.

## Design Decisions

- Using CSS custom properties (already in `src/styles/variables.css`) — no new dependencies
- Theme state via React context (`ThemeProvider`) — matches existing pattern for auth/i18n
- System preference detection with `prefers-color-scheme` as default, user can override
- Toggle in settings page, not header — design team decision (Figma: #design channel, June 16)

## Patches Tried

1. **Tailwind dark: prefix** — rejected. Project uses CSS variables, not Tailwind utilities.
2. **Media query only** — rejected. Need user override for system preference.

## Architecture Notes

- Design tokens: `src/styles/variables.css` — add `--color-bg-dark`, `--color-text-dark`, etc.
- Existing stub: `src/providers/Theme.tsx` — empty, just renders children
- User preferences API: `PUT /api/user/preferences` — already has unused `theme` field
- Flash prevention: need to inject theme script in `<head>` before render

## Context for Next Session

- Dark color tokens added to variables.css (commit abc1234)
- ThemeProvider created at `src/providers/Theme.tsx`
- Next: build toggle component, wire to API, test all pages
- Accessibility: toggle must be keyboard navigable (WCAG 2.1 AA)
