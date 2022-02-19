#!/bin/bash

if [[ $1 != "" ]];
then
    julia $1
else
    echo "No script provided! To Run Lindo API julia scripts"
    echo "on Mac or Linux:"
    echo "docker run -it -v path/to/julia/scripts:/juliaVolume jl_lindo someJuliaScript.jl"
    echo "on Windows:"
    echo "docker run -it -v path\\\\\to\\\\\julia\\\\\scripts:/rVolume jl_lindo someJuliaScript.jl"
fi