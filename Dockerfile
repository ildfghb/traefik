FROM traefik:v3.0

# 安装基础工具（用于调试）
RUN apk add --no-cache curl

# 暴露端口
EXPOSE 8080

# 使用默认的 Traefik 启动
CMD ["traefik", "--api.insecure=true", "--entrypoints.web.address=:8080", "--providers.file.directory=/etc/traefik", "--providers.file.watch=true", "--log.level=INFO"]
