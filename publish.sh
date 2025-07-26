#!/usr/bin/env bash
set -e
IMAGE=infisical/infisical:latest
TAR=infisical.tar.gz

echo "Pulling ${IMAGE}..."
docker pull "${IMAGE}"

echo "Saving to ${TAR}..."
docker save "${IMAGE}" | gzip > "${TAR}"

echo "Creating GitHub Release and uploading asset..."
gh release create "v$(date +%Y%m%d%H%M%S)" "${TAR}" \
  --title "infisical image $(date '+%F %T')" \
  --notes "Auto-built infisical image"
