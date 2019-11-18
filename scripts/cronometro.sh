#!/bin/bash

DATA=`date +%s`
while true
do 
	echo -ne "$(date -u --date @$((`date +%s` - $DATA)) +%H:%M:%S)\r"
done
