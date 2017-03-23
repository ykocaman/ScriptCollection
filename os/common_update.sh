#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

apt-get update
apt-get upgrade -y
apt-get autoremove -y
apt-get autoclean
