#!/bin/bash

# Takes a file name and creates an executable file with that name

read -p "Give a name for the script: " filename
echo "#!/bin/bash" > ${filename}.sh
echo "### Script created automatically ###" >> ${filename}.sh
chmod +x ${filename}.sh
ls -l