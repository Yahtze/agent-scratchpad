# Scratchpad: [scope-name]

## Status: [planning | in-progress | blocked | complete]

## Goal

<!--
What is this scope trying to accomplish? Be specific.
This should be a focused subset of the branch goal.

Good goal:
"Refactor auth middleware to embed theme preference in JWT claims so 
dark mode can be applied without an extra API call on page load."

Bad goal:
"Fix the auth"
-->

## Design Decisions

<!--
Choices made within this scope and their rationale.
Branch-level decisions go in INDEX.md.

Format:
- [Decision]: [Rationale]

Good entry:
- "Embedding theme in JWT claims: avoids extra Redis lookup per request, 
  claims are small (1 field), access token already validated in middleware"

Bad entry:
- "Put it in the token"
-->

## Approaches Tried

<!--
Approaches tested within this scope, what happened, and why they were 
accepted or rejected. Prevents future sessions from repeating dead ends.

Format:
1. **[Approach name]** — [outcome]. Rejected/Accepted because [reason].

Good entry:
1. "Separate theme API call on page load — works but adds 50ms latency. 
   Rejected: extra network round-trip, causes flash of wrong theme."

Bad entry:
1. "Didn't work"
-->

## Architecture Notes

<!--
How this scope fits into the codebase. File locations, relevant code paths, 
dependencies specific to this scope.

Include:
- Key file paths with line numbers
- How this scope connects to the rest of the system
- Gotchas and non-obvious behavior

Good entry:
- "JWT signing at src/auth/token.ts:34 — claims object passed to sign() 
  at line 38. Theme field added after existing role/permissions claims. 
  Max token size concern if we add more fields later."

Bad entry:
- "Token stuff is in auth folder"
-->

## Open Questions

<!--
Unresolved issues within this scope that need human input or further exploration.

These should prompt action — not just be notes.

Good entry:
- "Should theme claim be in access token (short-lived, re-validated often) 
  or refresh token (long-lived, survives session)? Trade-off: security vs UX."

Bad entry:
- "Which token?"
-->
