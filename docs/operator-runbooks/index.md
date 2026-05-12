---
title: Operator runbooks
description: Bring-up, verification, and recovery — commands live next to prose.
---

## Bring-up (outline)

Exact commands drift with releases; this section names **families** of steps you must be able to perform:

1. **Dependencies** — Python, Postgres (or SQLite profile), optional Ollama.
2. **Schema and seed** — your installer (`root.py` / project equivalent) brings tables and baseline atoms.
3. **MCP** — SAP / Willow MCP connects to Postgres; `willow_status` (or equivalent) reports green.
4. **IDE** — Cursor or Claude Code configured with the MCP server and SAFE app id.

## Verification (what “green” means)

You should be able to answer **yes** without hand-waving:

- Can you query the knowledge table and see **typed** rows (not just an empty schema)?
- Can the IDE agent run **read** tools (search) and get bounded results?
- If Grove or tasks are in use, can you **observe** a message or job end-to-end?

## Recovery (families)

- **Postgres down** — local socket / docker / service user; restore from backup; never “just wipe” without an explicit owner decision.
- **MCP disconnected** — restart MCP server process; check portless vs networked mode; confirm SAFE gate paths.
- **Ollama optional** — embeddings and local chat may degrade; KB and Postgres can still be authoritative.

## Next

[Fleet process](/fleet-process) for how builders should behave around this stack.
