#!/bin/sh
CODE_DIR="$(cd $(dirname $0) && cd .. && pwd)"
docker run $* --rm -v ${CODE_DIR}:/mnt puppet /bin/bash -c "
  /mnt/scripts/run-twice-to-test-for-idempotence.sh && \
  /mnt/scripts/check-installation.sh
"
