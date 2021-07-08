#!/bin/bash

git checkout master

cd ~/project_seadrone/catkin_ws/src/seadrone_base
git checkout master

cd ~/project_seadrone/catkin_ws/src/hand-gesture-recognition-using-mediapipe
git checkout main

cd ~/project_seadrone/catkin_ws/src/seadrone_base/sensors/vision_opencv
git checkout melodic

cd ~/project_seadrone/catkin_ws/src/seadrone_base/sensors/realsense-ros
git checkout 2.2.15

cd ~/project_seadrone/catkin_ws/src/seadrone_base/sensors/apriltags-ros
git checkout indigo-devel

cd ~/project_seadrone