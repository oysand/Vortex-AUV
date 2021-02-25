FROM ros:melodic-ros-core

WORKDIR /home/

RUN apt-get update

RUN \
    apt-get install -y \
    git \
    build-essential \
    python-catkin-tools \
    protobuf-compiler \
    ros-melodic-rosbridge-server \
    ros-melodic-message-to-tf \
    ros-melodic-geographic-msgs \
    ros-melodic-move-base \
    ros-melodic-move-base-msgs \
    ros-melodic-smach-ros \
    ros-melodic-cv-bridge \
    ros-melodic-geometry \
    ros-melodic-image-transport \
    ros-melodic-diagnostic-updater \
    ros-melodic-roslint \
    libyaml-cpp-dev

RUN \
    mkdir -p catkin_ws/src

COPY ./ catkin_ws/src/Vortex-AUV

WORKDIR /home/catkin_ws/src/

RUN git clone https://github.com/vortexntnu/vortex_msgs.git

WORKDIR /home/catkin_ws/

#CMD [ "/bin/bash" ]
CMD /home/catkin_ws/src/Vortex-AUV/entrypoint.sh