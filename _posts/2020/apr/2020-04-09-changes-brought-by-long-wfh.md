---
title: "장기간의 재택 근무가 가져온 내 삶의 변화"
layout: post
tags: [WFH, WTF]
author: "Keith"
---

이번 주가 지나면 재택 근무를 시작한지 4주가 지나는 셈이 된다. 재택 근무가 시작 되기 직전까지만 해도 이 동네에서 멘토 삼아 만나는 분과 아침에 스타벅스에서 커피를 한잔하면서 이런 저런 이야기도 나눌 수 있었고, 그동안 스타벅스를 드나드는 사람들을 구경할 수도 있었던 것 같은데, 재택 근무 + 집콕 (shelter-in-place)를 하게 된 이후로는 가끔 메시지나 주고 받으며 생사확인 하는 게 전부가 되었다.

눈에 보이지도 않는 작은 것들 때문에 방안에 쳐박혀서 메일로 날아온 주문을 받아서 일 해주고 나머지는 오로지 씻고 먹고 싸는 일에만 전념하게 되는 것이다. 그동안 보지 못했던 영화를 본다거나 하는 일과는 오히려 더 멀어지게 된다. 방안에 쳐박혀 있음으로해서 운동을 전혀 할 수 없게 되니까 이것 저것 별 짓을 다 해보지만, 짐에서 최소 30분 운동하는 것에 비할바가 전혀 되지 못한다. 

퇴근하고 집에 오면 컴퓨터로 하는 일은 주로 취미와 여가생활이었는데, 이젠 홈피씨가 사실상의 workhorse가 되는 상황이 되고 보니 멀티미디어를 주로하는 MacOS에서 Linux로 그 중심이 옮겨가게 되었다. 일을 하면서도 어떻게 하면 리눅스로 일을 잘하게 만들 수 있는가를 생각하게 된다.

그러는 동안 Linux의 좋은 점들을 더 많이 알게 되다보니 MacOS를 밀어버리고 Linux위에 Virtual OS로 올려버릴 생각마저 하고 있다.  그러니까 Linux를 주로 하고 윈도우즈와 MacOS를 가상 OS로 올려서 일을 하면 된다는 것이다. 그래픽 속도가 떨어지는 가상 머신의 문제는 그냥 PCI passthru를 하면 된다. 즉, 가상 OS에게 GPU를 그냥 맡겨버리는 것이다. Linux와는 연락할 방법이 많다. x로 하든가 ssh로 하든가.

물론 GPU가 2개 있으면 아예 하나를 그냥 내줘버리고 나머지는 Linux에게 주면 되지만, 이게 좀 뭐한 것이 어차피 주가 되어 사용되지도 않는 OS에게 미안하니 디스플레이를 하나 내줘봤자 쳐다보지도 않게 될 게 뻔하기 때문이다.

그러니까 1개의 GPU를 가지고 guest OS에게 passthtru로 내주고 그 동안에 host OS인 Linux는 필요에 따라 ssh로 불러지고 하는 것일 뿐이다.

그런데! 이게 가장 효율적이고 빠른 솔루션이다. 왜?

MacOS나 윈도우즈에서 docker를 불러 쓰면 파일 시스템이 달라서 느리다. 물론 가상 OS로 올린 MacOS나 윈도우즈도 native한 filesystem보단 느리지만 어차피 주가 되어일하는 놈은 Linux 이니까 그러하고 Ext4는 정말 빠르다. 다른 파일 시스템들에 비해서.

일단 이렇게 한 두달 지내볼 생각이다. 나쁘면 누가 뭐라 하기전에 알아서 바꾸게 될테니까. 