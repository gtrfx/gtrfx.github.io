---
title: "Running Cadence stratus/genus on CentOS7 Docker Container"
tags: [docker, candence, stratus]
---

centos6에서 더 잘 돌아가는 것 같은데, WSL위에서는 centos7만 돌아간다. Docker를 쓰지 않고 CentOS7 WSL을 써도 된다 (이게 더 낫다).

어쨌든 지원하는 OS니까 아래와 같이 추가 패키지 더하면 된다. 물론 그전에 yum update/upgrade 한판 해주고 넘어간다.

```
sudo yum install perl
sudo yum install libxcb
sudo yum install libX11
sudo yum install libXScrnSaver
sudo yum install libXft
sudo yum install libGL
sudo yum install which
sudo yum install gcc
sudo yum install perl-Env
```