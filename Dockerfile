ARG BUILD_CADDY_VERSION=2.11.2
FROM caddy:${BUILD_CADDY_VERSION}-builder AS builder

RUN xcaddy build ${CADDY_VERSION} \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/fvbommel/caddy-dns-ip-range \
    --with github.com/caddy-dns/route53

FROM caddy:${BUILD_CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
