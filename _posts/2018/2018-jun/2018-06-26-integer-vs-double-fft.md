---
layout: post
title: "Integer vs. Double FFT 중 누가 빠를까?"
categories:
    - computer
---

호기심이 발동해서 integer number (fixed point)로 연산하면 floating point보다 얼마나 빠를까 테스트 해봤다.

오늘의 실험으로는 double이 integer 16 bit보다 빠른 것으로 나타났다. 

왜? 16bit에 꽉채우기 위해서 부가적인 작업이 더 들어갔기 때문으로 보여진다.

애초에 floating point로 되어있는 것을 integer로 바꿔서 한다면 type conversion에 많은 사이클이 필요하게 된다. 기왕에 그럴 거라면 정수 연산이 아무리 빠르다고 하더라도 낭비임에 분명하다. 그냥 편하게 살자가 답으로 나올 것 같다. 

부가적인 작업을 지우고 나면 약간 빨라지지만 일반적으로 생각하는 dramatic한 속도 향상은 아닌 것으로 보인다. 대략 10-20% 사이의 성능 향상이 있긴 한데, 64 bit 연산을 하든 32 bit 연산을 하든 속도 차이가 별로 없었다. 

이미 전술한 바와 같이 일부러 integer로 잘하려고 애쓰지 말고 그냥 float도 아닌 double을 쓰는 것이 성능 면이나 관리면에 있어서 훨씬 유리함을 확인했다.

Compiler에서 O3로 최적화했지만 code 상에서의 최적화는 피했다. 컴파일러의 능력을 과소평가하지 않는다는 차원에서. 

정리하면,
- real number를 처리하는 과정에서 integer로 바꿔서 수행하더라도 별 다른 이득이 없다. 
- 단, 정수 연산을 위해서 아무런 부가적인 작업 (overflow 방지/scaling/rounding 등등)을 하지 않는다는 가정에서 double 대비 10% 정도의 이득은 있다.
- 16/32/64 bit integer 연산에 대해서 수행시간 차이는 발견하기 어려웠다. 
- 정수처리를 해야한다면 64bit으로 하면서 부가적인 작업들을 최소화하는 것이 가장 스마트한 선택이라고 보이고, 그렇지 않다면 그냥 double로 처리하는 것이 속도/정확도 면에서 가장 바람직하다.
