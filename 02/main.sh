#!/bin/bash


if [ ! $# = 0 ]; then
echo "Incorrect input"
exit 1
fi

chmod +x script.sh
sh script.sh

read -p 'Do you want to write data in the file? (Y/N)' ans

case $ans in
y | Y) file=$(date +'%d_%m_%y_%H_%M_%S')'.status'
sh script.sh > $file;;
*) echo "Not saved";;
esac
