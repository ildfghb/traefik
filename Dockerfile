FROM traefik:v3.0

# 安装必要工具
RUN apk add --no-cache curl bash

# 复制脚本
COPY register-services.sh /usr/local/bin/register-services.sh
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/register-services.sh /usr/local/bin/start.sh

EXPOSE 80 8080
CMD ["/usr/local/bin/start.sh"]
