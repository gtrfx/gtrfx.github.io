---
title: "Apple M1 관련: Docker"
image: https://www.threatstack.com/wp-content/uploads/2017/06/docker-cloud-twitter-card.png
tags: [apple m1]
---

대략 2주 전에 docker for apple m1이 나왔다. M1에서 docker desktop을 돌리는 것인데, hypervisor framework을 통해서 돌리는 것이라 QEMU로 AARCH64 가상 머신을 돌리는 것과 별 다르지 않다. 

결국 docker를 통해서 돌릴 수 있는 것은 aarch64 linux image이고 그 image의 개수는 x86과 비교할 때 한참 떨어진다.

좀 이해하기 어려운 것은 x86 linux image도 일단 pulling해서 실행을 시도해 볼 수 있다는 것이고, 물론 이 이미지를 가지고 컨테이너를 실행할 수는 없다. 실행하면 에러가 발생하는 것이고 다시 말해 docker가 있다고 하더라도 x86 image를 돌릴 수는 없고, 정하고자 한다면 qemu를 가지고 x86 linux 커널을 실행하고 그 위에서 docker를 돌리는 것이다. 알다시피 arm64 환경에서 qemu x86_64를 돌리면 속도가 현저히 떨어지게 되고 rosetta로 qemu x86 binary를 돌릴 수도 없다. 왜? qemu x86은 x86 hypervisor framework을 이용하는데 그것이 m1 MacOS 상에 있지 않기 때문이다.

대충 이런 시나리오라면 x86_64의 qemu/VM도 apple M1에서 약간의 성능저하를 감수하면 돌릴 수 있지 싶다.

x86_64 qemu를 apple M1으로 포팅하되 가속기를 hypervisor framework으로 사용하는 것이다. 말은 간단하지만 실제 이게 가능할지 (아마도 지금 시도하는 사람들이 제법 있지 싶다) 싶은데 만약 가능하다면 충분히 좋은 성능의 x86 Windows/Linux를 M1에서 돌리는 것도 가능하다만.

지금은 불가능하단 것이다. Docker desktop이 없이도 Qemu aarch64를 가지고 linux를 구동하고 그 위에서 docker를 구동시키면 같은 결과를 얻을 수 있다. 물론 실행속도도 충분히 빠르고 docker대비 부팅도 더 빠를 것이라고 본다. 물론 어떤 linux image를 docker를 위해 사용하느냐에 따라 다르지만.

그런데, 사실 따지고 보면 webserver라든가 특정 서버 애플리케이션이 설치된 컨테이너를 구동해야 되는 것이 아닌 특정 버전의 Linux를 써야겠다고 보면 apple M1상에서는 아무런 선택의 여지가 없다. aarch64 이미지가 제공되는 linux가 얼마 없는데다가 그게 실제로 존재한다 하더라도 x86 linux와 다르기 때문이다.

요약하면
- Docker desktop이 preview이긴 하지만 Apple M1에서 사용할 수 있다. 다만 aarch64 리눅스 이미지만 구동시킬 수 있다.
- x86 linux image를 쓰고 싶다면 qemu 같은 것을 통해서 x86 가상 머신을 띄워야 한다. 당장엔 이것이 쉽지 않고, 엄청난 성능저하를 감수해야 한다.
- Rosetta2와 M1 MacOS의 Hypervisor framework을 적절히 이용한다면 x86이미지를 돌릴 수도 있을 것 같지만, rosetta2가 realtime app이 아니고 실행할 이미지 전체를 rosetta로 변환하지 않으면 사실상 무의미하다. 
- Apple M1에서 x86 Linux image를 돌리겠다는 것은 우물에서 숭늉찾는 격이다. 아직까진.

내 입장에서 x86 linux image를 써야 할 일이 많고 그런 경우 m1보단 지금의 Ryzen이 더 적당하다. 비록 Virtual Box라고 하더라도 docker로 활용하기엔 충분히 성능이 우수하고 이런 조건에서 multicore score는 M1을 진작에 넘어서고도 남는다. 어쩔 수 없이 M1을 거를 수 밖에..