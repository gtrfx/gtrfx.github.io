---
title: "VG_N_SEGMENTS is too low..."
tags: [valgrind]
layout: post
---

valgrind가 상당히 뛰어난 툴이긴 한데, 너무 느리다는 단점, 그리고 덩치가 큰 애플리케이션을 debug할 때 내부적으로 메모리를 세팅할 때 한계가 있다는 점이 단점이 있다.

VG_N_SEGMENTS가 여기에 해당한다. 복잡한 애플리케이션의 경우 valgrind를 붙여서 돌리면 꽤 오래 돌아가는 이유로 백그라운드로 하루 정도 놔두면 결과가 나오는데, 대개 그 결과가

VG_N_SEGMENTS is too low 되시겠다.

무슨 뜻이냐고? valgrind를 뒤져보면 이 값이 나오는데, 이게 너무 작게 설정되었다는 거다. 대부분 외부에서 빌드해서 가져오는 것들은 웬만한 애플리케이션을 디버그하는 데 어려움이 없는데 꽤나 덩치가 크고 많은 메모리를 할당하는 경우는 예외가 된다. 그래서 이 값을 꽤 크게 잡아주어야만 문제 없이 디버그 할 수 있다. 물론 이걸 돌릴 때 엄청난 메모리를 소모하게 된다. 뭐 어쩔 수 없다. 덩치 큰 프로그램을 address sanitizer 같은 것을 이용해서 문제를 잡아내려고 하면 대개 아무 메시지 없이 그냥 돌아가시는 일이 있다. 디버거를 써도 그냥 돌아가시고. 힌트가 없으니 잡아낼 수도 없고 엄청나게 오랜 시간 돌아야 문제가 발생하는 거라 기다리는 것도 한계가 있는 거다.

나는 이런 상황을 맞이해 본 적이 별로 없다. 대부분 바로바로 문제가 터져주고 어디에서 문제가 생겼는지 바로바로 대개는 valgrind까지 안 가도 address sanitizer 수준에서 다 해결이 된다. 이게 잘 안되면 valgrind도 가보고 valgrind를 source 받아와서 위에 말한 VG_N_SEGMENTS도 바꿔가며 새로 로컬로 빌드해서 돌리기도 하는데, 여기서는 사람의 인내력의 한계에 도달하게 된다.

쉽게 말해서 하루 넘게 돌려서 결과가 나왔나 하고 열어보면 VG_N_SEGMENTS가 너무 작으니 크게 늘린 뒤에 새로 빌드해라 라는 메시지를 받고 시간을 들여 새로 빌드했는데, 그 마저도 모잘라서 이 과정을 여러 번 반복하게 되면 심한 경우는 서너번 반복하게 되어 아무 일도 못하고 꼬박 일주일 이상을 날려버릴 수도 있고, 그나마 답이 나오면 다행이지만 그렇지 못하면 시간만 까먹고 결국 아무 것도 손에 넣지 못하고 말게 되니까.

결국 다른 방법으로 해결책을 찾아야 한다. 원래의 문제는 손도 대지 못한 채로.

그렇게해서 이유를 찾아내면 정말로 사소한 것이라거나 아니면 프로그램의 접근 방법 자체가 너무 많은 메모리의 설정/해제를 반복하다보니 (이를테면 엄청나게 큰 loop에서 push_back을 엄청나게 큰 덩어리로 하고 있다거나 하는) valgrind가 이걸 당해내지 못하는 그런 거다. 대개 이런 경우 본래의 approach를 싹 바꿔서 미리 메모리를 한번에 전부 다 잡아놓고 돌아가게끔 해야 하는데, 그러면 그 주변에 있는 거의 모든 것들을 다 바꿔야 하는 불상사로 가게 되고 그렇게 그렇게 사람은 맛이 가게 되는 거다.

그런데 이게 의외로 상당히 간단한 문제일 수 있다. 그러니까 memory leakage의 문제라기 보단 뭔가 메모리 관리를 잘못해서 메모리 사용률이 눈덩이처럼 불어나서 죽은 것일 수 있는 거다. 그러니까 OS가 내 애플리케이션을 과다한 메모리 사용 때문에 죽인 거라면 그냥 아무 메시지 없이 abnormally terminated 되는 거다. OS에 따라서 early OOM이 된다면 그냥 application 하나 죽이고 끝이 나지만 어떤 경우는 시스템 자원이 완전히 고갈될 때까지 돌다가 마침내는 시스템이 응답하지 않고 좀비처럼 되어있는 수도 있고 리부팅이 걸려버리는 수도 있다.

valgrind까지 가지 말고 instrumentation tool 같은 것을 써서 메모리가 어떻게 불어나고 있는지를 관찰하는 것도 방법이다. 이런 건 valgrind로 못 잡는다.
