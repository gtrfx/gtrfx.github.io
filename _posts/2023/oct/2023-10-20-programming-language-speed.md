---
title: "프로그래밍 언어의 속도"
tags: [learning]
layout: post
author: "Keith"
---

누군가 pi를 계산하는 알고리즘을 이런 저런 언어들로 구현해놓은 뒤 그 실행속도를 측정했다. 아쉽게도 여기엔 C#의 속도가 매우 느리게 나타났다. 내가 예전에 측정해봤던 바로는 C#도 그다지 나쁘지 않았는데, java와 비등비등한 속도를 보이고 있는 것은 좀 놀랍다.

https://github.com/niklas-heer/speed-comparison

놀랄 것도 없이 python이라든가 java가 아무리 빨리 돌아봐야 최소 2배 이상의 시간이 걸리고 대략적으로 일반적인 python의 속도는 내가 대략적으로 측정해봤을 때와 별 다를 게 없이 300배 이상으로 나쁘다. 

그러니까 뭔가 빠르게 할 것 같으면 (사실 컴퓨터로 하는 일 자체가 뭔가를 빠르게 계산하고 처리하고자 하는 것인데 빠르지 않으면 사실상 아무런 의미가 없다) C/C++이 가장 좋은 언어임이 보여진다. 물론 컴퓨터와 처음 친해진 이들 입장에서는 이게 무슨 기계어처럼 보일지는 몰라도 엄청나게 고차원적인 언어이다. 역사도 오래되고 뛰어난 디버거/디버깅 툴들도 존재하고.

주목해야할 것은 julia/D/Rust가 굉장히 빠르게 나타나고 있다는 것인데, julia/D의 경우는 저변이 넓지 못한 반면 Rust는 제법 쓰는 사람들이 있고 나름의 장점을 가지고 있기 때문에 의미가 있다고 봐야 할 것 같다. 더구나 Rust는 gcc suite로 빌드가 가능하기 때문에 배워두면 의미가 있을 것 같지만 사실 C/C++를 쓸 줄 아는 입장이면 구태여 rust까지 멀리갈 이유가 있을까 싶다. 차세대(?)언어로 각광받는 swift의 속도가 그다지 높지 못한 것도 주목해봐야지 싶은데.