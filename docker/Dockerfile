FROM postgis/postgis:13-3.1
#FROM mdillon/postgis:10

ARG DEBIAN_FRONTEND=noninteractive

ENV PGROUTING_MAJOR 2.5
ENV PGROUTING_VERSION 2.5.2

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      wget \
      postgresql-$PG_MAJOR-pgrouting && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-pgrouting.sh /docker-entrypoint-initdb.d/routing.sh

RUN apt-get update \
    &&  apt -y install osm2pgrouting \