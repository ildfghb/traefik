#!/bin/bash
echo "🚀 Starting Traefik Gateway with file provider..."

# 创建配置目录
mkdir -p /etc/traefik/dynamic

# 创建动态配置
cat > /etc/traefik/dynamic/services.json << 'JSON_EOF'
{
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
}
JSON_EOF

# 启动 Traefik
traefik \
  --api.insecure=true \
  --entrypoints.web.address=:80 \
  --providers.file.directory=/etc/traefik/dynamic \
  --providers.file.watch=true \
  --log.level=INFO

echo "✅ Traefik started with file provider!"
