#!/bin/bash

if [[ $1 != "" ]];
then
    julia $1
else
    echo "No script provided To Run Lindo API"
    echo "on Mac or Linux:"
    echo "docker run -it -v path/to/jlScripts:/rVolume rlindo someJuliaScript.jl"
    echo "on Windows:"
    echo "docker run -it -v path\\\\\to\\\\\jlSripts:/rVolume rlindo someJuliaScript.jl"
fi


