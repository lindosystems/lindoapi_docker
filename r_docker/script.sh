#!/bin/bash
echo "running an R script!"

if [[ $1 != "" ]];
then
    Rscript $1
else
    echo "No script script provided To Run Lindo API R scripts "
    echo "on Mac or Linux:"
    echo "docker run -it -v path/to/rcripts:/rVolume rlindo someRscript.r"
    echo "on Windows:"
    echo "docker run -it -v path\\\\\to\\\\\rcripts:/rVolume rlindo someRscript.r"
fi


