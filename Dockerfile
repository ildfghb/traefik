FROM traefik:v3.0

# 安装基础工具
RUN apk add --no-cache curl

# 暴露端口
EXPOSE 8080

# 使用最简单的启动命令
CMD ["traefik", "--api.insecure=true", "--entrypoints.web.address=:8080"]
