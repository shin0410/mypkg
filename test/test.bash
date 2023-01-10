#!/bin/bash

dir=~
[ "$1" != ""] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 10 ros2 launch mkpkg talk_listen.launch.py > /tmp/mypkg.log

cat /tmp/mypkag.log |
grep 'Listen*10'
