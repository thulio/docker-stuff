FROM alpine:latest

ADD repositories /etc/apk/repositories

RUN apk add --update elixir nodejs openssl inotify-tools && \
    npm install -g npm && \
    npm install -g brunch && \
    mix archive.install --force https://s3.amazonaws.com/s3.hex.pm/installs/1.0.0/hex.ez && \
    mix local.rebar --force && \
    mix archive.install --force https://github.com/phoenixframework/phoenix/releases/download/v1.0.2/phoenix_new-1.0.2.ez && \
    rm -rf /var/cache/apk/*