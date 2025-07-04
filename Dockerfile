ARG BUILD_CADDY_VERSION=2.9.1
FROM caddy:${BUILD_CADDY_VERSION}-builder AS builder

# Versions fixed until route53 fix: https://github.com/caddy-dns/route53/issues/58    
RUN xcaddy build ${CADDY_VERSION} \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/fvbommel/caddy-dns-ip-range \
    --with github.com/caddy-dns/route53@v1.5.0 

FROM caddy:${BUILD_CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
