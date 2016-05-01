#!/usr/bin/env bash

# https://github.com/travis-ci/travis-ci/issues/4190

. tests/test.sh &

minutes=0
limit=30
while kill -0 $! >/dev/null 2>&1; do
  echo -n -e " \b" # never leave evidences!

  if [ $minutes == $limit ]; then
    break;
  fi

  minutes=$((minutes+1))

  sleep 60
done
