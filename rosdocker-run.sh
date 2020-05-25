#!/bin/bash
OPTIONS=$(cat local-options)

xhost local:
docker run -ti --privileged --shm-size=15gb --net=host --env="QT_X11_NO_MITSHM=1" ${OPTIONS} -v /run/udev:/run/udev -v /run/dbus:/run/dbus -v /run/systemd:/run/systemd -v "/tmp/.X11-unix/:/tmp/.X11-unix:rw" -v "/etc/localtime:/etc/localtime:ro" my_kinetic:1
