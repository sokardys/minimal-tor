# set alpine as the base image of the Dockerfile
FROM alpine:latest

# update the package repository and install Tor
RUN apk update && \
    apk add tor && \ 
    rm -rf /var/cache/apk/*

# Copy over the torrc created above and set the owner to `tor`
COPY torrc /etc/tor/torrc
RUN chown -R tor /etc/tor

# Set `tor` as the default user during the container runtime
USER tor

HEALTHCHECK --timeout=10s --start-period=60s \
    CMD curl --fail --socks5-hostname localhost:9150 -I -L 'https://www.facebookcorewwwi.onion/' || exit 1

EXPOSE 53/udp 9150/tcp

CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]