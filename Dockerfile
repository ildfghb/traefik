FROM traefik:v3.0
RUN apk add --no-cache curl
RUN mkdir -p /etc/traefik
COPY config/whoami.yml /etc/traefik/whoami.yml
EXPOSE 8080
CMD ["traefik", "--api.insecure=true", "--entrypoints.web.address=:8080", "--providers.file.directory=/etc/traefik", "--providers.file.watch=true", "--log.level=INFO"]
