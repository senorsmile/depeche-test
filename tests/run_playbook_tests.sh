#!/usr/bin/env bash

export ANSIBLE_CALLBACK_WHITELIST='profile_tasks,timer'

pipenv run ansible-playbook test.yml -i ./inventory/ $@
