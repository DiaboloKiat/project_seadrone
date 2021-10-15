#! /bin/bash

# echo "password: $2"
git checkout master
BRANCH=master
if [ ! -z "$1" ]; then
    echo "pull branch: $1"
    BRANCH=$1
fi

echo "---------------------------------------------------------------------------------------------------"
echo "------------------------------------pull project_seadrone------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in project_seadrone. Aborting"
   return 1
fi

# echo "---------------------------------------------------------------------------------------------------"
# echo "---------------------------------------pull seadrone_base------------------------------------------"
# echo "---------------------------------------------------------------------------------------------------"
# cd ~/project_seadrone/catkin_ws/src/seadrone_base
# git checkout $BRANCH
# git pull

# CONFLICTS=$(git ls-files -u | wc -l)
# if [ "$CONFLICTS" -gt 0 ] ; then
#    echo "There is conflict in seadrone_base. Aborting"
#    return 1
# fi

BRANCH=main
echo "---------------------------------------------------------------------------------------------------"
echo "--------------------------pull hand-gesture-recognition-using-mediapipe----------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/project_seadrone/catkin_ws/src/hand-gesture-recognition-using-mediapipe
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in hand-gesture-recognition-using-mediapipe. Aborting"
   return 1
fi

# BRANCH=melodic
# echo "---------------------------------------------------------------------------------------------------"
# echo "-------------------------------------pull vision_opencv--------------------------------------------"
# echo "---------------------------------------------------------------------------------------------------"
# cd ~/project_seadrone/catkin_ws/src/seadrone_base/sensors/vision_opencv
# git checkout $BRANCH
# git pull

# CONFLICTS=$(git ls-files -u | wc -l)
# if [ "$CONFLICTS" -gt 0 ] ; then
#    echo "There is conflict in vision_opencv. Aborting"
#    return 1
# fi

# BRANCH=indigo-devel
# echo "---------------------------------------------------------------------------------------------------"
# echo "-------------------------------------pull apriltags-ros--------------------------------------------"
# echo "---------------------------------------------------------------------------------------------------"
# cd ~/project_seadrone/catkin_ws/src/seadrone_base/sensors/apriltags-ros
# git checkout $BRANCH
# git pull

# CONFLICTS=$(git ls-files -u | wc -l)
# if [ "$CONFLICTS" -gt 0 ] ; then
#    echo "There is conflict in apriltags-ros. Aborting"
#    return 1
# fi

# echo "---------------------------------------------------------------------------------------------------"
# echo "-------------------------------------pull realsense-ros--------------------------------------------"
# echo "---------------------------------------------------------------------------------------------------"
# cd ~/project_seadrone/catkin_ws/src/seadrone_base/sensors/realsense-ros
# git checkout 2.2.15
# git pull

# CONFLICTS=$(git ls-files -u | wc -l)
# if [ "$CONFLICTS" -gt 0 ] ; then
#    echo "There is conflict in realsense-ros. Aborting"
#    return 1
# fi

cd ~/project_seadrone
return 0
