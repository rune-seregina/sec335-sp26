#!/bin/bash

for i in {2..50}
do
ping -c 1 "10.0.5.$i" | grep -o  "64 bytes from 10.0.5.$i" | \
grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" >> sweep.txt 
done

