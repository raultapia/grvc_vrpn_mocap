#!/usr/bin/env bash
USE_PX4_MSGS=true
PX4_MSGS_COMMIT=main

# Dependencies
rosdep install --from-paths . -y --ignore-src

# PX4 messages
if [ "$USE_PX4_MSGS" = true ]; then
  rm -rf px4_msgs/COLCON_IGNORE
  (cd px4_msgs && git checkout "${PX4_MSGS_COMMIT}")
else
  touch px4_msgs/COLCON_IGNORE
fi

# Fix QoS (https://github.com/alvinsunyixiao/vrpn_mocap/issues/15)
sed -i 's/mocap_topic, 10/mocap_topic, rclcpp::QoS(rclcpp::KeepLast(10)).best_effort()/g' mocap_px4_bridge/src/mocap_px4_bridge.cpp
