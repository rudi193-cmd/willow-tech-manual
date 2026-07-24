---
title: Appendix D — Jetting for standard machines
description: Workshop chapter — Baseline mixture for stock carbs — default configs.
---
## Original manual role (Lambretta)

Baseline mixture for stock carbs — default configs. This is the *safe, stock*
jetting. A tuned build (a reed motor on a big carb) needs richer jetting — and a
tuned Willow needs explicit grants, not defaults. Know the stock baseline before
you rejet.

## Willow mapping

- Default model routes.
- Default embedder.
- Baseline `consent.json` — **all-off** in sandbox.
- Standard fylgja / power pick order.

## Workshop procedures

### 1. Baseline profile — one 'stock' reference host

Document a single known-good stock host so any other machine has something to be
compared against:

- **Model routes:** the default route answers a trivial call.
- **Embedder:** the default embedder loads and returns a vector.
- **Consent:** sandbox `consent.json` is **all-off** — no corpus/KB work happens
  silently. Grants are added deliberately, never assumed.
- **Power/pick order:** the standard fylgja selection resolves in order.

- **Pass/fail (stock idles clean):** boots with consent all-off, the default
  route answers, the embedder loads — and **nothing** touches the KB without a
  grant.

### 2. Rejetting for a tuned build

Off-baseline is a *decision*, logged like a jet change. Richer mixture (broader
consent, corpus routes, non-default models) is fine when the build calls for it —
but write down the change and why, the same way you'd note a main-jet size. No
silent KB promotion is the lean-seizure you're jetting to avoid.

## Notes for authors

Keep expanding with exact commands and pass/fail. Cross-link to the consent model
in the Manual tab; keep the stock baseline and the tuned case clearly separated.
