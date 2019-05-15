#!/bin/bash

set -u
set -x

if [ -z "${NODENAME}" ]; then
    NODENAME=$(curl -fsq http://169.254.169.254/latest/meta-data/hostname)
fi

kubectl cordon "${NODENAME}"
kubectl drain "${NODENAME}" --ignore-daemonsets --grace-period=30 --force

sleep 10
