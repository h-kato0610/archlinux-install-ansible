#!/bin/bash

docker container start ansible-arch && \
docker container exec -it ansible-arch /bin/bash
