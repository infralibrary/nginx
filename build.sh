#!/bin/bash

tag="1.20.2"
DOCKER_REGISTRY_URL="docker.io"
ALIYUN_REGISTRY_URL="registry.cn-hangzhou.aliyuncs.com"

#docker system prune -a -f

docker build --no-cache --file mainline/alpine3.12/Dockerfile \
        -t ${DOCKER_REGISTRY_URL}/infralibrary/nginx:${tag}-alpine3.12 \
        -t ${ALIYUN_REGISTRY_URL}/infralibrary/nginx:${tag}-alpine3.12 .

docker build --no-cache --file mainline/alpine3.14/Dockerfile \
        -t ${DOCKER_REGISTRY_URL}/infralibrary/nginx:${tag}-alpine3.14 \
        -t ${DOCKER_REGISTRY_URL}/infralibrary/nginx:${tag}-alpine \
        -t ${DOCKER_REGISTRY_URL}/infralibrary/nginx:${tag} \
        -t ${DOCKER_REGISTRY_URL}/infralibrary/nginx:latest \
        -t ${ALIYUN_REGISTRY_URL}/infralibrary/nginx:${tag}-alpine3.14 \
        -t ${ALIYUN_REGISTRY_URL}/infralibrary/nginx:${tag}-alpine \
        -t ${ALIYUN_REGISTRY_URL}/infralibrary/nginx:${tag} \
        -t ${ALIYUN_REGISTRY_URL}/infralibrary/nginx:latest .


docker images


for reg in ${DOCKER_REGISTRY_URL} ${ALIYUN_REGISTRY_URL};
do
    docker push ${reg}/infralibrary/nginx:${tag}-alpine3.12
    docker push ${reg}/infralibrary/nginx:${tag}-alpine3.14
    docker push ${reg}/infralibrary/nginx:${tag}-alpine
    docker push ${reg}/infralibrary/nginx:${tag}
    docker push ${reg}/infralibrary/nginx:latest
done


