#!/bin/bash

# Creates between 1 to 10 txt and jpg files and asks the user to select one of
# the two types of files based on their extension. The files selected will have
# a prefix added to their names. The prefix is also given by the user

# Create the files
randomNumber=$((1 + $RANDOM % 10))
echo "Creating $randomNumber txt files and $randomNumber jpg files"
for ((i=1; i<=$randomNumber; i++))
do
    touch ${i}.txt
    touch ${i}.jpg
done
ls -l

# Read the input
echo "Which files do you want to work on?"
echo "t for txt files"
echo "j for jpg files"
fileType=""
while [ "$fileType" != "t" -a "$fileType" != "j" ];
do
    read fileType
    if [ "$fileType" != "t" -a "$fileType" != "j" ]; then
        echo "Option not valid, please input a valid option t/j"
    fi
done

# Add the prefix
if [ "$fileType" == "t" ]; then
    extension=".txt"
else
    extension=".jpg"
fi
read -p "Type a prefix to add to the names of the $extension files: " prefix
for filename in *
do
    case $filename in
        *$extension)
            mv $filename $prefix$filename
            ;;
    esac
done
ls -l

# Delete the files
echo "Removing all txt and jpg files"
rm *.txt *.jpg