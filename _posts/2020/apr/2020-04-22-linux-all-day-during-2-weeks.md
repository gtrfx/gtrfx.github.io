---
title: "Linux를 2주 내내 사용해보고 느낀 소감."
layout: post
tags: [Linux everyday, QEMU]
---

Linux를 새삼스럽게 왜 쓰게 되었느냐 하면 윈도우로 자주 오가야 하는 일이 있는데, Ryzen으로 만든 PC에 MacOS를 올려서 쓰다보니 가상머신이 원활하게 동작하지 않았기 때문이다. MacOS의 장점 중 하나인 hypervisor kit을 사용할 수 없기 때문인데, 그 덕택에 그 흔한 docker도 사용할 수 없다. 

Intel CPU 머신이라면 Parallels desktop이 쾌적하게 돌아가기 때문에 큰 문제 없이 Linux/MacOS/Windows를 쉽게 오갈 수 있으나 Ryzen Hackintosh는 이게 매우 불편하다. Vmware Fusion 10까진 별 문제없이 사용을 할 수 있지만 매우 느리고 답답하다. 이걸 쓰다가 Qemu로 Linux위에서 MacOS/Windows가 돌아가는 지경을 보면 커널이 지원하는 가상머신이 이렇게 좋구나 하게 된다. Linux 위에 나머지 OS 둘을 올려두면 가볍고 빠르다는 리눅스의 장점을 최대한 살리면서 나머지 OS를 쾌적하게 사용할 수 있고 OS를 돌아가면서 작업을 하더라도 모두 같은 파일 시스템을 이용해서 할 수 있다. 

그런데 실제로 막상해보니 마주해야 하는 문제들이 어마어마하게 많았다. 사실 2주의 대부분의 시간은 그 문제들을 해결하는데 쓰였고 아직도 많은 문제가 남아있다. QEMU를 통해서 돌아가는 VM들은 생각보다 매우 빨라서 사실 거의 이런 방식으로 사용하려는 결심을 굳혀가고 있다. GPU를 passthru하고 audio를 passthru하면 시스템 전체 성능은 10% 정도 손해를 보는 경향이 있긴 하지만 재부팅하지 않고 거의 native 수준에 육박하는 쾌적함으로 소기의 목적을 이룰 수가 있다. 

하나의 파일 시스템에 하나의 OS를 설치하고 그것을 매우 오래 사용하다가 시스템 전체가 엄청나게 느려지고 이것 저것 설치해서 사용하다가 엄청나게 무거워진 시스템을 가지고 씨름할 필요가 없다. Docker에서 container 별로 특화된 일을 최소한의 수준으로 설치해서 사용하듯 할 수 있다. 반대로 native boot을 할 수도 있고 linux 위에서 같은 physical drive를 가상머신으로 사용할 수도 있다. 

GPU passthru가 그 과정 중에 가장 복잡하고 까다롭다. 특히나 Single GPU로 이런 짓을 하는 것은 무모하거니도 하거니와 시간 소모가 엄청나다. 그래서 잘 되냐면 잘 되지도 않는다. 2주 동안 진행해서 Windows와 MacOS를 거의 native 같이 GPU passthru를 통해서 VM으로 올려놓긴 했지만 아직 USB를 passthru하지도 못하고 GPU driver가 가상머신으로 올라간 윈도우즈와 잘 어울려지지 않아서 아직도 문제가 많다. 

