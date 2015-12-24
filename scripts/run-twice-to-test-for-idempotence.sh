#!/bin/sh
SCRIPT_DIR="$(cd $(dirname $0) && pwd)"

echo "First run"
echo "========="
${SCRIPT_DIR}/puppet-apply.sh $* --verbose --detailed-exitcodes --show_diff
[ $? -eq 0 ] || exit 1

echo ""
echo "Second run"
echo "=========="
${SCRIPT_DIR}/puppet-apply.sh $* --verbose --detailed-exitcodes --show_diff

echo ""
[ $? -eq 0 ] && echo "No changes on the second run. :)" \
             || echo "Additional changes on the second run, ergo NOT idempotent! :("
