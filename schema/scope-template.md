<!-- 
INSTRUCTIONS: Use this template to create a new scoped scratchpad.
Copy the section headers (##) and content areas, but replace all 
guidance text and examples with real scratchpad content.
Blockquotes (>) are instructions — do not include them in the output.
-->

# Scratchpad: [scope-name]

## Status: planning

## Goal

> What is this scope trying to accomplish? Be specific. This should be a focused subset of the branch goal.
>
> **Good:** "Refactor auth middleware to embed theme preference in JWT claims so dark mode can be applied without an extra API call on page load."
>
> **Bad:** "Fix the auth"

## Design Decisions

> Choices made within this scope and their rationale. Branch-level decisions go in INDEX.md.
>
> Format: `- [Decision]: [Rationale]`
>
> **Good:** "Embedding theme in JWT claims: avoids extra Redis lookup per request, claims are small (1 field), access token already validated in middleware"
>
> **Bad:** "Put it in the token"

## Approaches Tried

> Approaches tested within this scope, what happened, and why they were accepted or rejected. Prevents future sessions from repeating dead ends.
>
> Format: `1. **[Approach name]** — [outcome]. Rejected/Accepted because [reason].`
>
> **Good:** "Separate theme API call on page load — works but adds 50ms latency. Rejected: extra network round-trip, causes flash of wrong theme."
>
> **Bad:** "Didn't work"

## Architecture Notes

> How this scope fits into the codebase. File locations, relevant code paths, dependencies specific to this scope.
>
> Include: key file paths with line numbers, how this scope connects to the rest of the system, gotchas and non-obvious behavior.
>
> **Good:** "JWT signing at src/auth/token.ts:34 — claims object passed to sign() at line 38. Theme field added after existing role/permissions claims."
>
> **Bad:** "Token stuff is in auth folder"

## Open Questions

> Unresolved issues within this scope that need human input or further exploration. These should prompt action — not just be notes.
>
> **Good:** "Should theme claim be in access token (short-lived, re-validated often) or refresh token (long-lived, survives session)? Trade-off: security vs UX."
>
> **Bad:** "Which token?"
