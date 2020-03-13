#!/usr/bin/env bash
set -e

# Description: Redis for storing semi-persistent data like user sessions.
#
# Disk: 128GB / persistent SSD
# Network: 100mbps
# Liveness probe: 6379/TCP
# Ports exposed to other Sourcegraph services: 6379/TCP 9121/TCP
# Ports exposed to the public internet: none
#
docker run --detach \
    --name=redis-store \
    --network=sourcegraph \
    --restart=always \
    --cpus=1 \
    --memory=6g \
    -v ~/sourcegraph-docker/redis-store-disk:/redis-data \
    index.docker.io/sourcegraph/redis-store:20-01-30_c903717e@sha256:e8467a8279832207559bdfbc4a89b68916ecd5b44ab5cf7620c995461c005168

echo "Deployed redis-store service"