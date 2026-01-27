#!/bin/bash

hostfile=$1
portfile=$2

# error checking
if [[ $hostfile != *".txt" ]]; then
  printf "Please use a .txt file for hostfile and portfile.\nUsage: ./portscanner.sh (nameofhostfile).txt (nameofportfile).txt" && \
  exit 1
fi

if [[ $portfile != *".txt" ]]; then
  printf "Please use a .txt file for hostfile and portfile.\nUsage: ./portscanner.sh (nameofhostfile).txt (nameofportfile).txt" && \
  exit 1
fi

if [[ ! -e $hostfile ]]; then
  printf "Error: File (hosts) does not exist in current directory.\nUsage: ./portscanner.sh (nameofhostfile).txt (nameofportfile).txt" && \
  exit 1
fi

if [[ ! -e $portfile ]]; then
  printf "Error: File (ports) does not exist in current directory.\nUsage: ./portscanner.sh (nameofhostfile).txt (nameofportfile).txt" && \
  exit 1
fi

# run script
echo "host,port"
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
      echo "$host,$port"
  done
done


