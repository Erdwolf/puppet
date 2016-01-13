#!/bin/sh
SCRIPT_DIR="$(cd $(dirname $0) && pwd)"

BLACK_ON_WHITE='\033[0;30m\033[1;47m'
NO_COLOR='\033[0m'

# Puppet's --detailed-exitcodes:
NOTHING=0 # The run succeeded with no changes or failures; the system was already in the desired state.
FAILURE=1 # The run failed.
CHANGED=2 # The run succeeded, and some resources were changed.
ABORTED=4 # The run succeeded, and some resources failed.
PARTIAL=6 # The run succeeded, and included both changes and failures.

echo ''
echo "${BLACK_ON_WHITE}\n ========== First run ========== \n${NO_COLOR}"
echo ''
${SCRIPT_DIR}/puppet-apply.sh $* --verbose --detailed-exitcodes --show_diff
code=$?

[ $code -eq $CHANGED ] || {
  echo ''
  echo "Puppet finished with exit code $code, expected $CHANGED!"
  exit 1
}

echo ''
echo 'First run succeded, running again to verify idempotence...'
echo ''

echo ''
echo "${BLACK_ON_WHITE}\n ========== Second run ========== \n${NO_COLOR}"
echo ''
${SCRIPT_DIR}/puppet-apply.sh $* --verbose --detailed-exitcodes --show_diff
code=$?

[ $code -eq $NOTHING ] && {
   echo ''
   echo 'No changes on the second run.'
   exit 0
} || {
   echo ''
   echo 'Additional changes on the second run, ergo NOT idempotent!'
   exit 2
}
