---
title: Fault diagnosis
description: Workshop chapter — Symptom trees before parts orders — isolate subsystem.
---
## Original manual role (Lambretta)

Symptom trees before parts orders — isolate subsystem.
## Willow mapping

- Postgres up / MCP down vs both down.
- SAFE denial vs real missing file.
- Ollama absent vs model missing.
- Grove delivery vs KB truth divergence.
## Workshop procedures (scaffold)

### 1. First isolation

- Network vs local socket for Postgres.
- Portless vs networked MCP.

### 2. Evidence

- Capture last 50 log lines; store with ticket atom later.

## Notes for authors

Expand with **exact commands**, **expected outputs**, and **pass/fail** criteria like torque specs in the paper manual. Cross-link to the main Manual tab where concepts are introduced without repetition.
