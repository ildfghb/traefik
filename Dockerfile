FROM traefik:v3.0

# 暴露端口
EXPOSE 80 443 8080

# 启动命令 - 配置 Kubernetes 服务发现
CMD ["traefik", \
  "--api.dashboard=true", \
  "--api.insecure=true", \
  "--providers.kubernetescrd=true", \
  "--providers.kubernetesingress=true", \
  "--entrypoints.web.address=:80", \
  "--entrypoints.websecure.address=:443", \
  "--entrypoints.traefik.address=:8080", \
  "--log.level=INFO"]
