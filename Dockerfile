FROM traefik:v3.0

# 暴露端口
EXPOSE 80 443 8080

# 启动命令 - 使用 CMD 而不是 ENTRYPOINT，避免转义问题
CMD ["traefik", "--api.dashboard=true", "--api.insecure=true", "--providers.docker=true", "--providers.docker.exposedbydefault=false", "--entrypoints.web.address=:80", "--entrypoints.websecure.address=:443", "--entrypoints.traefik.address=:8080", "--log.level=INFO"]
