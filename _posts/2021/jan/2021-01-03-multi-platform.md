---
title: "Multiplatform build"
tags: [multiplatform build]
layout: post
author: "Keith"
---

x86세계에서 존재하는 C/C++ 빌드 조건은 아마도 다음이 아닐까 한다.

- Linux x86_64, i686
- Windows (MS Visual C/C++) x64, x86
- Mingw32, Mingw-W64
- MacOS (x86_64)

그냥 순수하게 바라보면 적어도 3개의 OS가 설치된 (가상)머신이 있어야 되는 것 아닐까 하게 되는데, 생각보다 Linux는 포용력이 있어서 Windows를 Wine으로 포용할 수 있다.

무슨 말이냐면 Linux는 MSVC와 MinGW를 함께 다룰 수가 있다. 하나의 플랫폼에서 6개의 바이너리를 만들어낼 수 있다. 아쉽게도 MacOS용으로 빌드할 수는 없다. 일종의 크로스컴파일이라고 봐야하는데 안된다. 

따라서, MacOS는 VM을 통해서 부르거나 MacOS가 host가 되고 Linux를 guest로 불러다가 6개의 다른 플랫폼용 바이너리를 빌드하게 되면 x86세계의 거의 모든 바이너리를 빌드할 수 있다. Docker를 쓰면 더 다양한 빌드도 가능하겠지만.

결론은

- 다양한 플랫폼 빌드를 위해서 쓸데없이 많은 VM을 쓰지 말자. Linux 하나가 윈도우즈까지 포용할 수 있다.
- x86세계의 모든 플랫폼을 지원하려는 빌드를 실현하자면 MacOS를 Host로, Linux를 VM으로 부르는 구성이 가장 효율적이라고 본다.

여기서 질문이 나올 수 있다.

AARCH64에서는 wine이 가능하냐고? 그렇다 ARM64용 윈도우즈 바이너리 구동 가능하다. Apple M1을 가지고 있다면 여기서 MacOS/Windows/Linux용 빌드가 가능하다. 