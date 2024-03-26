#!/bin/bash

echo building image node:build

docker build -t nodeapp:build -f build.Dockerfile .

docker create --name buildContainer nodeapp:build

docker cp buildContainer:/src/dist ./distrib

docker rm -f buildContainer

echo deploying node:deploy

docker build -t nodeapp:deploy -f deploy.Dockerfile .

docker run --name deployContainer nodeapp:deploy -p 3000:3000