---
layout: post
title: "Docker on a mac"
tages: [docker, mac, ubuntu]
categories:
    - computer
author: "Keith"
---

Linux on windows 10을 경험해 본 바 docker와 크게 다를 것이 없어보이는 반면 설치가 간단하다는 장점과 마소가 뭔가를 지원한다는 차이점이 있었는데, 마찬가지로 linux를 natively 별도의 partition에 설치하지 않고 MacOS 안에서 편하게 사용하기 위하여 docker를 올려보았다.

1시간 동안 가지고 놀아본 결과
- 속도는 거의 native linux installation을 한 것과 유사하게 나타났다. 아주 조금 느리다. g++이 clang+LLVM보다 훨씬 빠르다.
- 아직 몇 가지 해결 못한 점 (dbus 관련)만 처리해주면 별도로 리눅스를 설치하고 멀티 부팅할 필요 없어 보인다.

아마도 곧 리눅스 파티션을 날려버리게 될 것 같다. 맥에서 온갖 일을 다 벌여놓고 외부 머신에 접속하지 않고 리눅스를 쾌적하게 사용할 수 있었다. XQuartz를 사용해 본 결과 윈도우즈에서 Xming을 쓰는 것 보단 자연스러워서 좋긴 했지만 native installation을 했을 때의 desktop에 비하면 약간 좀 느리고 답답한 느낌은 있다. 귀찮게 멀티부팅하고 환경 새로 잡아주고 하는 것에 비하면 이 정도는 감수할 만하다. 대부분 터미널을 띄워서 command line으로 작업하는 일이 많기 때문에 사실 이편이 훨씬 낫다. 작업을 하다가 중단하더라도 재부팅을 할 필요없이 최종 중단 시점에서 작업을 재개할 수 있으니 더 좋다.

추가로 호기심이 발동하여..

처음 컨테이너는 우분투로 두번째 컨테이너는 arch linux로 만들어보았는데, 이해가 가지 않는 것이 같은 코드를 컴파일해서 실행했을 때 arch-linux 쪽이 월등히 빠른 것이다. 더 웃긴 것은 ubuntu native install된 파티션으로 부팅해서 실행했을 때보다도 더 빠르다.

그러니까, 

arch linux (docker container) >> ubuntu (native install) > ubuntu (docker container) >>> mingw32/64 on Windows

이런 순서가 되겠다. 같은 C++ code를 같은 compiler로 컴파일 하였음에도 불구하고 같은 머신에서 이 정도로 속도차이가 발생하는 것이 이해가 잘 되지 않는다. 뭐냐 도대체 문제가??

Raspberry pi를 애용하게 되면서 사실 리눅스라도 arch linux를 많이 좋아라하게 되었는데, 정말 의미가 있긴 있는 것이구나 하게 된다. 어차피 늙어가면 갈 수록 GUI가 편할 때도 있지만 설치하고 관리하고 귀찮아서 command line에서 다 자동화해버리게 된다. 일은 좌우간 빨리 처리하고 노는 게 장땡이다. 

P.S.: gcc(g++)이 8.0으로 넘어가면서 매우 빨라졌다. 7점 대의 gcc와도 확연한 차이를 보인다. 위 내용에서 속도가 저렇게 나타났다는 것은 모두 기본 배포된 gcc를 이용했을 경우에 그렇다는 것이다. arch linux 배포판은 gcc 8.1을 기반으로 하고 있으니까 상당히 빠른 편인데 ubuntu는 이번에 나온 18.04에서 gcc 7이 들어있다. 여전히 8.1보단 느리다. MacOS에서도 gcc 8.1 설치후에 측정해본 결과 docker에서 arch linux + gcc 8.1보다 약간 빠르게 나타났다. 그만큼 컴파일러 성능이 많이 좋아진 것으로 보여진다.
