#!/bin/bash

API_URL="http://localhost:8080"
echo "🚀 Starting service registration..."

# 等待 Traefik API 就绪
for i in {1..30}; do
    if curl -s "$API_URL/api/rawdata" > /dev/null 2>&1; then
        echo "✅ Traefik API is ready"
        break
    fi
    echo "⏳ Waiting for Traefik API... ($i/30)"
    sleep 2
done

# 注册 whoami 服务
echo "📝 Registering whoami service..."
curl -X PUT "$API_URL/api/rawdata" \
  -H "Content-Type: application/json" \
  -d '{
    "http": {
      "routers": {
        "whoami-router": {
          "rule": "PathPrefix(`/whoami`)",
          "service": "whoami-service",
          "entryPoints": ["web"]
        }
      },
      "services": {
        "whoami-service": {
          "loadBalancer": {
            "servers": [
              {"url": "http://dyzfbakk.whoami.qhph39ns.34m0njpv.com"}
            ]
          }
        }
      }
    }
  }'

echo "✅ whoami service registered!"
