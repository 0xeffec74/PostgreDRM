#!/bin/bash

# Dockerイメージ名
DOCKER_IMAGE_NAME=postgis-qgis
DOCKER_FILE_PATH=./docker/Dockerfile

# docker build
# -------------------------------
docker build \
  -f ${DOCKER_FILE_PATH}\
  -t ${DOCKER_IMAGE_NAME} .