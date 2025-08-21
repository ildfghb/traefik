FROM alpine:3.18

# 下载并安装 whoami 二进制文件
RUN apk add --no-cache ca-certificates wget && \
    wget -O /usr/local/bin/whoami https://github.com/traefik/whoami/releases/download/v1.8.0/whoami_v1.8.0_linux_amd64 && \
    chmod +x /usr/local/bin/whoami && \
    apk del wget

EXPOSE 80
CMD ["whoami"]
