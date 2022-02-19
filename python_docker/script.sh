#!/bin/bash

if [[ $1 != "" ]];
then
    python $1
else
    echo "No script provided! To Run Lindo API python scripts"
    echo "on Mac or Linux:"
    echo "docker run -it -v path/to/python/scripts:/pythonVolume pylindo somePythonScript.py"
    echo "on Windows:"
    echo "docker run -it -v path\\\\\to\\\\\python\\\\\scripts:/pythonVolume pylindo somePythonScript.py"
fi
