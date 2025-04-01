#!/bin/bash


while [ -f conditionals.sh ]

do
	echo "File exists till $(date +%H-%M-%S)"
      sleep 5
done

echo "File no longer exists from $(date +%H-%M-%S)"
