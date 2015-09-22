#!/usr/bin/env bash

PROJECT_PATH=$(dirname "$0")
pushd "$PROJECT_PATH/../alpine-phoenix" > /dev/null
./build.sh alpine-phoenix
popd > /dev/null
pushd $PROJECT_PATH >/dev/null
rm -rf app
yes | mix phoenix.new --no-ecto --no-brunch app
docker build --rm -t 'phoenix-example' .
docker run --rm -ti -p 4000:4000 phoenix-example sh
docker rmi 'phoenix-example'
rm -rf app