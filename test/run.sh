#!/bin/bash
# run all configrations 
# Usage: run -a ; run for all config file
#        run cf-file ; run a specified config file
SHOWSTATDIR=$HOME/Projects/Showstats/Showstats
CONFIGDIR=$SHOWSTATDIR/cf

if [ $# -eq 0 ]; then
    echo "Usage : run -a ; run all the config file"
    echo "        run cf-file"
    exit
elif [ $1 = "-a" ]; then
for cf in $CONFIGDIR/*cf
do
    showstats.sh $cf
done
else
    $SHOWSTATDIR/showstats.sh $1
fi

