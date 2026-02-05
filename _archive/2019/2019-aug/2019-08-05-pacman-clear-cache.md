---
layout: post
title: "Pacman 사용시 유의점"
tags: [pacman cache]
author: "Keith"
---

Pacman은 yum이나 apt-get처럼 패키지관리를 하는 프로그램인데 사실 arch linux라든가 mingw64에서 정도에서 쓰고 있다고 보면 될 것 같다. 

이것의 문제는 계속 패키지 버전업을 하면서 cache에 파일을 가져다놓는데 revert할 땔 생각한 것인지 구버전의 패키지를 지우지 않는다는 것이다. 일부러 cache를 clean해야 하는데 다음과 같이 해준다.

```
pacman -Sc
```

이상!