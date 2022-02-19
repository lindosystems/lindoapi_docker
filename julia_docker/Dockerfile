###############################################################################################################
# Lindo API Julia Docker Image
# To build the image   > docker build /path/to/LINDOAPI_DOCKER/julia_docker -t julialindo
# Once built run image > docker run -t -v /path/to/your/julia/scripts:/juliaVolume julialindo foo.jl
#
# /path/to/your/julia/scripts Is the local path to your julia scripts
# /juliaVolume this is the directory in the containor that has acces to /path/to/your/julia/scripts
# foo.jl is a julia script that is in the local directory /path/to/your/julia/scripts 
# to run on the julialindo container
###############################################################################################################

FROM julia:latest

WORKDIR /opt

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget -r -O LAPI-LINUX-64x86-13.0.tar.gz https://www.lindo.com/downloads/LAPI-LINUX-64x86-13.0.tar.gz\
  && tar -xf LAPI-LINUX-64x86-13.0.tar.gz
 

ENV LINDOAPI_HOME=/opt/lindoapi

COPY ./jlPackages.jl /

RUN  julia /jlPackages.jl

RUN mkdir /lindoVolume

VOLUME /lindoVolume

WORKDIR /lindoVolume

COPY ./script.sh /

ENTRYPOINT ["/script.sh"]

CMD [""]
