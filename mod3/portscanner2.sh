#!/bin/bash

ip=$1
port=$2

# error checking
if [[ ! $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  printf "Please use the following syntax for network IP: 10.0.5" && \
  exit 1
fi

if [[ ! $port =~ ^[+-]?[0-9]+$ ]]; then
  printf "Please enter a number for the port." && \
  exit 1
fi

# run script
echo "ip,port"
  for i in {1..254}; do
    host="$ip.$i"

    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
      echo "$host,$port"
  done
