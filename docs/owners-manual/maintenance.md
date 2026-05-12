---
title: Maintenance
description: Owner-level service — schedules and light wrenching; deep repair points to the Workshop tab.
---

## Dealer vs owner (roles)

- **Dealer analogue:** whoever runs production Postgres, backups, and upgrades for your org.
- **Owner analogue:** you, with this book and the **tool kit** (CLI access, SAFE app id, read-only break-glass).

## Owner maintenance schedule (fill with your dates)

| Interval | Task |
|----------|------|
| Daily | Status sweep; error log spot check |
| Weekly | Backup restore drill *or* verify backup exists |
| Monthly | KB growth / disk forecast |
| Quarterly | Credential rotation; dependency audit |

## When you need the shop manual

For strip/rebuild depth, use **[Workshop (Sticky spine)](/workshop)** — same relationship Honda draws between **Owner’s Manual** and **Service Manual**.

## Environmental responsibility

- Retire hardware sanely; scrub disks that held **SAFE** keys or **Postgres** data.
- Corpus paths: follow **PII scrub** rules before any KB promotion from sandbox outputs.
