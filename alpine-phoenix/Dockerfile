FROM alpine:edge

ADD repositories /etc/apk/repositories

RUN apk add --update erlang-crypto elixir nodejs openssl inotify-tools && \
    npm install -g npm && \
    npm install -g brunch && \
    mix archive.install --force https://s3.amazonaws.com/s3.hex.pm/installs/1.1.0/hex.ez && \
    mix local.rebar --force && \
    mix archive.install --force https://github.com/phoenixframework/phoenix/releases/download/v1.0.3/phoenix_new-1.0.3.ez && \
    rm -rf /var/cache/apk/*