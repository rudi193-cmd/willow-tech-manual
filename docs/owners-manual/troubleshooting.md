---
title: Troubleshooting
description: Short symptom trees — Honda-style ‘if you notice …’ pages.
---

## Engine will not start

- **Symptom:** MCP tools return “not connected” or timeouts.
  - **Check:** process alive? port? `gh`/token if HTTPS remotes?
- **Symptom:** Postgres refused.
  - **Check:** socket, `pg_isready`, disk full?

## Poor performance

- **Symptom:** slow KB search.
  - **Check:** indexes, vacuum, pool exhaustion, Ollama embedder downgraded to CPU.

## Unusual sounds (metaphor)

- **Symptom:** duplicate atoms with same title.
  - **Check:** `willow_memory_check` when MCP healthy; archive extras instead of silent delete.

## If you are involved in a crash

1. **Safety first** — stop automated writers; freeze scope.
2. **Assess** — data loss vs availability vs confidentiality; name the blast radius.
3. **Recover** — restore from backup; replay ratified steps only.
4. **Record** — postmortem atom + frank-ledger style entry if your fleet uses one.

## Flat tire analogue

- **Symptom:** single dependency offline (Ollama, Redis if used, etc.).
  - **Check:** graceful degradation path documented for *this* deployment.
