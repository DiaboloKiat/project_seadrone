#!/bin/bash

cd ~/project_seadrone
git submodule init
git submodule update --recursive


echo "--------------------------------------------------------"
echo "------------------seadrone_base-------------------------"
echo "--------------------------------------------------------"
cd ~/project_seadrone/catkin_ws/src/seadrone_base
git submodule init
git submodule update --recursive

echo "------------------update submodule----------------------"

