---
title: "WSL-Docker"
tags: [docker, wsl]
layout: post
author: "Keith"
---

WSL2에 와서 systemd가 제대로 되는 배포판이 몇 가지 있어서 이 덕택에 dockerd를 systemd로 불러서 WSL에서 쉽게 쓸 수 있다고 했다. 그런데, 문제가 하나 있다고 했다. 그 문제는 WSL을 쓰지 않는 동안에도 vmmem이 메모리와 시스템 로드를 점유하고 있는 것이라고 했다. WSL을 쓰지 않아도 일단 WSL을 한번이라도 불렀으면 메모리를 점유하게 된다. 모든 distro를 terminate하거나 WSL을 아예 shutdown하면 점유한 메모리가 없어지거나 줄어들게 되지만.

메모리를 점유하는 것은 그 양이 생각만큼 많지 않으니까 상관없다고 치는데, 시스템 로드를 7-10%정도 갉아먹는 것은 좀 봐주기 뭐하다. 무슨 일을 하느라 이렇게 먹어대고 있는가 해봐도 찾을 수는 없었다. 리눅스에서도 active하게 load를 잡아먹는 것이 없는데 그냥 계속 뭔가가 돌고 있으니까 말이다.

그런데, WSL이 사실상 docker container의 개념이기 때문에 윈도우즈에서 docker를 설치한다는 것이 무의미해졌다고 본다. 물론 Docker처럼 hub에 있는 수많은 리눅스 배포판이라든가 설치된 리눅스 이미지를 가져올 수는 없지만, 일단 현재 다양한 리눅스 배포판을 사용할 수 있는 것도 맞고 여러 개의 배포판을 하나의 Windows위에 설치해서 필요에 따라 불러쓸 수 있다. 그런 의미에서 Windows Terminal은 그동안 마소가 하던 것 치곤 참 괜찮은 것 같다. Windows Terminal에서는 WSL에 설치된 리눅스 이미지의 default shell을 실행시겨 접속할 수 있게 해주는 터미널이라고 볼 수 있다. 물론 CMD와 PowerShell도 부르고 Azure에 있는 어떤 리모트 가상 머신도 터미널 접속이 가능하다. 물론 commandline을 써서 할 수 있는 일은 다 할 수 있으니까 WSL 안에 있는 docker container를 부르든 가상 머신으로 들어가든 뭐든 할 수 있다. 다만, 이게 GUI로 되는 게 아니라 json 파일을 하나 편집해야되는 게 좀 다르다.

어쨌든 내가 봤을 때 여태 나온 이러저러한 텀 보다 낫다는 생각이다. 무엇보다도 여기 붙어 나오는 폰트 (Cascadia Code)가 이상하게 너무 맘에 든다. 그래서 작업할 때 Courier라든가 Mono Space font 이런 것들 대신 쓰고 있다.

또 주저리 주저리했는데, 요약하면 
- systemd를 활성화해서 dockerd를 띄워놓으면 이상하게 시스템 로드가 제법 올라간다. 
- WSL은 사실상 windows platform위의 docker같은 역할을 하는 것이라 docker를 부를 바에는 그냥 WSL로 배포판을 하나 더 깔자 (생각보다 이런 저런 배포판이 많고 (Kali linux라든가 Alpine linux도 있으면 말 다한 거 아닌가?), WSL 배포판을 만들 수 있는 SDK 비슷한 것도 나오고 있다.)

좀 의아하긴 한데, centos6는 WSL로도 못 하겠다 하고, docker로 불러도 실행이 안된다. CentOS 7은 배포판으로도 따로 있거니와 WSL의 docker로 불러도 잘 돌아간다.

다음에 남은 WSL의 문제는 이제 libGL을 어떻게 해결해야 하는가다. libGL을 실행하는 것들은 대부분은 에러를 내고 돌지 않는다.