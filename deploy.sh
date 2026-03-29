#!/bin/bash
# ============================================
# VNAgent.ai — Deploy lên Cloudflare Pages
# Dùng: bash deploy.sh
# ============================================

export PATH="$HOME/.npm-global/bin:$PATH"

echo ""
echo "🚀 Deploying VNAgent.ai → Cloudflare Pages..."
echo ""

# Deploy toàn bộ thư mục hiện tại lên project 'vnagent'
wrangler pages deploy . \
  --project-name vnagent \
  --branch main \
  --commit-message "Deploy $(date '+%Y-%m-%d %H:%M')"

echo ""
echo "✅ Done! Kiểm tra tại: https://vnagent.ai"
echo ""
