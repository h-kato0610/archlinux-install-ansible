#!/bin/sh

docker run --name ansible-arch -it --mount type=bind,source=./ansible,target=/ansible ansible-arch
