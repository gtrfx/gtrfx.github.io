---
title: "Ryzen 해킨 토시에서의 가상머신"
image: https://cdn.mos.cms.futurecdn.net/eY5jzrEJfyAf9wBiDzDzTU.jpg
tags: [vm, ryzen]
---

MacOS에서 돌아가는 대개의 가상머신들이 kernel에서 지원하는 hypervisor framework을 사용하여 VM을 구동한다. 문제는 Ryzen CPU로 꾸민 해킨에선 이 기능이 동작하지 않는다. 그래서 더러의 VM을 쓰는 애플리케이션은 지원하지 않는 CPU라고 하며 중단되거나 동작속도가 매우 느리다거나 제대로 실행이 되지 않거나 한다.

그런데, VirtualBox는 잘 된다.

왜? VirtualBox는 자체적으로 VM을 지원하기 위하여 kext를 따로 두고 있다. 이게 AMD의 SVM을 지원한다. Hypervisor framework을 사용하는 것보단 또는 linux의 KVM을 사용하는 것보단 약간 느리지만 (이유는 알 수 없다) MacOS에서 아주 잘 쓸 수 있다.

VirtualBox는 interface는 다소 멍청해보일 수 있지만 headless로 구동이 가능하다. 무슨 말이냐고? 부팅시에 그냥 스크립트를 써서 부르면 조용히 VM이 떠오른단 말이다. 이렇게 구동하면 실행이 매우 빨라서 맨땅에서 VM을 켜고 linux하나 부팅하는데 10초가 걸리지 않는다. 내 경험으로는 hypervisor framework을 쓰는 docker desktop이 부트되는 것보다 빨랐다.

Ryzen이라서 MacOS에서 받는 불이익은 이제 몇 개 없다. AVX 관련 명령어를 쓰기 위해서 CPU 기종을 찾아내는 application들 (대개 library로 되어있다) 또 intel mkl 같은 것들을 쓰는 application에서만 문제가 생기고, 사실 대체하는 라이브러리를 따로 빌드하든가 누군가 빌드한 것을 가져다 쓰면 문제가 그냥 해결된다.

이미 세상에서 가장 빠른 x86은 AMD의 CPU가 되어버렸다. 해킨세계에서 Ryzen도 점점 더 보편화되어가고 있다. Apple에선 지원하지 않는 CPU라고 하지만. 