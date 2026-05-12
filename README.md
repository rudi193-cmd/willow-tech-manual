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
npm run check     # internal links (current Mintlify CLI)
npm run build     # static site → docs/export.zip (uses mintlify@4.2.559 for export)
```

`npm run dev` uses your **installed** Mintlify (newer CLI). `npm run build` pins **4.2.559** because `export` was removed in some later CLI builds.

## Layout

| Path | Role |
|------|------|
| `docs/docs.json` | Site name, theme, colors, navigation |
| `docs/index.md` | Home page (README-shaped introduction) |
| `docs/introduction/` | Chapter 1 — orientation and map |
| `docs/architecture/` | System shape |
| `docs/operator-runbooks/` | How to run and recover |
| `docs/fleet-process/` | Agents, MCP, ingest, worktrees |
| `docs/workshop/` | **Sticky spine** — 17 chapters + appendices (workshop manual) |
| `docs/reference/` | Glossary and tables |

Canon for the narrative: **Willow 1.9** is current production (`willow-1.9`); **2.0** work lives in `willow-sandbox` on disk — the manual states that explicitly so readers are not sent to legacy trees.

## License

MIT (match Willow stack unless you change this file).
