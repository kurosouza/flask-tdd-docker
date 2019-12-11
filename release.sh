#!/bin/sh

IMAGE_ID=$(docker inspect ${HEROKU_REGISTRY_IMAGE} --format={{.Id}})
PAYLOAD='{"updates": [{"type": "web", "docker_image":"'"$IMAGE_ID"'"}]}'

curl -n -X PATCH https://api.heroku.com/apps/fast-headland-42640/formation \
   -d "${PAYLOAD}" \
   -H "Content-type: application/json" \
   -H "Accept: application/vnd.heroku+json; version=3.docker-releases" \
   -H "Authorization: Bearer ${HEROKU_AUTH_TOKEN}"
