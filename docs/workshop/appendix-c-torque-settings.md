---
title: Appendix C — Torque settings
description: Workshop chapter — Numeric tightening — no 'good and tight'.
---
## Original manual role (Lambretta)

Numeric tightening — no "good and tight." A torque figure is measured, not
guessed. Where a spec is unverified it reads **`[MEASURE]`**, never a
plausible-looking number — the same axiom the whole stack runs on: *we do not
guess, we measure.*

## Willow mapping

- Pool sizes, statement timeouts.
- Token limits per call.
- File-size caps for ingest.
- Retry counts and backoff.

## Workshop procedures

### 1. Settings table

Confirm every `[MEASURE]` against the live config for your host before you rely
on it. Both directions bite: **under-torqued** (too loose) and **over-torqued**
(too tight) each have a symptom.

| Parameter | Spec | Under (too loose) | Over (too tight) |
|---|---|---|---|
| PG connection pool | `[MEASURE]` per host | idle connections wasted | "too many clients" / pool exhausted |
| `statement_timeout` | `[MEASURE]` per host | runaway query holds locks | good queries killed mid-flight |
| Token limit / call | `[MEASURE]` per model route | budget wasted | silent context truncation |
| Ingest file-size cap | `[MEASURE]` per config | OOM / slow index | files silently skipped |
| Retry count / backoff | **4 tries · 2s → 4s → 8s → 16s** | gives up on a blip | hammers a down remote |

### 2. Reading the spec

A number here is a **fastener spec, not a preference.** If you can't cite where
the value comes from, it's `[MEASURE]` and you go and read it — you don't turn it
"until it feels right." An unsourced torque figure is how a steering joint lets
go.

## Notes for authors

Replace each `[MEASURE]` with the verified value **and its source** (config path
or code ref). Keep the under/over columns — they're the diagnosis when a setting
is wrong.
