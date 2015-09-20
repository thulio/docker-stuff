#!/usr/bin/env bash

function usage() {
	echo "Usage: ./build.sh IMAGE_NAME"
}

function build() {

	echo "Building image $IMAGE_NAME"
	docker build --rm=true --force-rm=true -t $IMAGE_NAME .
}

function slim() {
	#FIXME: export/import removes metadata (CMD, ENTRYPOINT, ENV etc)
	CONTAINER_ID=$(docker run -d $IMAGE_NAME /bin/bash)
	docker export -o "$CONTAINER_ID" $CONTAINER_ID
	docker import "$CONTAINER_ID" flat-$IMAGE_NAME
	rm "$CONTAINER_ID"
	docker stop -t 1 $CONTAINER_ID && docker rm $CONTAINER_ID
}

function remove_stale_images() {
	docker images | grep "<none>" | awk '{print $3;}' | xargs docker rmi
}

function main() {
	if [ -z "$1" ]; then
		usage && exit 1;
	fi

	IMAGE_NAME=$1
	build
	slim
	remove_stale_images
}

main