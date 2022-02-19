###############################################################################################################
# Lindo API r Docker Image
# To build the image   > docker build /path/to/LINDOAPI_DOCKER/r_docker -t rlindo
# Once built run image > docker run -t -v /path/to/your/r/scripts:/rVolume rlindo foo.r
#
# /path/to/your/r/scripts Is the local path to your r scripts
# /rVolume this is the directory in the containor that has acces to /path/to/your/r/scripts
# foo.jl is a r script that is in the local directory /path/to/your/r/scripts 
# to run on the rlindo container
###############################################################################################################

FROM r-base

WORKDIR /opt

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget -r -O LAPI-LINUX-64x86-13.0.tar.gz https://www.lindo.com/downloads/LAPI-LINUX-64x86-13.0.tar.gz\
  && tar -xf LAPI-LINUX-64x86-13.0.tar.gz

ENV LINDOAPI_HOME=/opt/lindoapi

WORKDIR /opt/lindoapi/R 

RUN ./install-rlindo.sh 

RUN mkdir /rVolume

VOLUME /rVolum

WORKDIR /rVolume

COPY ./lindo.r / \
    ./script.sh /

RUN Rscript /lindo.r

ENTRYPOINT ["/script.sh"]

CMD [""]