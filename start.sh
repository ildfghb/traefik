#!/bin/bash
echo "🚀 Starting Traefik Gateway..."

# 启动 Traefik
traefik \
  --api.insecure=true \
  --entrypoints.web.address=:80 \
  --entrypoints.dashboard.address=:8080 \
  --log.level=INFO &

echo "⏳ Waiting for Traefik to start..."
sleep 15

echo "📝 Registering services..."
/usr/local/bin/register-services.sh

echo "✅ Gateway ready!"
wait
