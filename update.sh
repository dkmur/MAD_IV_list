#!/bin/sh

source $(dirname ${0})/config

FILE=${1:-$(ls -1 ivlist_* | tail -n1)}

curl -X PATCH \
     -H 'X-Beautify: 1' \
     -H 'Content-Type: application/json' \
     -u "${USERNAME}:${PASSWORD}" \
     -d @${FILE} \
     ${MAD_URL}/api/monivlist/1

curl -u "${USERNAME}:${PASSWORD}" \
     ${MAD_URL}/reload
