---
title: "Hypervisor는 무엇일까?"
image: https://docs-assets.developer.apple.com/published/f7344dbd5a/e960d911-a9fe-4678-9a10-45f268db1970.png
tags: [hypervisor]
---

Hypervisor에 대한 내용을 찾아보면 대개 계층을 나타내는 그림을 보여주면서 가상머신을 돌릴 수 있게 해주는 것이라고 하면서 뻔히 아는 내용을 분량을 부풀려 이야기하는 내용이 대부분이다. 여기 붙인 그림은 여태 내가 봐왔던 그림 중에 가장 좋은 그림 같아서 붙여봤다. 그냥 한방에 모든 내용을 이해할 수 있게 잘 그려놓은 그림이지 않은가?

소프트웨어적인 흐름을 블록다이어그램/플로우챠트로 아주 잘 그려놓았다. 실제 hypervisor framework도 열어보면 이렇게 생겼다. 

아주 쉽게 말해서 hypervisor라는 것은 일종의 multithread 프로그램인데 다른 CPU의 인스트럭션을 실행할 수 있도록 context switching이 편하게 되어있는 VM 명령어셋을 이용해서 만들어놓은 것이다. 따라서 호스트 OS의 자원을 공유하지 않을 수 없다. 메모리도 공유해야 되고 파일시스템도 공유해야 한다. 말이 공유지 이것은 guest OS가 hypervisor의 도움을 받아 동작하는 하나의 응용프로그램이 되어 호스트 OS에 종속되어 메모리와 파일시스템을 쓰는 것과 같아서 스스로의 설정에 지배받게 되어있다. 

그러니까 일반적인 multi-threading과 다르지 않지만 단지 VM을 위한 CPU의 명령어 셋을 사용하고 있다는 차이만 있다는 것이다. 내가 CPU의 core를 얼마나 할당할 것인가는 내가 해당 VM을 위해서 벌릴 수 있는 thread의 개수를 결정하게 된다. 

pthread를 사용해보면 알겠지만, 이게 무슨 하드웨어처럼 구분이 되서 어떤 thread는 어떤 정해진 thread를 돌리는 하드웨어에 고정되어 돌아가는 게 아니라 그때 그때 남아도는 CPU 자원에 붙어서 돌아가는 거라 10개를 돌린다고 치면 1000%를 쓰게 되진 않는다. 그림에서 보면 실제로 수행되어야 하는 것 + VM을 위한 오버헤드으로 돌아야 하기 때문에 가상머신을 쓰면 native로 돌 때에 비해서 분명히 성능 저하가 생길 수 밖에 없다. 그런데, 시스템의 thread 수가 많고 장시간 사용한다고 보면 overhead에 의한 효과는 미미해지게 되니까 가상머신의 처리능력은 거의 native와 같다고 할 수 있다. 물론, CPU의 종류가 달라서 CPU emulation을 해야 한다고 보면 overhead가 더 커지게 되니 분명히 여기서는 성능의 저하가 생길 수 밖에 없다. 

그러면 VM을 위한 CPU의 명령어 셋은 무엇인가? 하는 질문이 생기게 된다.

생각보다 개수는 많지 않다만, VMX (인텔의 VM 확장 명령어셋)을 보면 인스트럭션의 이름이 VM으로 시작하는데, VM LAUNCH/RESUME/CLEAR (새로운 VM을 시작하기, 중단되었던 작업을 재개하기, VM실행에서 빠져나오기)등으로 되어있다. 목적이 뭐냐면 host OS에서 자신의 남는 처리능력을 활용해서 guest OS의 응용프로그램을 실행하는 것이라 context switching을 위한 별도의 레지스터 파일을 두고 이것을 빠르게 전환시켜주는 것이다.

AMD의 VM 명령어는 조금 더 직관적이라 VMRUN/VMSAVE/VMLOAD/VMMCALL 이런 식으로 되어있다. 이름만 약간씩 다를 뿐 인텔의 명령어와 거의 1:1 대응이 된다. (그렇지 않으면 소프트웨어 개발자의 부담이 늘어나게 되는 바보같은 설계일 수 밖에 없다)

즉 VM모드로 전환하면 이전에 처리하던 guest OS의 응용프로그램의 레지스터 파일을 꺼내서 수행하던 작업을 마저 재개하다가 해당 레지스터들을 모두 저장하고 빠져나와서 호스트 OS의 응용프로그램을 실행하고 또 적당한 시간에 VM의 응용프로그램을 실행시켜주고 하는 식이다. 이걸 만약 소프트웨어적인 방법으로 처리하자고 하면 레지스터 상태를 저장/복원해내기 위해서 수도없이 없는 pop/push를 하느라 성능이 떨어지게 될 수 밖에 없다. 

대표적인 가상머신 응용프로그램인 qemu를 예로 들자면 kernel이 도와주는 모드를 선택하면 엄청나게 빠르게 돌아가는데 그렇지 않은 모드를 선택해서 돌리면 어마어마하게 느린 것을 알 수 있다. kernel이 도와주는 모드라는 게 CPU의 VM instruction을 이용해서 구현한 커널 모듈(리눅스는 KVM/MacOS는 Hypervisor Framework,Windows도 마찬가지)을 불러서 쓰는 것이다. 

이미 정상적으로 잘 동작하는 잘 만들어진 한 벌의 Hypervisor framework이 있다면 CPU에 따라서 VM instruction만 다르게 끌어쓰면 되는 것이니까 KVM이나 윈도우즈의 hypervisor framework처럼 Intel/AMD CPU 모두가 지원되게 할 수 있다. (그런데 애플아 너희들은 왜 안하냐고)