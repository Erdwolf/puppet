#!/bin/sh
WORKING_DIR="$(cd $(dirname $0) && cd .. && pwd)"

echo "Running puppet apply in '${WORKING_DIR}'..."
echo
(cd ${WORKING_DIR} && sudo `which puppet` apply $* --config puppet.conf -e '')
