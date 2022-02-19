"""
    This script is ran when the docker image is built.
    If any other packages are needed other then the Lindo API
    add them to this script.
"""

using Pkg
# Install Lindoapi
Pkg.add(url="https://github.com/lindosystems/lindoapi.jl")
