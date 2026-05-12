# Willow Technical Manual

Book-only repository: Markdown sources and a [Mintlify](https://mintlify.com) doc site (same stack family as [OpenClaw’s docs](https://github.com/openclaw/openclaw/tree/main/docs) — `docs.json` + `theme: mint`).

## Prerequisites

- Node.js 18+ and npm

## Local preview

```bash
cd /home/sean-campbell/github/willow-tech-manual
npm install
npm run dev
```

Mintlify runs inside `docs/` (where `docs.json` lives). It prints a local URL (often `http://localhost:3000`). Edit Markdown under `docs/`; the dev server hot-reloads.

## Check and ship

```bash
npm run validate    # strict — fails on warnings in CI
npm run build       # static export (mintlify export)
```

`npm run build` writes **`docs/export.zip`** — unpack and publish that tree to any static host, or wire CI to upload it.

## Layout

| Path | Role |
|------|------|
| `docs/docs.json` | Site name, theme, colors, navigation |
| `docs/index.md` | Home page (README-shaped introduction) |
| `docs/introduction/` | Chapter 1 — orientation and map |
| `docs/architecture/` | System shape |
| `docs/operator-runbooks/` | How to run and recover |
| `docs/fleet-process/` | Agents, MCP, ingest, worktrees |
| `docs/reference/` | Glossary and tables |

Canon for the narrative: **Willow 1.9** is current production (`willow-1.9`); **2.0** work lives in `willow-sandbox` on disk — the manual states that explicitly so readers are not sent to legacy trees.

## License

MIT (match Willow stack unless you change this file).
