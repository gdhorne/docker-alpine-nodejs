#!/usr/bin/env sh

echo
docker start nodejs
docker exec -i -t nodejs ${1} ${2}
docker stop nodejs
echo
