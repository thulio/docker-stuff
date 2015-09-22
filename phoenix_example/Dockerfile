FROM flat-docker-phoenix

ADD app /usr/src/app
WORKDIR /usr/src/app
RUN mix deps.get
EXPOSE 4000

ENTRYPOINT ["mix", "phoenix.server"]