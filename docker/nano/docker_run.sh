 
#!/bin/bash

docker run -it \
  -e DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY=$XAUTH \
  -v "$XAUTH:$XAUTH" \
  -v "/home/$USER/project_seadrone:/home/seadrone/project_seadrone" \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v "/etc/localtime:/etc/localtime:ro" \
  -v "/dev:/dev" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -v "/home/$USER/.bashrc:/home/seadrone/.bashrc" \
  --workdir "/home/seadrone/project_seadrone" \
  --name project_seadrone \
  --network host \
  --rm \
  $DOCKER_OPTS \
  --privileged \
  --security-opt seccomp=unconfined \
  diabolokiat/seadrone-project:nano \
  bash
