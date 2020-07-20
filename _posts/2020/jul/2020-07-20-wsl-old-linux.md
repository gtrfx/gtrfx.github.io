---
title: "WSL2에서 docker가 오래된 (GLIBC < 2.17) linux distro를 못 돌릴 때"
tags: [wsl, windows subsystem linux, docker]
---

WSL2에서 docker를 돌릴 수가 있다고 얘기했다. WSL에서는 못 한다 분명히. 이게 docker desktop을 쓰는 것보다 훨씬 빠르고 편리하다. Docker desktop for windows에서도 WSL2의 기능을 활용할 수 있는 옵션이 생겨있긴 하지만, WSL2에서 어떤 linux 배포판을 설치하고 그 위에 docker를 설치해서 docker를 쓰는 게 여전히 훨씬 간편하고 가볍다. 그래서 생각보다 쓰는 사람들이 꽤 많다.

MacOS만 되더라도 Docker desktop을 설치해야 한다. 그게 아니면 docker machine을 설치하고 hypervisor framework을 이용해서 가상머신을 돌게 하고 이 때 리눅스 커널의 이미지를 읽어오도록 해야한다. 그러나, 윈도우즈에서는 WSL이 이것을 한꺼번에 해주는 것이다. 

그런데 한가지 문제가 centos6 라든가 science linux6라든가 상대적으로 오래된 (대충 10년 넘은 것 같다) 리눅스 배포판을 docker로 돌릴 땐 그냥 죽어버린다. dockerd가 죽는 것은 아니고 container를 실행할 때 죽어버린다. 대충 그 이유는 WSL2가 default로 오래된 커널의 syscall을 지원하지 않기 때문인데, 그것을 가능하게 하는 옵션이 내부적으로 있다.

이것을 활성화하면 오래된 리눅스 이미지를 가져와서 docker에서 어려움 없이 쓸 수 있다.

윈도우즈의 사용자 루트 폴더에 ".wslconfig"를 만들고 그 내용을 아래와 같이 채운다.

```
[wsl2]
kernelCommandLine = vsyscall=emulate
```

이렇게 한 뒤에 wsl을 실행해보면 원하는 대로 고전 linux container로 무리 없이 실행할 수 있음을 확인할 수 있다.

단, 위 내용을 그대로 복사해야한다. 공백을 잘못 넣으면 동작하지 않는다. 또 방금전까지 wsl을 사용하고 있었다면 wsl -shutdown 시킨 뒤에 다시 wsl을 실행해야 변경사항이 적용되는 것을 잊지 말자. 