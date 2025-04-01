#!/bin/bash

for file in ~//mnt/c/Users/eshac/Shell\Scripting/Countable/*.txt

do
	line_count=$(wc -l < $file)
	echo "Line count is $line_count" >> $file
done
