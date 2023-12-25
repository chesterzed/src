#!/bin/bash

if [ ! $# = 0 ]; then
echo "Incorrect input"
exit 1
fi

chmod +rx script.sh
sh script.sh "$1" "$2" "$3" "$4"
