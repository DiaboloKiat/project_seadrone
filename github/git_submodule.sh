#!/bin/bash

if [ "$1" = "base" ]
then
    PROJECT=~/project_seadrone
    HOME=~/project_seadrone
else
    echo "Please enter your project"
    return 0
fi

cd $PROJECT
git submodule init
git submodule update --recursive


echo "--------------------------------------------------------"
echo "------------------seadrone_base-------------------------"
echo "--------------------------------------------------------"
cd $PROJECT/catkin_ws/src/seadrone_base
git submodule init
git submodule update --recursive

echo "--------------------------------------------------------"
echo "------------------duckieboat_base-----------------------"
echo "--------------------------------------------------------"
cd $PROJECT/catkin_ws/src/duckieboat_base
git submodule init
git submodule update --recursive

echo "------------------update submodule----------------------"

