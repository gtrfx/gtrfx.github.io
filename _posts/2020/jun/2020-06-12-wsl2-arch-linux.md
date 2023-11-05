---
title: "WSL2용 arch linux: systemd가 돌아간다"
tags: [arch linux, wsl2]
layout: post
author: "Keith"
---

제목과 같다. WSL로 arch linux를 쓰고 싶은 사람은 그냥 구글링하면 바로 쓸 수가 있다.

단, WSL2에서 systemd가 제대로 돌아가는 Linux를 받아보면 wsl를 terminate하기 전까진 vmmem (WSL용 가상머신 프로세스)이 제법 많은 메모리를 점유하는 것도 모잘라 대략 5-10%의 시스템 로드를 무슨 이유에서인지 계속해서 점유하고 있다. 

systemd가 WSL에서 돌고 있는 것의 장점은 대충 딱 하나다. docker를 쓸 수 있다는 것이다. 윈도우즈 하이퍼바이저 킷으로 돌아가는 windows용 docker desktop이 아니라 WSL에서 돌아가는 리눅스 위에 돌리는 docker이다. linux에서 docker를 써본 사람은 알겠지만, 이게 MacOS/Windows에서 돌아가는 docker desktop보다 매우 간편하고 띄우기가 매우 쉽다. 왜? systemd 때문에 시스템이 부팅하자 마자 dockerd가 뜨고 그게 내내 떠있어서 생각날 때마다 그냥 컨테이너를 불러서 돌려버리면 된다. 물론 윈도우즈나 MacOS도 부팅할 때 docker desktop이 뜨긴 하지만, 스스로 리눅스 커널을 불러다가 가상머신위에 띄우는데 시간이 제법 소요된다. WSL은 써본 사람은 알겠지만 커맨드에서 WSL을 부르면 그냥 새로운 쉘하나를 불러서 뜨는 것 같이 가볍게 뜬다. 물론 처음 뜰 때는 systemd로 몇 가지 daemon들이 떠오를테니 아주 약간의 시간이 더 들어가긴 한다만 docker desktop이 떠오를 때처럼 묵직한 느낌은 전혀 없다.

일단 떠오른 다음 성능은 native linux와 거의 차이 없이 빠르게 돌아간다. 여기에 arch linux가 붙어서 돌아간다. arch linux를 바닥에서 설치해본 사람은 알겠지만, 이게 엄청나게 번거로운데 WSL이 나머지는 다 해주고 있으니 응용프로그램 하나 뜨는 것보다도 더 가볍게 윈도우즈 위에서 arch linux를 돌릴 수 있다. 사실 WSL로 arch linux를 올려쓴 뒤로는 한달동안 열심히 쓰던 linux로도 잘 부트하지 않고 MacOS로도 잘 부트하지 않고 오직 윈도우즈만 쓴다. 

업무상 Office365 웹앱과 여기 그대로 연결된 MS office, 그리고 windows와 linux를 오가야 하는 일이 많다보니 더 그러하다. 

뭐 거두절미하고,
- WSL2는 엄청 빠르다. ext4는 VM용 파일 시스템으로 따로 돌아서 훨씬 더 빠르다.
- Docker도 Docker desktop보다 가볍고 빠르게 돌아간다.
- 그외 수많은 linux util들 빠르게 설치해서 빠르게 불러서 쓸 수 있다.


