#!/bin/bash

for file in ~/eshac/Shell\Scripting/Countable/file.txt
do
	line_count=$(wc -l <$file)
	echo "Line count is $line_count" >> $file
done
