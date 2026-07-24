---
title: Fault diagnosis
description: Workshop chapter — Symptom trees before parts orders — isolate subsystem.
---
## Original manual role (Lambretta)

Symptom trees before parts orders — isolate subsystem. Diagnose before you strip;
a gate that denies you is not always a fault — sometimes it's the machine working.

## Willow mapping

- **Postgres up / MCP down vs both down** — different faults, different fixes.
- **SAFE denial vs a real missing file** — a deny can be the seat doing its job.
- **Ollama absent vs model missing** — the runtime vs the weights.
- **Grove delivery vs KB truth divergence** — the message arrived; is it *true*?

## Workshop procedures

### 1. First isolation

- **Postgres:** network vs local socket. `psql "$DSN" -c 'select 1'` → expect
  `1`. If it hangs it's the network/socket; if it refuses, the server is down.
- **MCP:** portless (stdio) vs networked. Run `session_enter` /
  `diagnostic_summary`. `verdict=ok` means the server is live and your manifest
  loaded; `verdict=broken` means it booted but can't see itself.

### 2. The signature fault — the env-less boot

The most common "everything is broken" is not broken castings, it's a bad
environment. If the MCP server spawns **before** the SessionStart hook writes the
env block, every `WILLOW_*` var is null, it falls back to `/root/.willow`, finds
no manifest, and **every call gate-denies.**

- **Tell:** `diagnostic_summary` → `verdict=broken`, no manifest found.
- **Cure:** **reconnect** — the server re-spawns from the correct env and comes
  up clean. Not a code fix; a re-seat.
- **Pass/fail:** after reconnect, `whoami` returns your real seat and grants.

### 3. Deny vs. defect

Before you call a gate-denial a bug, run `whoami` and read your grant. A seat
denied a permission it was never given is the ACL holding — **that is the tool
working, not failing.** (A read-only seat denied a write verb is correct; ask
the operator, don't file a fault.) Only a denial *against a grant you hold* is a
real defect.

### 4. Evidence

Capture the last 50 log lines and attach them to a ticket/gap atom for later —
`topic` + `question`, resolved with reopen-conditions. Don't fix from memory;
leave the trail.

## Notes for authors

Keep expanding with exact commands, expected outputs, and pass/fail criteria.
Cross-link to the Manual tab where the seat model and reconnect are introduced.
