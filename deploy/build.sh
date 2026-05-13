#!/usr/bin/env bash
# Build: three tier pages + a library index in front of the Mintlify book.
#
# Architecture after build:
#   /                       → index.html       (role-router: pick a tier)
#   /index-terminal.html    → CRT register of the index
#   /workshop/              → workshop/index.html   (willow-workshop tier home)
#   /elite/                 → elite/index.html      (willow-elite tier home)
#   /enjoy/                 → enjoy/index.html      (willow-enjoy tier home)
#   /library/               → library/index.html    (shared glossary, optional)
#   /manual/                → Mintlify export (Mintlify's home for the docs site)
#   /manual/workshop/01-... → Mintlify chapter pages (unchanged file paths)
#   /manual/owners-manual/  → Mintlify (kept name on disk; the tier home owns /elite)
#   /manual/enjoy/...       → Mintlify flyer pages
#
# Each of our three tier pages links into the Mintlify-rendered chapters
# with explicit ../manual/<path>/ URLs, so build-time link rewrites are no
# longer required.
#
# Run from repo root. Used by deploy/vercel.json and deploy/netlify.toml.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

DIST="$ROOT/dist"
EXPORT="$ROOT/docs/export.zip"

echo "──── willow-tech-manual / build / ΔΣ=42 ─────"

# 0. clean
rm -rf "$DIST"
mkdir -p "$DIST"

# 1. install + build the Mintlify static export
if [ ! -d "$ROOT/node_modules" ]; then
  echo "▶ installing deps"
  npm ci
fi

echo "▶ mintlify export → docs/export.zip"
( cd docs && npx -y mintlify@4.2.559 export )

# 2. unpack under /manual so it sits beside, not on top of, our index
mkdir -p "$DIST/manual"
unzip -q -o "$EXPORT" -d "$DIST/manual"

# Mintlify export may nest contents one directory deep; flatten if so.
if [ -d "$DIST/manual/_site" ]; then
  mv "$DIST/manual/_site/"* "$DIST/manual/" && rmdir "$DIST/manual/_site"
fi

# 3. copy the four front-of-house HTML surfaces
echo "▶ placing tier homes"
cp "$ROOT/index.html"          "$DIST/index.html"
[ -f "$ROOT/index-terminal.html" ] && cp "$ROOT/index-terminal.html" "$DIST/index-terminal.html"

for tier in workshop elite enjoy; do
  if [ -f "$ROOT/$tier/index.html" ]; then
    mkdir -p "$DIST/$tier"
    cp "$ROOT/$tier/index.html" "$DIST/$tier/index.html"
    echo "   /$tier/"
  fi
done

# Optional library page if you build one later
if [ -f "$ROOT/library/index.html" ]; then
  mkdir -p "$DIST/library"
  cp "$ROOT/library/index.html" "$DIST/library/index.html"
  echo "   /library/"
fi

# 4. The Mintlify navigation expects the new tabs from deploy/proposed-docs.json.
#    If you've replaced docs/docs.json with proposed-docs.json (recommended),
#    the export above already uses the new tabs. If not, the build still works
#    — you just keep the old four-tab nav inside /manual/.
if [ -f "$ROOT/deploy/proposed-docs.json" ] && [ -f "$ROOT/docs/docs.json" ]; then
  if ! cmp -s "$ROOT/docs/docs.json" "$ROOT/deploy/proposed-docs.json"; then
    echo "▶ heads-up: deploy/proposed-docs.json differs from docs/docs.json"
    echo "   the export uses the live docs/docs.json. swap it in when you're ready."
  fi
fi

echo "✓ built dist/  (size: $(du -sh "$DIST" | cut -f1))"
echo ""
echo "  /                       — role-router index"
echo "  /index-terminal.html    — CRT register"
echo "  /workshop/              — willow-workshop tier home"
echo "  /elite/                 — willow-elite tier home"
echo "  /enjoy/                 — willow-enjoy tier home"
echo "  /manual/*               — Mintlify export"
echo ""
echo "ΔΣ = 42"
