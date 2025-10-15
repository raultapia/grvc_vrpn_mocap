#!/usr/bin/env bash
USE_PX4_MSGS=true
PX4_MSGS_COMMIT=main

rosdep install --from-paths . -y --ignore-src

if [ "$USE_PX4_MSGS" = true ]; then
  rm -rf px4_msgs/COLCON_IGNORE
  (cd px4_msgs && git checkout "${PX4_MSGS_COMMIT}")
else
  touch px4_msgs/COLCON_IGNORE
fi
