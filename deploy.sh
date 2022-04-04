#!/bin/bash

echo " Deploying AWS infrastructure "
export ANSIBLE_HOST_KEY_CHECKING=False
sleep 1
terraform init
terraform apply -auto-approve
echo " Waiting... "
sleep 30
ansible-playbook -i ansible/hosts ansible/vault.yml