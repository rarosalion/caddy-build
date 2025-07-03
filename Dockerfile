FROM caddy:builder AS builder

# Versions fixed until route53 fix: https://github.com/caddy-dns/route53/issues/58    
RUN xcaddy build v2.9.1 \
    --with github.com/caddy-dns/acmedns \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/fvbommel/caddy-dns-ip-range \
    --with github.com/caddy-dns/route53@v1.5.0 

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
