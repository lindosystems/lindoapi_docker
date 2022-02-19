#!/bin/bash

if [[ $1 != "" ]];
then
    Rscript $1
else
    echo "No script provided! To Run Lindo API R scripts"
    echo "on Mac or Linux:"
    echo "docker run -it -v path/to/r/scripts:/rVolume rlindo someRscript.r"
    echo "on Windows:"
    echo "docker run -it -v path\\\\\to\\\\\r\\\\\scripts:/rVolume rlindo someRscript.r"
fi


