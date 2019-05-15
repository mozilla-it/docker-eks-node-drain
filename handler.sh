#!/bin/bash

set -u
set -x

HOSTNAME=$(curl -fsq http://169.254.169.254/latest/meta-data/hostname)

kubectl cordon "${HOSTNAME}"
kubectl drain "${HOSTNAME}" --ignore-daemonsets --grace-period=30 --force

sleep 10
