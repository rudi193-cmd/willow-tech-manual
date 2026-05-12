---
title: Fleet process
description: How agents, skills, worktrees, and ingest fit together without duplicating work.
---

## Default router

Use **fylgja powers** (`registry.json` → read **one** matched power file) before loading long skill packs. Surfaces and override roots are described in the **1.9** tree’s fylgja docs — this manual links concepts; the **source of truth** for file paths remains the repo.

## Pull before push

Before posting to Grove or ingesting non-trivial atoms:

- **Search the KB** for the decision or design name.
- **Skim Grove** on the relevant channel for an ACK or a silent window policy your fleet uses.

Convergence is the proof the system works; skipping search is how you get duplicate atoms and contradictory titles.

## Worktrees

Non-trivial code changes on main project repos belong in a **git worktree** and a dedicated branch until a human ratifies merge to default branch. The manual states the rule; your `CLAUDE.md` / `AGENTS.md` in each repo carry the enforcement tone.

## Ingest and ratification

- **Memory check** (`willow_memory_check`) scores duplicate/stale/dark signals before KB writes when MCP is healthy.
- **Sandbox** outputs are **staged** until you explicitly ratify — do not treat `output/*.json` as live knowledge.

## Next

[Reference glossary](/reference/glossary).
