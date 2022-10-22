---
title: "Apple M1에서 QEMU.."
tags: [qemu, apple m1]
---

M1에서 rosetta2는 virtual machine을 지원하지 않기 때문에 x86 qemu를 rosetta로 돌릴 수는 없다고 한다. 결국 apple m1에 설치한 qemu x86은 모든 instruction을 emulate하는 것이기 때문에 수행속도는 매우 느리다. 결국 x86용 윈도우즈는 설치할 수는 있지만 속도가 너무 처참해서 사용하기에 좋지 않다.

대신 M1 mac에서 docker로 x86 container를 불러다 쓰는 것은 rosetta로 가능하다고 한다. 100% 믿을만 하다고는 할 수 없지만. 일단 그래픽을 사용하지 않는다고 하면 큰 도움이 되겠지 싶기도 하다. 물론 MacOS 13인 Ventura에서 가능하다고 한다. 대충 확인해 본 바 Virualization Framework이 생겨났고 이게 swift를 통해서 불려질 수 있다고 한다. 기본적으로 MacOS 위에 MacOS를 virtual machine으로 올리거나 Linux를 올리는 일이 가능해지고 여기에 덤으로 x86 binary를 rosetta를 통해서 돌릴 수 있다는 말이다.

이렇게 아예 대놓고 OS가 VM을 지원해버리면 qemu 같은 걸 힘들여 돌릴 이유가 없어진다. 왜냐면 native VM을 쓰는 게 훨씬 간편하고 빠르기 때문이다.

일단 QEMU로 alpine linux aarch64를 설치하고 그 위에 dockerd를 올려놓고 docker로 arch linux까지 불러서 geekbench를 돌려봤는데 single core speed는 대략 8% 정도 떨어지는데 이상하게도 multicore score가 MacOS에서 native로 돌렸을 때 보다 훨씬 높은 점수가 나온다. 만약 M2에서 돌렸다면 single core speed는 VM 상에서도 대략 M1을 넘어설 것으로 보여진다.

재미삼아 오래된 안드로이드 폰에 linux를 올려놓고 geekbench를 돌려봤는데 single core score가 550에 multicore score는 1649 정도가 나온다. 거의 단순한 일밖엔 시킬 수 없음을 보여준다.

