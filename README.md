# LINDO API DOCKER IMAGES


## Introduction
Each folder contains a Dockerfile, a Packages file, and a shell script. The Dockerfile contains the instructions for building the image. The Packages file is used to download the language specific libraries that the scripts will depend on. Finally, the shell script is used by the container to run the Lindo scripts.

##  Getting Started
Docker must be installed on your computer for installation 
visit [Docker's website](https://docs.docker.com/get-docker/).

## Building An Image

Use the `docker build` command followed by the path to the directory with that has the Dockerfile in it. Finally, the optional `-t` tags a name to the image.
```bash
> docker build /path/to/python_docker -t pylindo
```

## Running A Container 

Once the image is built to run a container use the `docker run` command followed by the two flags `-t`, and `-v`. The first tag `-t` allocates a pseudo-TTY and this will ensure that all the model output is displayed on the terminal or wherever output is redirected to. The second tag `-v` is used to connect a directory from your machine to the containers file directory. 

### Mac or Linux
``` bash
> docker run -t -v /path/to/your/python/scripts:/lindoVolume pylindo foo.py
```    

### Windows
``` powershell
> docker run -t -v C:\path\to\your\python\scripts:/lindoVolume pylindo foo.py
```    

The two paths separated by the `:` are the directories connected by the `-v` tag. The directory on the left is a local directory the contains the scripts that you want to run and can be any directory. The directory on the right `/lindoVolume` is a fixed directory located on the container and cannot be another directory. The `pylindo` is the name assigned to the image when it was built. Finally `foo.py` is the name of the script to be ran through the container and must be located in the directory to the left of `:`.

## Julia

``` bash
├── julia_docker
│ ├── Dockerfile
│ ├── jlPackages.jl
│ └── script.sh
```

The Julia script `jlPackages.jl` imports the package manager then downloads `lindoapi.jl` along with its dependencies. To add a package not included in this process add to `jlPackages.jl` 
```julia
Pkg.add("PackageName")
```
Then rebuild the image.

#### Build for Julia
```bash
> docker build /path/to/julia_docker -t jl_lindo
```

#### Run on Mac or Linux
``` bash
> docker run -t -v /path/to/your/julia/scripts:/lindoVolume jl_lindo foo.jl
```    

#### Run on Windows
``` powershell
> docker run -t -v C:\path\to\your\julia\scripts:/lindoVolume jl_lindo foo.jl
```  

## Python 

``` bash
├── python_docker
│ ├── Dockerfile
│ ├── pyPackages.txt
│ └── script.sh
```

The text file pyPackages.txt is sent to pip install when the image is built and by default only includes `lindo==13.0`, and will install the Lindo Python package, and Numpy. To add another package not included by default add a new line to the text file with the packages name. Use `==` to specify the version number.

#### Build for Python
```bash
> docker build /path/to/python_docker -t pylindo
```

#### Run on Mac or Linux
``` bash
> docker run -t -v /path/to/your/python/scripts:/lindoVolume pylindo foo.py
```    

#### Run on Windows
``` powershell
> docker run -t -v C:\path\to\your\python\scripts:/lindoVolume pylindo foo.py
```  

## R 

``` bash
├── r_docker
│ ├── Dockerfile
│ ├── rPackages.r
│ └── script.sh
```

The R script `rPackages.r` imports the rLindo library and installs the `stringr` package when the image is built. Installing packages at build time will prevent having to install them every time a script is ran through the container. To add a packages that is not included add the line
```R
install.packages("PackageName",repos="PackageRepo")
```
to the script.

#### Build for R
```bash
> docker build /path/to/rdocker -t rlindo
```

#### Run on Mac or Linux
``` bash
> docker run -t -v /path/to/your/r/scripts:/lindoVolume rlindo foo.r
```    

#### Run on Windows
``` powershell
> docker run -t -v C:\path\to\your\r\scripts:/lindoVolume rlindo foo.r
```  
