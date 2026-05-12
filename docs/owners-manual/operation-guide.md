---
title: Operation guide
description: Controls and normal operation — daily use of Willow without opening the engine.
---

## Before you ride (pre-flight)

- Confirm **Postgres** and **MCP** status the way your environment documents (`willow_status` pattern or equivalent).
- Confirm **SAFE** gate paths for this machine.
- Skim **open flags** in SOIL / dispatch if your fleet uses them.

## Starting and stopping

- **Start:** bring MCP → bring workers → open IDE session last.
- **Stop:** quiesce writers → stop task runners → MCP last (order may be site-specific; document yours here).

## Instruments and controls (metaphor)

| Control | Meaning |
|--------|---------|
| **KB search** | Read path for durable truth |
| **Grove** | Coordination and human-visible state |
| **Kart / queue** | Long or sharp tools kept out of the IDE hand |
| **Consent.json** (`willow-sandbox`) | Fuel tap — off means off |

## Normal riding

- Default to **local models** when that is your policy; cloud keys are optional accessories.
- Prefer **one ratified path** for ingest; side drafts belong in branches and sandboxes.

## Parking and theft

- Lock the **handlebar**: rotate keys, revoke tokens, close VPN tails — the boring anti-theft layer that saves you at 2 a.m.
