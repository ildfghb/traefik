# Dockerfile
FROM traefik:v3.5

RUN apk add --no-cache curl

COPY config/ /etc/traefik/dynamic/

EXPOSE 80 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:8080/ping || exit 1

CMD ["traefik", \
  "--api.insecure=true", \
  "--api.dashboard=true", \
  "--entrypoints.web.address=:80", \
  "--entrypoints.traefik.address=:8080", \
  "--ping=true", \
  "--ping.entryPoint=traefik", \
  "--log.level=DEBUG", \
  "--providers.file.directory=/etc/traefik/dynamic", \
  "--providers.file.watch=true"]