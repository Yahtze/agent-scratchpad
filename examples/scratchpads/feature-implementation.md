# Scratchpad: Add dark mode toggle to settings page

## Status: in-progress

## Goal

Add a dark mode toggle to the user settings page. Should persist preference to user profile and apply theme on all pages.

## Plan

- [x] Step 1: Audit existing theme/styling system
- [x] Step 2: Add dark color tokens to design system
- [x] Step 3: Create ThemeProvider context
- [ ] Step 4: Build toggle component
- [ ] Step 5: Wire up to user settings API
- [ ] Step 6: Apply theme on page load (flash prevention)
- [ ] Step 7: Test all pages in dark mode

## Findings

- Design system uses CSS variables in `src/styles/variables.css`
- Light theme tokens already exist: `--color-bg`, `--color-text`, etc.
- No dark theme tokens yet — need to add `--color-bg-dark` etc.
- User settings API at `PUT /api/user/preferences` — already has `theme` field (unused)
- Existing ThemeProvider stub in `src/providers/Theme.tsx` — empty, just renders children

## Notes

- Design mockup: Figma link in #design channel, June 16
- Should support system preference detection via `prefers-color-scheme`
- Accessibility requirement: toggle must be keyboard navigable
