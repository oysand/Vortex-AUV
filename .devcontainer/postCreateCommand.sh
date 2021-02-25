#!/bin/bash

apt-get install -y git vim python-pip

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source /opt/ros/melodic/setup.bash
catkin build

echo "source /home/catkin_ws/devel/setup.bash" >> ~/.bashrc
