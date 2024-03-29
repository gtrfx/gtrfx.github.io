---
layout: post
title: "C/C++에서 복소수 빠르게 쓰기"
tags: [complex, gcc]
image: https://www.google.com/url?sa=i&url=https%3A%2F%2Fspiderlabweb.com%2Fcpp-program-add-two-complex-numbers-classes%2Fcomplex-number%2F&psig=AOvVaw2nRZzdG1a4tzF7p9HWC_zS&ust=1573613234514000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJj5g6TU4-UCFQAAAAAdAAAAABAD
author: "Keith"
---

복소수는 사실 자연계에서는 일반인의 자연수와 같은 것이라 그냥 모든 수는 복소수로구나 알고 살게 된다. 컴퓨터 능력이 점점 더 좋아지다보니 64bit integer도 사실 밥먹듯 사용하게 된다. 

내가 정말 늙은 사람이구나 싶은 게 초중학교 다니면서 하던 프로그래밍에서는 8bit 정도의 정수 혹은 자연수를 많이 썼고 컴파일러에서 int라고 하면 16bit integer였던 기억이다. 그게 갑자기 32bit이 되었고 이제 곧 64bit이 되겠지 하고 있다. 좀 웃긴 것은 128bit integer는 암암리에 지원을 하고 있지만 완벽하진 못하다. 

복소수 연산은 옛날 사람들 같은 경우에는 complex 연산이 C/C++에 기본 제공되는 게 아니라 custom type으로 operator를 따로 두고 struct로 정의해서 쓰거나 아니면 class를 별도로 만들거나 했다. STL에서 complex를 지원하는 C++ 세계에서는 일부러 그런 일을 할 필요가 없는데, 대신 속도가 느려진다는 단점이 있다. 

그 이유는 멀쩡한 범위가 아닌 수 (이를테면 NaN)에 대해서 매 연산과정에서 handling을 해줘야 하기 때문에 그러하다. 대개의 산술 연산이란 게 어쩌다 한 두 번 하고 마는 게 아니라 수천만 수억번 이상하게 되기 때문에 낱개의 연산으로 살짝 느렸다 하더라도 그게 회수가 늘게 되면 어마어마한 차이가 나게 된다.

그럼에도 GCC 8에 와서는 비약적으로 빨라져서 사실 GCC 8만 되더라도 다른 컴파일러 안 부러운 지경이라 할 정도로 엄청나게 빠르다. GCC 8을 쓸 수 있는 조건이라면 STL에 있는 complex를 쓰더라도 custom class에 비해 별로 성능차이가 없으니까 맘놓고 쓰기 바란다. 

만일 그게 아니라면 다음의 컴파일러 옵션들을 생각해볼 수 있다 (Visual Studio는 예외다 그냥 custom class쓰든가 느린 속도를 감수하자). 일반적인 -O3, -Os 말고도 다음의 옵션이 있다. 

-ffast-math
-fcx-limited-range

사실 STL을 쓰는 게 많이 편하다. 그냥 STL을 쓰되 위 옵션을 달아주면 생각보다 많이 빨라진다. 물론 GCC 8만큼만은 못하다. 