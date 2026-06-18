<!-- 
INSTRUCTIONS: Use this template to create a new INDEX.md for a branch.
Copy the section headers (##) and content areas, but replace all 
guidance text and examples with real scratchpad content.
Blockquotes (>) are instructions — do not include them in the output.
-->

Active: INDEX.md

# Scratchpad: [branch-name]

## Status: planning

## Overview

> High-level summary of the branch. What is being done, why, and where things stand. This is the first thing an agent reads — make it count.
> 
> Update this whenever a new scope is created, the branch direction changes, major progress is made, or a blocker is hit or resolved.
>
> **Good:** "Refactoring the auth system to support SSO. JWT validation has been replaced with a pluggable provider model. Currently working on SAML integration — stuck on certificate validation."
>
> **Bad:** "Working on auth"

## Goal

> What is this branch trying to accomplish? Be specific. This should be stable — if the goal changes, the branch should probably change too.
>
> **Good:** "Replace the hardcoded role system with a permission-based model that supports custom roles per tenant."
>
> **Bad:** "Fix auth stuff"

## Scopes

> List of scoped scratchpads created via `/scope`. Each entry is a link with a one-line description.

- [example-scope.md](example-scope.md) — description of what this scope covers

## Key Decisions

> Branch-level design decisions that affect the overall direction. Scope-specific decisions go in their own scratchpad files.
>
> Format: `- [Decision]: [Rationale]`
>
> **Good:** "Using event sourcing for audit trail: regulatory requirement, need full history, append-only pattern fits our write-heavy workload"
>
> **Bad:** "Used event sourcing"

## Architecture Notes

> Branch-level architecture: how the major pieces fit together, key file locations, dependency chains. Scope-specific details go in their own scratchpad files.
>
> Include: key file paths with line numbers, dependency relationships, data flow, gotchas and non-obvious behavior.

## Open Questions

> Unresolved issues at the branch level that need human input or further exploration. Scope-specific questions go in their own scratchpad files. These should prompt action — not just be notes.
>
> **Good:** "Should we add integration tests for connection pooling before merging? Risk: the race is hard to reproduce without load testing."
>
> **Bad:** "Tests?"
