---
title: "RPI4 다시 복귀..."
tags: [raspberrypi4]
layout: post
author: "Keith"
---

집안에서 궃은 일을 하는 컴퓨터를 RPI4에서 2700x PC로 바꿨는데 뭔가 너무 벌키하고 열도 많이 나고 해서 결국 다시 RPI4를 쓰기로 했다. 속도도 느리고 해서 답답하다 했었는데 역시 RPI4 만한 게 없는 거다. RPI4는 사실 쿨링만 잘 되면 여느 미니PC에 견줘도 아쉬울 게 사실상 없다.

예전엔 SDcard로 부트해서 USB HDD와 자원을 나눠썼는데 이번엔 그냥 좀 작업을 해서 곧바로 USB boot을 하도록 했더니 생각보다 더 간편하고 가벼워졌다. 그만큼이나 SDcard로 작업하는 게 느린 거다.

한가지 아쉬운 것은 2700x에는 Qemu로 windows를 얹을 수 있지만 여기서는 그러지 못한다는 건데 그래도 뭐 크게 아쉬울 것은 없다.

한가지 팁을 이야기하자면 USB boot으로 해놓고 arch linux arm을 설치하면 처음에 문제가 생기는데 그 원인은 fstab에 boot disk가 SDcard로 잡혀있기 때문이다. 이것은 처음에 수정해주어야 한다. 부팅하기 전에 하든가 부팅하다가 진행이 안되면 maintenance mode로 빠지는데 이때 수정해도 된다.

