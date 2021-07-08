#!/bin/bash

git config --global user.name "DiaboloKiat"
git config --global user.email "DiaboloKiat@gmail.com"

git status
git checkout master
echo "Enter your message"
read message

BRANCH=master
if [ ! -z "$1" ]; then
    echo "operator on branch: $1"
    BRANCH=$1
fi

echo "--------------------------------------------------------------------------------"
source ~/project_seadrone/github/git_pull.sh $BRANCH

PULLSTAT=$?
if [ "$PULLSTAT" -gt 0 ] ; then
   echo "There is conflict. Aborting"
   cd $cur_path/
   return
fi
echo "--------------------------------------------------------------------------------"
echo "-------------------------pull success-------------------------------------------"
echo "--------------------------------------------------------------------------------"


# push master

echo "-----------------------------------------------------------------------"
echo "--------------------------push seadrone_base----------------------------"
echo "-----------------------------------------------------------------------"
cd ~/project_seadrone/catkin_ws/src/seadrone_base
git add -A
git commit -m "${message} on seadrone_base"
git push

echo "---------------------------------------------------------------------------------------------------"
echo "--------------------------push hand-gesture-recognition-using-mediapipe----------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/project_seadrone/catkin_ws/src/hand-gesture-recognition-using-mediapipe
git add -A
git commit -m "${message} on hand-gesture-recognition-using-mediapipe"
git push origin main

echo "--------------------------------------------------------------------------------"
echo "---------------------------push project_seadrone--------------------------------"
echo "--------------------------------------------------------------------------------"
cd ~/project_seadrone/
git add -A
git commit -m "${message} on project_seadrone"
git push
