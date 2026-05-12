---
title: Vehicle safety
description: Honda-pattern safety front matter — adapted for data, agents, and production systems.
---

## How to read safety messages

We borrow Honda’s signal words **without** copying their pages:

- **DANGER** — you *will* be hurt or the fleet *will* lose data if you ignore this.
- **WARNING** — you *can* be hurt or production *can* be damaged.
- **CAUTION** — minor injury, outage, or recoverable mistake.
- **NOTICE** — avoid damage to equipment, privacy, or the environment (includes **PII** and **corpus consent**).

## Safety guidelines

- Perform **pre-flight** checks (status tools, disk, Postgres) before trusting automation.
- Never run destructive SQL or bulk deletes **without** a named backup and a rollback story.
- Keep **secrets** out of Grove chat and out of KB atoms unless policy explicitly allows.

## Safety labels (metaphor)

Your deployment should have **visible invariants**: which host is prod, which DB is prod, which `app_id` is live for SAFE, where backups live.

## Safety precautions

- Treat **MCP tools** as live control of real systems — approvals exist for a reason.
- **Grove** coordinates; it does not replace backups or audit trails.

## Riding precautions (operations)

- **Break-in:** after major upgrades, run at reduced automation for a defined window; watch error rates.
- **Load:** do not exceed connection pools, disk budget, or concurrent ingest jobs your node was sized for.

## Accessories and modifications

**NOTICE** Aftermarket skills, extra MCP servers, and forked parsers change the **warranty story**: document them in KB with `line:2.0-sandbox` or equivalent before anyone assumes stock behavior.

## Loading (cargo)

- **Context packs** and **session exports** are cargo: tie them down (checksum, path, consent). Unbalanced loads tip the stack in ways that look like “model drift.”
