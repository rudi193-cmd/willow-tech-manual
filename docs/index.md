---
title: Willow Technical Manual
description: README-shaped home for operators and builders — local-first stack, fleet rails, and where 2.0 lives.
---

## What this book is

This manual is the **long-form technical surface** for Willow: the local-first knowledge stack, how you run it, how you extend it, and how the **agent fleet** is supposed to behave around it. It is **not** the marketing site and **not** chat-session lore. It is what a cold engineer reads to become productive without sitting in your channel history.

## Who it is for

- **Operators** — install, health, backups, Postgres, MCP, day-two troubleshooting.
- **Builders** — schema boundaries, ingest and ratification, worktrees, Grove, SAFE, Kart.
- **Future you** — the map of what is **production today** versus **experimental next**.

## Prerequisites (to use this book)

- Basic **Linux shell** and **git**.
- **Python 3** for Willow tooling.
- For production-shaped reading: a mental model of **Postgres** (knowledge atoms) and optional **SQLite** (e.g. Termux).

## Quick start (read order)

1. [Introduction](/introduction) — canonical paths, version line (1.9 vs 2.0), vocabulary.
2. [Architecture](/architecture) — KB, SOIL, Grove, tasks, MCP, consent boundaries.
3. [Operator runbooks](/operator-runbooks) — bring-up, verify, recover.
4. [Fleet process](/fleet-process) — fylgja powers, handoffs, worktrees, ingest etiquette.
5. [Reference](/reference/glossary) — terms and pointers.

**Workshop path:** if you want the **Sticky manual spine** (tools → maintenance → diagnosis → strip → rebuild → appendices), open the **Workshop (Sticky spine)** tab, starting at [Workshop edition](/workshop).

**Glove-box path:** for the **Honda owner’s-book** shape (safety → operation → maintenance → troubleshooting → information → specifications), open **Owner's manual (Elite)**, starting at [that edition’s home](/owners-manual).

## Map of the trees (do not guess)

| Line | Role | Typical path on disk |
|------|------|----------------------|
| **Willow 1.9** | Current production stack | `willow-1.9` (clone of `rudi193-cmd/willow-1.9`) |
| **Willow 2.0 sandbox** | Forward R&D — corpus ingest, gated parsers, staged outputs | `willow-sandbox` |
| **This repo** | Documentation only — no runtime | `willow-tech-manual` |

If a paragraph does not say which line it applies to, default to **1.9** for operations and **sandbox** only when the text names corpus consent, staged JSON, or 2.0 migration topics.

## Contributing

Edit Markdown under `docs/`, then `npm run dev` from the repo root. Keep chapters **testable**: every procedure should name a command or a file path a reader can verify.
