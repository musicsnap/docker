#!/bin/bash
touch .env
echo "SUBNET_PREFIX=172.168.0" >.env
echo "ROOT_PATH=/root/docker" >>.env
cat .env
