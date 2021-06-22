<h1 align="center"> Seadrone </h1>

This is a project repo for seadrone.

---
## How to clone repo
If you have ssh-key, you can run this command
```
$ git clone git@github.com:DiaboloKiat/project_seadrone.git
```

If you have not ssh-key, you can run this command
```
$ git clone https://github.com/DiaboloKiat/project_seadrone.git
```
---
## How to run docker
First you need to build docker
```
$ cd ~/project_seadrone/docker/laptop
$ source docker_build.sh
```

Now you can run your docker
```
$ cd ~/project_seadrone/docker/laptop
$ source docker_run.sh
```
or
```
$ source docker/laptop/docker_run.sh
```

If you want to open a second terminal with docker, you can run this command
```
$ cd ~/project_seadrone/docker/laptop
$ source docker_join.sh
```
or
```
$ source docker/laptop/docker_join.sh
```
---
## How to pull or push the repo
### git-pull
```
$ source github/git-pull-master.sh
```
### git-push
```
$ source github/git-push-master.sh
```
- First enter the commit message
- Second enter the user name and password (**If you have not ssh-key**)

---
## How to run Seadrone
### Start Seadrone
```
            $ cd ~/project_seadrone
            $ source docker/laptop/docker_run.sh
container   $ source catkin_make.sh
container   $ source environment.sh
container   $ source start_seadrone_env.sh
```

#### Example Print Out
```
-----------------------------
depth = 0
goal depth = -0.0040791
goal_euler = -4.72688
imu = -4.75276 -0.0404422 -0.0471007 -0.00319267 0 0.00212845
-----------------------------
rx 5 thrusters
measured rpm = 0 0 0 0 5
command rpm = 0 0 0 0 0
battery voltage = 29.7708

-----------------------------
Camera = 0
LED[top/bot] = [0 / 0]
-----------------------------
```

### [Procman](https://github.com/DiaboloKiat/procman)
- Hot-key

| Hot Key     | Function           |
|:-----------:|:------------------:|
| Ctrl + S    | Start              |
| Ctrl + T    | Stop               |
| Ctrl + R    | Restart            |
| Ctrl + A    | Select All         |

- clone procman repo and setup 
```
$ git clone https://github.com/DiaboloKiat/procman.git
```

---





