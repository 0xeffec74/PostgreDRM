#!/bin/bash

# docker run
# -------------------------------
docker run --name some-postgis \
-e POSTGRES_PASSWORD=mysecretpassword \
-e DISPLAY=${DISPLAY}  --mount type=bind,src=/tmp/.X11-unix/,dst=/tmp/.X11-unix \
-d postgis-qgis