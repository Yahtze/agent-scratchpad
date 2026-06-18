Active: INDEX.md

# Scratchpad: [branch-name]

## Status: planning

## Overview

<!-- 
High-level summary of the branch. What is being done, why, and where things stand.
This is the first thing an agent reads — make it count.

Update this whenever:
- A new scope is created
- The branch direction changes
- Major progress is made
- A blocker is hit or resolved

Good overview example:
"Refactoring the auth system to support SSO. JWT validation has been replaced 
with a pluggable provider model. Currently working on SAML integration — 
stuck on certificate validation. Two approaches tried so far (see Approaches Tried)."

Bad overview:
"Working on auth"
-->

## Goal

<!--
What is this branch trying to accomplish? Be specific.
This should be stable — if the goal changes, the branch should probably change too.

Good goal:
"Replace the hardcoded role system with a permission-based model that supports 
custom roles per tenant. Migration path must preserve existing admin/editor/viewer 
mappings."

Bad goal:
"Fix auth stuff"
-->

## Scopes

<!--
List of scoped scratchpads created via /scope. Each entry is a link with a 
one-line description of what that scope covers.

- [auth-refactor.md](auth-refactor.md) — refactoring auth middleware to support theme persistence
- [api-design.md](api-design.md) — designing the new v2 endpoints
-->

## Key Decisions

<!--
Branch-level design decisions that affect the overall direction.
Scope-specific decisions go in their own scratchpad files.

Format:
- [Decision]: [Rationale]

Good entry:
- "Using event sourcing for audit trail: regulatory requirement, need full history, 
  append-only pattern fits our write-heavy workload"

Bad entry:
- "Used event sourcing"
-->

## Architecture Notes

<!--
Branch-level architecture: how the major pieces fit together, key file locations, 
dependency chains. Scope-specific details go in their own scratchpad files.

Include:
- Key file paths with line numbers
- Dependency relationships
- Data flow
- Gotchas and non-obvious behavior
-->

## Open Questions

<!--
Unresolved issues at the branch level that need human input or further exploration.
Scope-specific questions go in their own scratchpad files.

These should prompt action — not just be notes.

Good entry:
- "Should we add integration tests for connection pooling before merging? 
  Risk: the race is hard to reproduce without load testing."

Bad entry:
- "Tests?"
-->
