---
title: Tools for the job
description: Workshop chapter — the bench kit and specialist tools you lay out before you touch a casting, a query, or a gate.
---
## Original manual role (Lambretta)

Bench kit and specialist tools before you touch castings or wiring. Sticky's
rule holds: a tool roll is not a pile of tools. It is curated, laid out in the
order you reach for it, weighted toward what *this* build actually needs, and it
**respects the structural joints instead of grinding them down** to make a job
easier.

## Willow mapping

Willow is three eras of hardware in one machine — Windows-era KB → `willow-1.9`
→ `willow-sandbox`/MCP. Like a largeframe wearing a later fork, the fasteners
come from different decades, so the kit has to span them. Baseline bench kit:

- **CLI:** `git`, `python3`, a Postgres client (`psql` or a GUI), `curl`.
- **IDE:** Cursor / Claude Code with MCP configured (your `app_id`, not the
  orchestrator seat).
- **SAFE:** the path gate and the `app_id` you actually hold — read your grant
  before you reach past it.
- **Logs:** `journalctl` or the project log paths.

## Workshop procedures

Two rolls, because there are two jobs. Don't carry the bench roll on a shakedown
ride, and don't try to rebuild the machine with the ride roll.

### 1. Minimum kit — the ride roll (a live session)

The plug-and-jet kit you reach for every session doing memory work.

- Postgres client for your role — read-only unless your grant says otherwise.
- Grove / MCP restart literacy (a stale server boots env-less and every call
  gate-denies; a reconnect is the cure — `diagnostic_summary` is the tell).
- The **ratification record shape**, because it is the structure everything
  clamps to: `kind / statement / source / sealed / ratified_by / ratified /
  round / topic`; typed lineage edges that cite evidence; gap records
  (`topic / question`) resolved *with reopen-conditions*.
- **Pass/fail:** an atom is only sealed when `sealed=true` **and** carries a
  real `ratified_by`. A machine may propose the seal; only the operator
  confirms it. No silent KB promotion — ever.

### 2. Specialist — the bench roll (cold start / rebuild)

Reach for this when the box has been reclaimed and you are rebuilding the KB
layer from the vault.

- `pg_dump` / restore path for your backup policy; `pgvector` for the corpus.
- The **reconstruction recipe** — the half the vault's `restore-and-wire`
  doesn't cover: load the corpus, load the curated KB, complete the aux-table
  schema, then build the union VIEW that normalises every era into the canonical
  `id / content / domain / source / tags`.
- `sqlite3` for the Termux profile if applicable; DB-inventory probes to read
  legacy stores across all three eras.
- **Pass/fail:** the live KB answers one `knowledge_search` with the expected
  row count before you trust it. Verify staleness by newest content date, not
  by the README.

## Bench discipline (torque-spec, not suggestion)

- **Route around the structural joints — don't grind them.** The SAFE gate and
  the seat ACL are load-bearing. When a seat is denied a permission, you *ask
  the operator* — you do not weld write-access into your own manifest to make
  the job flow. A tool that self-grants a write-capable seat is the grinder
  taken to the steering fork; it stays **out of the roll**.
- **Inspect the welds.** Any spliced/vendored joint (a hook copy that must stay
  byte-identical, a shared consent core) gets a crack-check every time it
  changes. The parity test *is* the weld inspection — run it; it catches the
  hairline before the road does.
- **Mock before you commit.** Bend the welding rod to the path before you buy
  the braided line: reproduce the real CI locally before you push. A promise is
  only kept if a test goes red when it breaks.
- **Clamp static, loop at the moving ends.** Seal and pin what's stable
  (ratified atoms); leave service slack where things still move (candidates and
  open gaps).

## Where these live

The scripts behind these procedures are persisted in `willow-mcp/scripts/`
(`reconstruction/`, `ratification/`, `diagnostics/`), indexed by
`scripts/TOOL_ROLL.md`. They're an as-run snapshot — hoist the hardcoded
`/workspace` roots and DB names for your host before reuse. The bench roll's
canonical long-term home is `sean-data-vault/scripts/`, next to
`restore-and-wire.sh`.

## Notes for authors

Keep expanding with **exact commands**, **expected outputs**, and **pass/fail**
criteria like torque specs in the paper manual. Cross-link to the main Manual
tab where concepts are introduced, without repetition. Chapter provenance: this
edition mirrors the Sticky manual's spine; the body is Willow.
