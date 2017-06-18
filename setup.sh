#!/bin/bash


ansible-galaxy install -r requirements.yml
vagrant up --no-provision && find . -name "private_key" | xargs chmod 600 && vagrant provision
