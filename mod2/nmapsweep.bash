#!/bin/bash

for i in {2..50}
do
hostUp=$(nmap -n -vv -sn "10.0.5.$i" | grep  "Host is up")
if [[ -n $hostUp ]]; then
  echo "10.0.5.$i" >> sweep3.txt
fi
done

