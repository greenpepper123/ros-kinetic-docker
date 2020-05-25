FROM osrf/ros:kinetic-desktop-xenial

# いろいろinstall
RUN apt update && apt install -y \
    python-catkin-tools python-pip vim git openssh-client tmux \
    canberra-gtk* wget apt-transport-https

# shではなくbashを使う
SHELL ["/bin/bash", "-c"]

# git private repositoryからcloneするための設定
RUN mkdir -p /root/.ssh; \
    chmod 700 /root/.ssh
COPY keys /root/.ssh
RUN chmod 600 /root/.ssh/id_rsa_hub

# catkin_wsをセットアップ
ENV ROS_DISTRO kinetic
RUN mkdir -p ~/catkin_ws/robot/src
WORKDIR /root/catkin_ws/robot
RUN source /opt/ros/$ROS_DISTRO/setup.bash; \
    catkin config --init --cmake-args -DCMAKE_BUILD_TYPE=Release

# wstool (optional)
#RUN source /opt/ros/$ROS_DISTRO/setup.bash; \
#    wstool init src; \
#    wstool set -yu -t src hoge --git ssh://git@github.com:22/fuga/hoge.git; \
#    sed -i "s/https:\/\/github.com\//git@github.com:/g" src/hoge/hoge.rosinstall; \
#    wstool merge -t src src/hoge/hoge.rosinstall
#WORKDIR /root/catkin_ws/robot/src
#RUN source /opt/ros/$ROS_DISTRO/setup.bash; wstool update -j10

# rosdep
#RUN pip install pip==9.0.3
#RUN source /opt/ros/$ROS_DISTRO/setup.bash; \
#    rosdep update; \
#    rosdep install --from-paths . --ignore-src -r -n -y

#WORKDIR /root/catkin_ws/robot
#RUN source /opt/ros/$ROS_DISTRO/setup.bash; catkin build

# 環境変数
ENV TERM xterm-256color
ENV DISPLAY :0
ENV NO_AT_BRIDGE 1

# 追加で欲しいパッケージ
RUN apt install -y iputils-ping rlwrap
RUN apt update; \
    apt install -y ros-kinetic-moveit ros-kinetic-moveit-plugins ros-kinetic-moveit-visual-tools ros-kinetic-octomap-rviz-plugins

# 設定ファイルにいくつか追記
RUN echo -e 'function setupros() {\nsource /opt/ros/kinetic/setup.bash\nsource /root/catkin_ws/robot/devel/setup.bash\n}' >> /root/.bashrc; \
    echo -e "set expandtab\nset tabstop=4\nset shiftwidth=4\nset completeopt=menuone\nset nocompatible\nset wildmenu\nset wildmode=longest:full,full\nset whichwrap=b,s,[,],<,>\nau BufNewFile,BufRead *.launch set filetype=xml\nau BufNewFile,BufRead *.l set filetype=lisp\ncolorscheme elflord" >> /usr/share/vim/vimrc
