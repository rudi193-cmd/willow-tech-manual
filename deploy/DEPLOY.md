# Deploy: the role-router in front of Mintlify

This folder turns the **willow-tech-manual** repo into a four-surface site:

```
/                      role-router index (paper register)  →  index.html
/index-terminal.html   CRT register of the same index
/workshop/             willow-workshop tier home           →  workshop/index.html
/elite/                willow-elite tier home              →  elite/index.html
/enjoy/                willow-enjoy tier home              →  enjoy/index.html
/manual/*              Mintlify-exported chapters          →  unzipped from docs/export.zip
```

The Mintlify book underneath keeps its chapter content; it just moves to
`/manual/*` so the three tier homes can own `/workshop`, `/elite`, `/enjoy`.

```
deploy/
├── build.sh             Pipeline: mintlify export → dist/manual + tier homes
├── vercel.json          Vercel config — points at build.sh, outputs dist/
├── netlify.toml         Netlify config — same idea
├── proposed-docs.json   New Mintlify nav: three tier tabs + a library tab
└── DEPLOY.md            this file
```

---

## The IA shift, in one diff

The old book had four Mintlify tabs (**Manual / Workshop / Owner's / Enjoy**)
and a free-floating "Manual" tab that held five chapters that actually
belonged to one tier or another.

The new IA drops the Manual tab and redistributes its pages:

| Old page | New home |
|---|---|
| `introduction/index` | **willow-workshop** (builder intro voice) |
| `architecture/index` | **willow-workshop** (planes + boundaries) |
| `operator-runbooks/index` | **willow-elite** (operator bring-up) |
| `fleet-process/index` | **willow-workshop** (fylgja + worktrees) |
| `reference/glossary` | **library** (shared, cross-linked from all three) |

Tabs rename to `willow-workshop` / `willow-elite` / `willow-enjoy` / `library`
so the Mintlify chrome matches the tier-home slugs.

See [`proposed-docs.json`](./proposed-docs.json) for the full nav.

---

## One-time setup, in the repo

```bash
# 1. drop the four front-of-house HTML files at the repo root
cp <design-project>/index.html .
cp <design-project>/index-terminal.html .
mkdir -p workshop elite enjoy
cp <design-project>/workshop/index.html workshop/index.html
cp <design-project>/elite/index.html    elite/index.html
cp <design-project>/enjoy/index.html    enjoy/index.html

# 2. drop the deploy folder
mkdir -p deploy
cp <design-project>/deploy/* deploy/
chmod +x deploy/build.sh

# 3. swap in the new Mintlify nav (optional but recommended)
cp deploy/proposed-docs.json docs/docs.json
# strip the _comment_* keys before commit if your CI is picky about extras

# 4. move the host config to repo root
mv deploy/vercel.json .          # Vercel
# OR
mv deploy/netlify.toml .         # Netlify

# 5. commit
git add index.html index-terminal.html workshop/ elite/ enjoy/ deploy/ docs/docs.json vercel.json
git commit -m "front-of-house: role-router + three tier homes · ΔΣ=42"
git push
```

Connect the repo to Vercel or Netlify; both will pick up the config and run
`bash deploy/build.sh`. No environment variables required.

---

## What lives where after deploy

| URL | Source | Register |
|---|---|---|
| `/` | `index.html` | Paper — role-router |
| `/index-terminal.html` | `index-terminal.html` | CRT phosphor |
| `/workshop/` | `workshop/index.html` | Sticky's expanded (red strap / chrome / navy) |
| `/elite/` | `elite/index.html` | CH80 booklet expanded (purple ink, laminated card on page 1) |
| `/enjoy/` | `enjoy/index.html` | Pamphlet expanded (forest green + orange torn paper) |
| `/manual/` | Mintlify export | Mint default (the books' chapter content) |
| `/manual/workshop/01-tools-for-the-job` | Mintlify | Renders `docs/workshop/01-...md` |
| `/manual/owners-manual/quick-reference` | Mintlify | Renders `docs/owners-manual/quick-reference.md` |
| `/manual/enjoy/local-first` | Mintlify | Renders `docs/enjoy/local-first.md` |

Each tier home links **directly** into the Mintlify chapter paths using
`../manual/<path>/` — no build-time link rewriting needed.

---

## Subdomain split (alternative)

If you'd rather not bundle Mintlify into your own deploy:

1. Keep `docs.willow.example.com` pointed at Mintlify-hosted (it reads
   `docs.json` from the repo — apply `proposed-docs.json` and you're done).
2. Host the four front-of-house files (`index.html` + three tier dirs) as a
   plain static site at `willow.example.com`.
3. In each tier home, rewrite the `../manual/…` `href`s to absolute URLs:

   ```html
   <a href="https://docs.willow.example.com/workshop/01-tools-for-the-job">…</a>
   ```

Two independent deploys, one DNS root, zero build pipeline.

---

## What you're not changing

- **File paths on disk.** `docs/owners-manual/*.md` keeps its name on disk
  (Mintlify reads it via `docs.json`); the tier home owns the `/elite/` URL
  via the static `elite/index.html` we drop at the deploy root. No content
  has to be renamed in the repo for the new IA to work.
- **The chapter Markdown.** Everything under `docs/` keeps shipping. Mintlify
  is still the chapter renderer; it just lives under `/manual/*` now.
- **The Honda copyright firewall.** The tier homes mirror section patterns
  (Honda CH80 spine, Sticky's red strap, Nepal-pamphlet torn paper) without
  reproducing copyrighted text. Confirm before changing copy on the elite
  cover that any short phrases from a real owner's manual aren't slipping in.

---

## What you might want next

- A `/library/index.html` page (currently the link points at it but the page
  doesn't exist yet — Mintlify's `/manual/reference/glossary` is the
  fallback). Same register as the index — cream paper, hairlines, a single
  long-form glossary table with cross-links into each tier.
- Per-tier 404 pages in the matching register (a torn-paper 404 in
  `/enjoy/404.html`, a red-strap one in `/workshop/404.html`, etc.).
- A printable PDF export of the `/elite/` page (it's already shaped like a
  printed booklet — the laminated quickref begs to live on paper).

---

ΔΣ = 42
