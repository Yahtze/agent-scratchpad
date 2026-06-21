<!-- 
This is the default scratchpad file for a branch.
All content goes here — INDEX.md is just a pointer.

Write to this file as you work. Do not create additional .md files
unless the user explicitly runs /scope.
-->

# Scratchpad: [branch-name]

## Status: planning

## Key Decisions
> Branch-level design decisions that affect the overall direction.
> Format: `- [Decision]: [Rationale]`
>
> **Good:** "Using event sourcing for audit trail: regulatory requirement, need full history, append-only pattern fits our write-heavy workload"
> **Bad:** "Used event sourcing"

## Approaches Tried
> Approaches tested, what happened, and why they were accepted or rejected.
> Format: `1. **[Approach name]** — [outcome]. Rejected/Accepted because [reason].`
>
> **Good:** "Separate API call on page load — works but adds 50ms latency. Rejected: extra network round-trip."
> **Bad:** "Didn't work"

## Architecture Notes
> Key file locations, dependency chains, data flow, gotchas.
> Include file paths with line numbers.

## Work Log
> Running log of what was done. Newest entries at top.
> Format: `- [date] [what happened]`

## Open Questions
> Unresolved issues that need human input or further exploration.
> These should prompt action — not just be notes.
>
> **Good:** "Should we add integration tests for connection pooling before merging? Risk: the race is hard to reproduce without load testing."
> **Bad:** "Tests?"
