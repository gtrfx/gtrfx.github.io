---
title: "Linux에 MATLAB 설치하기"
layout: post
tags: [matlab]
---

Linux에서는 docker로 matlab을 불러다 쓸 수 있으니까 최소희생으로 설치하게 되면 도움이 많이 된다. 

arch linux의 경우는 최신 리눅스임에도 설치가 아주 깔끔하진 않은데, glnxa64안에 있는 install_linux_legacy라는 스크립트를 이용해야 설치가 된다. selinux lib같은 것을 요구하기도 하고.

docker에서 부르게 되면 실행이 되는 듯하다가 마는데, x 관련 라이브러리가 있어야 된다. 그냥 간단히 xterm 정도 설치해주면 실행에 문제가 없이 할 수 있다.
