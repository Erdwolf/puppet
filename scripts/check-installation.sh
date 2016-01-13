#!/bin/bash
programs=( docker gvim sbt stack )

echo ''
echo "Expecting programs: ${programs[@]}"
echo ''

ok=true
for p in "${programs[@]}"; do
   installed=`which $p`
   [ -z "$installed" ] && {
      ok=false;
      echo "$p NOT FOUND!"
   } || {
      echo $installed
   }
done

$ok && {
  echo ''
  echo 'ok.'
  exit 0
} || {
  echo ''
  echo 'One or more expected programs were not found.'
  exit 1
}
