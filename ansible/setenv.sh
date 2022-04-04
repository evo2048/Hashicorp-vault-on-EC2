#!/bin/bash

echo "VAULT_TOKEN=$(grep "Token" /home/ubuntu/key.txt | cut -c 21-)" >> /etc/environment
echo "export VAULT_TOKEN=$(grep "Token" /home/ubuntu/key.txt | cut -c 21-)" >> /etc/profile
export VAULT_TOKEN="$(grep "Token" /home/ubuntu/key.txt | cut -c 21-)"