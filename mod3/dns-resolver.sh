#!/bin/bash

ip=$1
server=$2

# error checking
if [[ ! $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  printf "Please use the following syntax for network IP: 10.0.5" && \
  exit 1
fi

if [[ ! $server =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}.[0-9]{1,3}$ ]]; then
  printf "Please enter a valid IP address for the DNS server." && \
  exit 1
fi

# run script
echo "dns resolution for $ip"
  for i in {1..254}; do
    host="$ip.$i"
    hostUp=$(nslookup $host $server | grep "=")

    if [[ -n $hostUp ]]; then
	echo $hostUp
    fi
  done
