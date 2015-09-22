#!/usr/bin/env bash

rm -rf app
mix phoenix.new --no-ecto --no-brunch app
docker build --rm -t 'phoenix-example' .
docker run --rm -ti -p 4000:4000 phoenix-example sh
docker rmi 'phoenix-example'