#!/bin/bash

if [ "$1" = "base" ]
then
    PROJECT=project_seadrone
    REPO=project_seadrone
else
    echo "Please enter your project"
    return 0
fi

cd ~/$REPO
git checkout master

############################## submodules ####################################
cd ~/$REPO/catkin_ws/src/hand-gesture-recognition-using-mediapipe
git checkout main

cd ~/$REPO/catkin_ws/src/pozyx_ros
git checkout devel-kiat

source ~/$REPO/catkin_ws/src/seadrone_base/github/git_branch.sh project_seadrone

##############################################################################

cd ~/$REPO