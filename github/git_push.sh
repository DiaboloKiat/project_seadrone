#!/bin/bash

git config --global user.name "DiaboloKiat"
git config --global user.email "DiaboloKiat@gmail.com"

git status
git checkout master
echo "Enter your message"
read message

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
source ~/$REPO/github/git_branch.sh $1
pwd
echo "$REPO"
echo "---------------------------------------------------------------------------------------------------"
source ~/$REPO/github/git_pull.sh $1
pwd

PULLSTAT=$?
if [ "$PULLSTAT" -gt 0 ]
then
   echo "There is conflict. Aborting"
   cd ~/$REPO
   return
fi
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------------pull success--------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"


#push master

echo "---------------------------------------------------------------------------------------------------"
echo "--------------------------push hand-gesture-recognition-using-mediapipe----------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/hand-gesture-recognition-using-mediapipe
git add -A
git commit -m "${message} on hand-gesture-recognition-using-mediapipe"
git push origin main

# echo "---------------------------------------------------------------------------------------------------"
# echo "------------------------------------------push pozyx_ros-------------------------------------------"
# echo "---------------------------------------------------------------------------------------------------"
# cd ~/$REPO/catkin_ws/src/pozyx_ros
# git add -A
# git commit -m "${message} on pozyx_ros"
# git push origin devel-kiat

echo "---------------------------------------------------------------------------------------------------"
echo "------------------------------------------push seadrone_base---------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
source ~/$REPO/catkin_ws/src/seadrone_base/github/git_push.sh project_seadrone
cd ~/$REPO

echo "---------------------------------------------------------------------------------------------------"
echo "------------------------------------------push duckieboat_base-------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
source ~/$REPO/catkin_ws/src/duckieboat_base/github/git_push.sh project_seadrone
cd ~/$REPO

echo "----------------------------------------------------------------------------------------------------"
echo "--------------------------------------push project_seadrone-----------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
cd ~/$REPO
git add -A
git commit -m "${message} on project_seadrone"
git push origin $BRANCH


cd ~/$REPO