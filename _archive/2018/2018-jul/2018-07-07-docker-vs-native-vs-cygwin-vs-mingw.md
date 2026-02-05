---
layout: post
title: "Docker on a mac/windows/linux box, cygwin, mingw 성능 측정"
tags: [docker, mingw, cygwin, ubuntu, arch linux, wingows, mac]
categories:
    - computing
author: "Keith"
---

호기심이 발동해서 내가 직접 사용 중인 모든 환경에서 docker로 ubuntu/arch linux를 올려가며 실행 속도를 측정해보았다.

먼저, docker 설치 과정을 보면
- mac에서 가장 간단하고 빨리 설치되고
- linux가 다소 과정은 복잡하지만 가장 빨리 설치되고
- Windows에서 설치가 가장 느리다

뭐니뭐니해도 편리하고 느려터지지 않는 것은 Mac이다. 재부팅에 느린 부팅속도/복잡한 과정 등등등 속이 터져나가는 것이 Windows 얘는 원래 그러려니 한다. 

아래는 4k FFT를 10000회 실행했을 때의 실행시간 (FFT 및 난수발생 등등 포함)을 msec으로 나타낸 것이다. 차이가 매우 심하다 생각보다. 

| run time (ms) | platform | visiting os | notes |
|---|---|---|---|
|1496| MacOS 10.14(beta) | native | g++ 8.1 |
|1534| ubuntu (xenial) | docker(arch linux) | fastest one |
|1572| MacOS 10.14(beta) | docker(arch linux) |  |
|1579| Windows 10 | docker(arch linux) ||
|1607| ubuntu (xenial) | native | running a binary compiled in arch linux |
|1759| ubuntu (xenial) | docker(arch linux) | running a binary compiled in ubuntu (g++ 5) |
|1855| ubuntu (xenial) | native | running a binary compiled in the same ubuntu (g++ 5) |
|1889| windows 10 | ubuntu linux (xenial) | Linux on Windows10 |
|1937| windows 10 | - | cygwin64 |
|1938| MacOS 10.14(beta) | docker(unbuntu (bionic)) | running a binary built in the same visiting os |
|2376| MacOS 10.14 (beta) | native | clang + LLVM |
|8309| MacOS 10.14 (beta) | native | Java |

자 보았는가? 아마도 테스트하진 않았지만 최신의 arch linux를 native로 설치해서 빌드/실행하는 것이 가장 빠를 것으로 판단된다. 어쨌든 docker가 VM보다 확실히 유리하다는 게 보여진 셈인데 문제는 native 조건에서 build/run 한 것 보다 더 좋은 경우가 많다는 것이 특기할만한 것이다. arch linux:latest가 가장 성능이 우수했다. Arch linux를 native로 설치해서 사용하는 것이 불편하면 ubuntu 그게 싫다면 MacOS 그것도 아니면 windows 10에서 docker로 arch linux 컨테이너를 만들어서 빌드한 뒤에 실행하는 것이 (구하기 쉬운 OS를 이용하는 방법 중에서는) 가장 가볍고 빠른 솔루션이 아닐까 한다. 

좀 더 요약하자면,
- Linux/MacOS의 최근 커널 + 최근 gcc/g++ 및 Native 설치가 가장 빠르다. 불가하다면 Docker로 써서 돌려도 역시 빠르다.
- clang + LLVM의 속도는 다소 실망스럽다. 
- 부득이 윈도우즈를 써야 되는 것은 특정 애플리케이션 때문인데, 윈도우즈에서는 VM 이든 docker로 linux를 돌리든 별로 좋지 못하다.
