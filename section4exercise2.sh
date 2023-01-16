#!/bin/bash

# Uses a for loop to count all txt files in the working directory
# For testing purposes it creates between 1 to 10 txt files and deletes them at
# the end

# Create the files
randomNumber=$((1 + $RANDOM % 10))
echo "Creating $randomNumber txt files"
for ((i=1; i<=$randomNumber; i++))
do
    touch ${i}.txt
done
ls -l

# Count the files
fileCount=0
for filename in *
do
    case $filename in
        *.txt)
            ((fileCount++))
            ;;
    esac
done
echo "The file count is $fileCount"

# Delete the files
echo "Removing all txt files"
rm *.txt