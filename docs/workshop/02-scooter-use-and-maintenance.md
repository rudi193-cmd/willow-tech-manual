---
title: Scooter use and maintenance
description: Workshop chapter — Running-in, fluids, routine checks — what owners do between rebuilds.
---
## Original manual role (Lambretta)

Running-in, fluids, routine checks — what owners do between rebuilds. Know what
"normal" looks like *before* you strip anything, or every later chapter lies to
you.

## Willow mapping

- `willow_status` / `diagnostic_summary` on a schedule.
- Disk and Postgres growth; vacuum policy.
- Credential rotation cadence.
- Backup restore drill, quarterly.

## Workshop procedures

### 1. Daily / weekly — the walk-around

- **Health green:** `session_enter` + `diagnostic_summary` → `verdict=ok`.
- **MCP session alive:** `whoami` returns your seat, not an empty manifest.
- **Pass/fail:** zero *unexpected* gate-denials (an expected deny against a verb
  you don't hold is normal — see Fault diagnosis §3).

### 2. Scheduled — fluids and levels

- **KB growth snapshot:** row counts per DB; watch the curve, not the number.
- **SOIL collection stats** if used.
- **Disk + Postgres growth / vacuum:** keep ahead of it; a full box deletes
  before it writes.
- **Credential rotation** on cadence — reading a key is fine, holding a stale one
  is not.

### 3. Quarterly — the restore drill

Prove the vault actually restores before you need it to. Run the **bench roll**
(Tools for the job §2) against the backup and confirm the rebuilt KB answers one
`knowledge_search` at the expected row count. Verify freshness by newest content
**date**, not by the README.

- **Pass/fail:** a from-cold rebuild serves one real query. If it can't, the
  backup is decoration.

## Notes for authors

Keep expanding with exact commands, expected outputs, and pass/fail criteria.
Cross-link to Tools for the job (the bench roll) and to Fault diagnosis.
