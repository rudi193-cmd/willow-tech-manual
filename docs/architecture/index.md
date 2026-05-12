---
title: Architecture
description: Data planes, boundaries, and how the pieces depend on each other.
---

## Planes

Willow separates concerns so you can reason about failure:

1. **Knowledge plane (Postgres `knowledge`)** — long-lived atoms; search before write; archive instead of delete.
2. **Structured local plane (SOIL)** — operational and agent-scoped records; fast local queries; different retention rules than KB.
3. **Coordination plane (Grove)** — messages, threads, human-visible state transitions; not a substitute for KB.
4. **Execution plane (Kart / shell queue)** — long commands and machine work off the hot path of the IDE.
5. **IDE tool plane (MCP)** — what the assistant in Cursor/Claude Code actually calls; must stay consistent with SAFE.

## Boundary rules (short)

- **KB writes** go through deliberate ingest paths; agents namespace their durable notes (e.g. builder vs public vs opus tiers — follow your deployment’s rule table).
- **Grove** is for **communication**, not for replacing atoms when a fact must survive six months.
- **Sandbox parsers** stage to **`output/`** (or equivalent) until a human ratification step promotes into KB — the sandbox README in `willow-sandbox` is canonical for that repo’s promise.

## Failure modes this architecture prevents

- “The fleet **said** it in chat” becoming the only record of an invariant.
- Silent promotion of **experimental** parsers into production KB without review.
- IDE tools bypassing **SAFE** because someone hardcoded a path in a one-off script.

## Next

[Operator runbooks](/operator-runbooks) for concrete bring-up and health checks.
