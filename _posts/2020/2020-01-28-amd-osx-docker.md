---
title: "AMD-OSX: Docker on VMware Fusion"
tags: [docker]
---

1. Install VMware (<= ver 11)
2. Install docker-toolbox
3. create docker-vm

```
docker-machine create --driver vmwarefusion --vmwarefusion-no-share --vmwarefusion-boot2docker-url "https://github.com/boot2docker/boot2docker/releases/download/v19.03.5/boot2docker.iso" default
```

Just ignore the error message coming out during docker machine creation

4. modify system resource of the docker machine (don't have to switch on hyper-V features)
5. run "/Applications/Docker/Contents/Resources/Scripts/start.sh" after modifying it for VMware
6. Enjoy!

When your application needs a lot of file system access, just copy all your working files into your virtual file system for better performance.