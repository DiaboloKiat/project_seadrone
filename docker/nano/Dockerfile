FROM nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.7-py3


############################ USER ###############################
# setup environment
ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/bin/bash \
    USER=seadrone \
    NB_UID=1000 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ENV HOME=/home/${USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${USER}

RUN echo "root:root" | chpasswd
RUN echo "${USER}:111111" | chpasswd

###################################### basic tools #####################################

RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
    && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    locales \
    cmake \
    make \
    git \
    vim \
    gedit \
    wget \
    sudo \
    unzip \
    ffmpeg \
    python3-dev \
    protobuf-compiler \
    pkg-config \
    lsb-release \
    build-essential \
    net-tools \
    dirmngr \
    gnupg2 \
    mercurial \
    gtk+-3.0 \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    libpcap-dev \
    libusb-1.0 \
    tzdata \
    libglfw3-dev \
    libmetis-dev \
    python-gtk2 \
    python-gobject \
    python-tk \
    python3-pip \
    python3-opencv  \
    python3-numpy \
    python3-empy  \
    python3-scipy   \
    python3-setuptools \
    python3-empy  \
    libfltk1.3-dev \ 
    freeglut3-dev \ 
    libpng-dev \ 
    libjpeg-dev \
    libopencv-dev \
    libxft-dev \ 
    libxinerama-dev \ 
    libtiff5-dev \ 
    netbase \ 
    fluid \ 
    xterm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

###################################### ROS #####################################

# setup keys and source.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros1-latest.list

# install ros packages
ENV ROS_DISTRO melodic
RUN apt-get update && apt-get install -y \ 
    ros-${ROS_DISTRO}-desktop-full \
    ros-$ROS_DISTRO-serial \
    ros-$ROS_DISTRO-soem \
    ros-$ROS_DISTRO-openslam-gmapping \
    ros-$ROS_DISTRO-geodesy \
    ros-$ROS_DISTRO-cartographer-* \
    ros-$ROS_DISTRO-cartographer-ros \
    ros-$ROS_DISTRO-cartographer-rviz \
    ros-$ROS_DISTRO-ddynamic-reconfigure \
    ros-$ROS_DISTRO-perception \
    ros-$ROS_DISTRO-rgbd-launch \
    ros-$ROS_DISTRO-joystick-drivers \
    ros-$ROS_DISTRO-pointcloud-to-laserscan \
    ros-$ROS_DISTRO-robot-localization \
    ros-$ROS_DISTRO-spacenav-node \
    ros-$ROS_DISTRO-tf2-sensor-msgs \
    ros-$ROS_DISTRO-controller-manager \
    ros-$ROS_DISTRO-twist-mux \
    ros-$ROS_DISTRO-velodyne-simulator \
    ros-$ROS_DISTRO-gazebo-ros \
    ros-$ROS_DISTRO-move-base-msgs \
    ros-$ROS_DISTRO-hector-gazebo \
    ros-$ROS_DISTRO-hector-trajectory-server \
    ros-$ROS_DISTRO-lms1xx \
    ros-$ROS_DISTRO-rviz-imu-plugin \
    ros-$ROS_DISTRO-interactive-marker-twist-server \
    ros-$ROS_DISTRO-teleop-twist-joy \
    ros-$ROS_DISTRO-rosserial-arduino \
    ros-$ROS_DISTRO-rosserial \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

##################################### PIP ######################################

RUN pip3 install --upgrade pip setuptools

RUN pip3 install \
    numpy \
    rospkg \
    catkin-tools \
    cython \
    pandas \
    image \
    Pillow \
    pandas \
    pypozyx \
    empy \
    gdown

####################################### procman ###########################################

RUN cd ${HOME} && git clone https://github.com/lcm-proj/lcm \
    && cd lcm \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install

RUN cd ${HOME} && git clone https://github.com/DiaboloKiat/procman \
    && cd procman \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install

####################################### Install bazel ###########################################

ARG BAZEL_VERSION=3.7.2
RUN cd ${HOME} && mkdir /bazel \
    && wget --no-check-certificate -O /bazel/installer.sh "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh" \
    && wget --no-check-certificate -O  /bazel/LICENSE.txt "https://raw.githubusercontent.com/bazelbuild/bazel/master/LICENSE" \
    && chmod +x /bazel/installer.sh \
    && /bazel/installer.sh \
    && rm -f /bazel/installer.sh

######################################## realsense ########################################

RUN apt-get update && apt-get install -y \
    libsuitesparse-dev\
    software-properties-common \
    libusb-1.0-0-dev \
    libx11-dev \
    xorg-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

# set the version of the realsense library
ENV LIBREALSENSE_VERSION 2.36.0
RUN wget https://github.com/IntelRealSense/librealsense/archive/v${LIBREALSENSE_VERSION}.tar.gz --no-check-certificate && \
    tar -xvzf v${LIBREALSENSE_VERSION}.tar.gz && \
    rm v${LIBREALSENSE_VERSION}.tar.gz && \
    mkdir -p librealsense-${LIBREALSENSE_VERSION}/build && \
    cd librealsense-${LIBREALSENSE_VERSION}/build && \
    cmake .. && \
    make && \
    make install && \
    rm -rf librealsense-${LIBREALSENSE_VERSION}

####################################### mediapipe ###########################################

# https://github.com/PINTO0309/mediapipe-bin
RUN pip3 install pip --upgrade \
    opencv_contrib_python

RUN cd ${HOME} && git clone https://github.com/PINTO0309/mediapipe-bin \
    && cd mediapipe-bin

RUN cd ${HOME} && git clone -b v0.8.4 https://github.com/google/mediapipe \
    && cd mediapipe \

# $ sed -i -e "/\"imgcodecs\"/d;/\"calib3d\"/d;/\"features2d\"/d;/\"highgui\"/d;/\"video\"/d;/\"videoio\"/d" third_party/BUILD
# $ sed -i -e "/-ljpeg/d;/-lpng/d;/-ltiff/d;/-lImath/d;/-lIlmImf/d;/-lHalf/d;/-lIex/d;/-lIlmThread/d;/-lrt/d;/-ldc1394/d;/-lavcodec/d;/-lavformat/d;/-lavutil/d;/-lswscale/d;/-lavresample/d" third_party/BUILD

# $ sed -i -e "/^        # Optimization flags/i \        \"ENABLE_NEON\": \"OFF\"," third_party/BUILD
# $ sed -i -e "/^        # Optimization flags/i \        \"WITH_TENGINE\": \"OFF\"," third_party/BUILD

# $ wget https://github.com/PINTO0309/Bazel_bin/raw/main/3.7.2/aarch64/install.sh
# $ sudo chmod +x install.sh
# $ ./install.sh

# $ sudo python3 setup.py gen_protos
# $ sudo bazel clean --expunge
# $ sudo python3 setup.py bdist_wheel


##################################### Setting #####################################

RUN chown -R ${USER}:${USER} ${HOME}/
RUN echo "seadrone ALL=(ALL)  ALL" > /etc/sudoers

RUN echo "cd ~/project_seadrone" >> ${HOME}/.bashrc

# Support of nvidia-docker 2.0
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=all

# setup entrypoint
COPY ./ros_entrypoint.sh /
RUN chmod 777 /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

USER ${USER}

WORKDIR ${HOME}

