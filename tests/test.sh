#!/usr/bin/env bash

set -e

export ANSIBLE_ROLES_PATH='../'
INVENTORY='localhost,'
CONNECTION='local'

ansible-playbook -i $INVENTORY tests/test.yml --syntax-check
ansible-playbook -i $INVENTORY tests/test.yml --connection=$CONNECTION --sudo
if ansible-playbook -i $INVENTORY tests/test.yml --connection=$CONNECTION --sudo \
  | grep --quiet 'changed=0.*failed=0'; then
  echo 'Idempotency: PASS' && exit 0
else
  echo 'Idempotency: FAIL' && exit 1
fi
