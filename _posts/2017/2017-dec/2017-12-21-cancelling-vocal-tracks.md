---
layout: post
title: "완제품 음악에서 주 트랙 지우기"
categories:
    - audio
    - music
author: "Keith"
---

가끔씩 음악이 너무 좋아서 보컬 혹은 기타만을 제거한 뒤에 그 반주음원을 가지고 뭔가 해보고 싶을 때가 있다. 그런데 어떻게 지워야 할지, 지울 수는 있는 것인지 궁금하다. 그래서 잠시 생각해보는 시간을 가져보려 한다.

1. 주 트랙은 어떻게 녹음 되는가?


    대개 솔로를 하거나 음악의 주가 되는 부분 - 이를테면 보컬, 연주 음악이면 독주 악기 - 은 모노일 가능성이 높고 팬으로 볼 때 정 가운데 위치하기 때문에 사실 좌/우측 트랙에 각각 같은 신호가 더 해져있을 가능성이 높다. 가능성이 높다고 하는 것은 스테레오 트랙으로 녹음 되었을 수도 있고 좌우로 음장감을 벌리는 이펙트를 사용해서 좌우가 약간씩 다르게 만들었을 수도 있기 때문이다.

    그러나 대부분 스테레오 reverb를 써서 잔향만 스테레오로 두고 나머지는 양쪽 채널이 같은 소리를 내고 있을 가능성이 매우 높다.

    또 녹음되는 음원에는 다들 제각기의 음역이 존재해서 특정 주파수 영역에만 분포하는 신호일 확률이 높다. 또 영역이 실제로 넓다고 하더라도 다른 악기들과 믹싱이 되어야 하기 때문에 주된 음역을 제외하는 부분은 믹스시에 잘라내 버리게 된다. 음식으로 치면 쓸데없는 잔맛을 없에서 재료들 각각의 맛이 잘 살아나게 만든다고 생각하면 된다. 

2. 어떻게 지워버리는 것인가?


    우리에겐 딱 2개의 채널의 신호만 있고 지워야 할 소리에 대한 정보는 1에서 이야기 한 정도의 어렴풋한 힌트밖에 없기 때문에 완벽하게 지워내는 것은 불가능하다. 다만, 지워내지 않으려는 신호를 크게 부각시키고 지워내려는 것을 최대한 억제해서 그 위에 내가 만든 소리를 덧대는 것은 가능하다.

    모노 채널이 좌우 채널의 정가운데 위치해서 있는 경우는 사실 매우 간단하게 제거가 가능하다. 다만 reverb를 걸어버린 경우 이 잔향은 좌우가 다르기 때문에 지워낼 수가 없다. 

    이를테면 다음과 같이 나타내어 볼 수가 있다. 아주 간단하게. C는 좌우채널의 공통적인 신호인데, 이것은 대개 보컬이라든가 독주악기일 확률이 매우 높다. 물론 그렇지 않고 다른 악기들의 소리를 포함할 수도 있지만 대체적으로 그럴 확률이 높다. 

    * L = A + C
    * R = B + C

    아주 간단히 좌측 채널에서 우측 채널의 소리를 빼버린다거나 그 반대로 하면 공통 성분은 빠져나가고 나머지만 남게 된다.

    그러나 결과가 모노가 되어버리기 때문에 이 방법으로 지워내게 되면 그 결과가 단순해져버리게 된다.

    또 한가지 방법은 C의 음역만 패스하는 EQ를 이용해서 C를 골라낸 뒤에 좌 우측 채널에서 제거해버리는 것이다.

    제거하는 방법은 이를테면 DAW 소프트웨어에서 phase를 180 돌려 버리는 것이다. 더 쉽게 말하면 그냥 -1을 곱해버리는 것이다. 음원이 모두 디지털이고 좌우측이 정확하게 sync가 맞아있기 때문에 이 연산과정은 사실 너무 클리어하고 그렇게 해서 지워내면 100%라고는 못해도 매우 깔끔하게 지워진다.

