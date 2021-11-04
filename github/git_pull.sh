#!/bin/bash

if [ "$1" = "base" ]
then
    PROJECT=project_seadrone
    REPO=project_seadrone
else
    echo "Please enter your project"
    return 0
fi

BRANCH=master
echo "---------------------------------------------------------------------------------------------------"
echo "------------------------------------pull project_seadrone------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ]
then
   echo "There is conflict in project_seadrone. Aborting"
   return 1
fi

BRANCH=main
echo "---------------------------------------------------------------------------------------------------"
echo "--------------------------pull hand-gesture-recognition-using-mediapipe----------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/hand-gesture-recognition-using-mediapipe
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ]
then
   echo "There is conflict in hand-gesture-recognition-using-mediapipe. Aborting"
   return 1
fi

BRANCH=devel-kiat
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------pull pozyx_ros------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/pozyx_ros
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ]
then
   echo "There is conflict in pozyx_ros. Aborting"
   return 1
fi

source ~/$REPO/catkin_ws/src/seadrone_base/github/git_pull.sh project_seadrone

source ~/$REPO/catkin_ws/src/duckieboat_base/github/git_pull.sh project_seadrone

cd ~/$REPO
return 0
