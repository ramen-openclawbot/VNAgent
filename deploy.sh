#!/bin/bash
# ============================================
# VNAgent.ai — deploy to Cloudflare
# vnagent.ai + www.vnagent.ai are custom domains of the
# static-assets Worker "soft-wave-828a" (not Cloudflare Pages).
# Deploys only the committed site files from HEAD.
# Usage: bash deploy.sh
# ============================================
set -euo pipefail
export PATH="$HOME/.npm-global/bin:$PATH"

cd "$(dirname "$0")"
OUT="$(mktemp -d)/public"
mkdir -p "$OUT"
for f in index.html favicon.svg logo.html; do
  git show "HEAD:$f" > "$OUT/$f"
done

echo "🚀 Deploying $(git rev-parse --short HEAD) → Worker soft-wave-828a..."
wrangler deploy --name soft-wave-828a --assets "$OUT" --compatibility-date 2026-03-29

echo "✅ Done. Verify: curl -s https://vnagent.ai/ | shasum -a 256 vs git show HEAD:index.html | shasum -a 256"
