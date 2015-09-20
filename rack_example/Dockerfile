FROM flat-alpine-passenger
RUN apk add --update ruby-rack && rm -rf /var/cache/apk/*
COPY config.ru /usr/src/app/
ENTRYPOINT ["/passenger/bin/passenger", "start", "--no-install-runtime", "--no-compile-runtime", "--no-download-binaries"]