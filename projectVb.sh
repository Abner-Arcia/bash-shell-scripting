#!/bin/bash

# Description
# Searches for a given word in the files of a given directory and all of its
# subdirectories
# Files that contain the word are copied into a new directory and the line(s)
# that contains the word along with its line number are appended to the end
# of the files
# This version uses a for loop along with the find command to search in the
# subdirectories

# Validate input
wordToFind="$1"
if [ -z "$wordToFind" ]; then
    echo "Missing argument: The word to search for was not specified"
    exit 1
fi
startingDirectory="$2"
if [ -z "$startingDirectory" ]; then
    startingDirectory="."
else
    if [ ! -d "$startingDirectory" ]; then
        echo "Bad argument: The directory does not exists"
        exit 1
    fi
fi

# Setup for testing
echo "Beach Bunny - Sports" > test1.txt
echo "Not related" > test2.txt
echo "I was never good at sports" > test3.txt

mkdir "some dir"
echo "Spock" > "SOME DIR/test4.txt"

foundFilesDirectory="found_files"
rm -r "$foundFilesDirectory"
mkdir "$foundFilesDirectory"
workingDirectory=$(pwd)

# Change internal field separator to handle directories with spaces in their
# name
OIFS="$IFS"
IFS=$'\n'
for directory in $(find "$startingDirectory" -type d)
do
	if [ "$directory" != "./$foundFilesDirectory" \
		-a "$file" != "$workingDirectory"/"$foundFilesDirectory" ]; then
		echo "********** $directory **********"
		for file in "$directory"/*
		do
			if [ -f "$file" ]; then
				echo "Found file $file"
				grepResult=$(grep -Fin "$wordToFind" "$file")
				if [ ! -z "$grepResult" ]; then
					echo "Word found. Copying file..."
					cp "$file" "$foundFilesDirectory"
					filename=$(basename "$file")
					echo " " >> "$foundFilesDirectory"/"$filename"
					echo "**********" >> "$foundFilesDirectory"/"$filename"
					echo "$grepResult" >> "$foundFilesDirectory"/"$filename"
				fi
			fi
		done
		echo "---------- $directory ----------"
	fi
done
IFS="$OIFS"

# Cleanup
rm *.txt
rm -r "some dir"