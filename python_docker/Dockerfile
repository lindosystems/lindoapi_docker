###############################################################################################################
# Lindo API Python Docker Image
# To build the image   > docker build /path/to/LINDOAPI_DOCKER -t pylindo
# Once built run image > docker run -t -v /path/to/your/python/scripts:/pythonVolume pylindo foo.py
#
# /path/to/your/python/scripts Is the local path to your python scripts
# /pythonVolume this is the directory in the containor that has acces to /path/to/your/python/scripts
# foo.py is a python script in the local directory /path/to/your/python/scripts
# to run on the pylindo container
###############################################################################################################

FROM python:3.7-bullseye
 
WORKDIR /opt

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget -r -O LAPI-LINUX-64x86-13.0.tar.gz https://www.lindo.com/downloads/LAPI-LINUX-64x86-13.0.tar.gz\
  && tar -xf LAPI-LINUX-64x86-13.0.tar.gz

COPY ./pyPackages.txt / \
    ./script.sh /

ENV LINDOAPI_HOME=/opt/lindoapi

RUN pip install -r /pyPackages.txt

RUN mkdir /lindoVolume

VOLUME /lindoVolume

WORKDIR /lindoVolume

ENTRYPOINT ["/script.sh"]

CMD [""]
