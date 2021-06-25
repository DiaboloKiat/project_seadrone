#! /bin/bash

# echo "password: $2"
git checkout master
BRANCH=master
if [ ! -z "$1" ]; then
    echo "pull branch: $1"
    BRANCH=$1
fi

echo "--------------------------------------------------------------------------------"
echo "---------------------------pull project_seadrone--------------------------------"
echo "--------------------------------------------------------------------------------"
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in project_seadrone. Aborting"
   return 1
fi

echo "-----------------------------------------------------------------------"
echo "--------------------------pull seadrone_base----------------------------"
echo "-----------------------------------------------------------------------"
cd ~/project_seadrone/catkin_ws/src/seadrone_base
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in seadrone_base. Aborting"
   return 1
fi

cd ~/project_seadrone
return 0
