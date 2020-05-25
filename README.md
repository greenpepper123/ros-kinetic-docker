ros-kinetic-docker
====

## Overview
- Dockerfile and some utils for running ros-kinetic on the docker container

## Warning
- Configuration about Euslisp X-Display may be still incomplete.

## Requirement
- docker CE
- xhost

## Usage(sample)
- `git clone git@github.com:greenpepper123/ros-kinetic-docker.git`
- `cd ros-kinetic-docker`
- `cp ~/.ssh/id_rsa_for_github ./keys/.ssh  #Copy your ssh private key for cloning private repos from git when you build docker image`
- `docker build -t my_kinetic:1 build/
- `./rosdocker-run.sh`

## Tips
- When you run this container first, modify docker run -v option so that ~/.bashrc and ~/catkin_ws included in this image persists.
  - Run with `-v $(pwd)/mount:/mnt/persist`, copy ~/.bashrc and ~/catkin_ws to /mnt/persist/home and /mnt/persist/catkin_ws, and then quit.
  - Run again with original setting.
- Write your own local-options. Currently, you CANNOT use parameter expansion in this file.

## Author
- greenpepper123
