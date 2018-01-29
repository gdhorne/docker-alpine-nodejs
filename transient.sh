#!/usr/bin/env sh

echo
docker run -i -t -v ${PWD}:/opt/project --rm nodejs ${1} ${2}
echo
