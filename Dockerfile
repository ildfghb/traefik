FROM traefik:v3.0
RUN apk add --no-cache curl
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --start-period=15s \
  CMD curl -f http://localhost:80/ping || exit 1
CMD ["traefik", "--api.insecure=true", "--entrypoints.web.address=:80", "--ping=true", "--log.level=INFO"]
