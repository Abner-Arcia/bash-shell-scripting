#!/bin/bash

# Creates two files, then appends the contents of the working directory to the
# first file and adds a user-defined prefix to name of that file

touch 1.txt 2.txt
ls -l >> 1.txt
read -p "Type a prefix for the file: " prefix
mv 1.txt ${prefix}1.txt