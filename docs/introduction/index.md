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

- **Willow 1.9** — production line: what you run when you need the graph, MCP, and fleet rails stable.
- **Willow 2.0 (in progress)** — **`willow-sandbox`**: corpus ingestion, consent-gated parsers, staged outputs, experiments that must not silently become “the main stack” without an explicit merge story.

Older public trees (for example **Willow 1.1**) are **historical**. Do not route new operators there.

## What you should have after this chapter

- Correct **default** for “where do I clone?” → **1.9**.
- Correct **default** for “where is scary corpus work?” → **sandbox**, with explicit consent and no silent KB writes inside the sandbox pipeline.

Next: [Architecture](/architecture).
