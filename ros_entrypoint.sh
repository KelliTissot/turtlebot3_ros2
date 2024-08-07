#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/$ROS_DISTRO/setup.bash"

source /opt/ros/humble/setup.bash
source /turtlebot3_ws/install/setup.bash
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=/ros2_install
export LC_NUMERIC="en_US.UTF-8"
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export ROS_DOMAIN_ID=1

exec "$@"
