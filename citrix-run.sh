#!/bin/bash

if [ "$1" == "" ] || [ $# -gt 1 ]; then
  echo "Usage: $0 <.ica file>"
  exit 1
else
  icafile_host="${1}"
  icafile_container=$(basename "${1}")
fi

xhost +SI:localuser:"$(id -u -n)"

podman run --rm \
  --user citrix \
  --userns keep-id \
  --ipc=host \
  --name citrix-ica-client \
  --hostname citrix-ica-container \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/dri:/dev/dri \
  -v "/run/user/$(id -u)/pulse":/run/user/1000/pulse \
  -e PULSE_SERVER=/run/user/1000/pulse/native \
  -v "${icafile_host}:/ica/${icafile_container}":Z \
  --security-opt label=type:container_runtime_t \
  citrix-ica-client "/ica/${icafile_container}"

xhost -SI:localuser:"$(id -u -n)"
