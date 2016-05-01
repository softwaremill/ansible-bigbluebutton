#!/usr/bin/env bash

export ANSIBLE_ROLES_PATH='../'
INVENTORY='localhost,'
CONNECTION='local'

ansible-playbook -i $INVENTORY tests/test.yml --syntax-check
ansible-playbook -i $INVENTORY tests/test.yml --connection=$CONNECTION --sudo --verbose --skip-tags dist_upgrade
ansible-playbook -i $INVENTORY tests/test.yml --connection=$CONNECTION --sudo --skip-tags non_idempotent \
  | grep --quiet 'changed=0.*failed=0'
if [ $? -eq 0 ]; then
  echo 'Idempotency: PASS' && exit 0
else
  echo 'Idempotency: FAIL' && exit 1
fi

