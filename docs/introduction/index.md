---
title: Introduction
description: Chapter 1 — orientation, vocabulary, and the README contract for the whole manual.
---

## README contract

This chapter behaves like a **repository README** expanded to book scale:

- **What** Willow is in one paragraph.
- **Where** the code and sandboxes live.
- **How** to get from zero to a verified node (high level — runbooks carry commands).
- **Where to go next** in this site.

## What Willow is (one paragraph)

Willow is a **local-first** stack for AI-assisted work: typed **knowledge atoms** in **Postgres** (or SQLite on constrained devices), structured **SOIL** records, a **Grove** bus for agent coordination, a **task queue** for shell work, **MCP** as the IDE-facing tool surface, and **skills** as Markdown behavioral contracts that are not vendor-locked. **Ollama is the default model path** in the product story; cloud keys are optional add-ons. **Nodes can talk on a LAN** without routing through a third-party relay when you run the stack’s serve path.

## Vocabulary (minimum set)

| Term | Meaning |
|------|---------|
| **Atom** | A row-shaped unit in the Postgres knowledge table (title, summary, domain, provenance). |
| **SOIL** | Structured local store collections (e.g. flags, agent-scoped records) — not the same as KB atoms. |
| **Grove** | Message bus between agents; coordination and ACKs, not the system of record for long-form truth. |
| **MCP** | Model Context Protocol server(s) exposing tools to the IDE agent; Postgres health and KB tools typically live here. |
| **SAFE** | Authorization gate for paths and capabilities in your deployment. |
| **Fylgja powers** | Short Markdown “powers” used as the low-token behavioral router before loading long skills. |

## Version line (non-negotiable wording)

These are **distinct machines**, each on its own spec — not rebadges of one another (willow-mcp is **not** a renamed willow-2.0; see the migration inventory).

- **`willow-mcp`** — **current substrate**: the re-scoped re-implementation of the SOIL/KB/dispatch core that the fleet (UTETY / Jeles / Nest) runs today. What you clone for operations.
- **`willow-2.0`** — **legacy / migration source**: a large 169-tool surface, much of it `full`-profile-only and untested. Being migrated *from* — not "the main stack," not forward R&D.
- **`willow-1.9`** — **archived** prior production (April–May line; clean-break rewrite of 1.7). Repo archived; do not route new operators there.

Older public trees (for example **Willow 1.1 / 1.7**) are **historical**.

## What you should have after this chapter

- Correct **default** for “where do I clone?” → **`willow-mcp`**.
- Correct **default** for “where is scary corpus work?” → a **consent-gated** path with **no silent KB writes** — now a willow-mcp capability (`subject_consent`), not a separate sandbox repo.

Next: [Architecture](/architecture).
