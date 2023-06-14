---
title: "Ryzen 헤드리스 리눅스 박스?"
layout: post
tags: [linux, ryzen, headless]
author: "Keith"
---

결론부터 말하면 UEFI BIOS가 GPU가 없다며 동작하지 않는다. 어떻게 사용자에게 알릴 길이 없으니 Beep이 삑! 나온다.

그래서 간신히 4k만 되는 그래픽 카드(그래도 big sur까지 호환되는)를 하나 주문했다. RX580은 값 좋을 때 처분하려고 내놓았다 (신기하게도 100불 할인 받고 구입한 m1 mac mini 투자비용 뽑힌다.)

해킨으로 만들어서 데스크탑으로 쓰던 2700x 머신은 linux를 올려서 VM 전용 머신으로 쓰고 있는데 너무 좋다.

docker container를 아무리 올려도, qemu로 windows를 띄워도 전혀 답답하지 않다. x혹은 rdp로 돌려도 빠릿하고 좋다. 

Ryzen hackin을 하면서 (vmware라든가 parallels는 여기서 못 쓴다) virtual box로 windows를 불렀을 때의 마치 고구마 먹은 느낌과는 확연히 다르다.

AMD 머신은 역시 linux나 windows만을 쓸 때 가장 빠릿하고 좋다.

코인이 미친 듯 오르는 덕택에 (지금은 폭락중이지만) 결과적으론 거의 아무런 출혈 없이 내 홈 오피스의 자원을 확충했다. 