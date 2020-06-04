# Start from ubuntu
FROM ubuntu:18.04

# Update repos and install dependencies
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install build-essential \
    python3-gdal \
    libgdal-dev \
    gdal-bin \
    libcgal-dev \
    libcgal-qt5-dev \
    cmake \
    make \
    gcc

# Create a directory and copy in all files
RUN mkdir -p /tmp/prepair-src
WORKDIR /tmp/prepair-src
COPY . /tmp/prepair-src

# Build prepair
RUN cmake . \
  && make

ENTRYPOINT ["/tmp/prepair-src/prepair"]
CMD ["--help"]




