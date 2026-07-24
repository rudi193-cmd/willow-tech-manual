---
title: Glossary
description: Short definitions and cross-links — expand as the manual grows.
---

| Term | Definition |
|------|------------|
| **Atom** | Knowledge row: durable claim or pointer with metadata; stored in Postgres in production profiles. |
| **Archive (domain)** | KB atoms moved aside without deletion — invalidation or domain move per policy. |
| **Consent gate** | Parsers refuse work unless consent enables a source — never silent KB promotion. In `willow-mcp` this is `subject_consent`; the `willow-2.0` sandbox had the earlier `consent.json` form. |
| **Fylgja** | Willow’s lightweight skill/power routing layer (Markdown). |
| **Grove** | Fleet message bus for threads and coordination. |
| **Kart** | Queued shell execution for longer jobs. |
| **MCP** | Model Context Protocol tool server used by the IDE agent. |
| **Mintlify** | Static doc framework used by this book (OpenClaw-style `docs.json`). |
| **SAFE** | Path and capability authorization in your environment. |
| **SOIL** | Structured local store (collections) distinct from Postgres KB atoms. |
| **Worktree** | Parallel git checkout for isolated development before merge. |
