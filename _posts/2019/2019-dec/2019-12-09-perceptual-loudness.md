---
title: "몇 가지 음향 신호에 대한 용어와 상식 정리"
tags: [AR model, Yule Walker, perceptual loudness, equal-loudness curve]
layout: post
author: "Keith"
---

주변 지인이 '이런 물건 하나 있으면 좋겠다' 한 것에 대해서 여러 날 생각하다보니 떠오른 것들이 있어서 좀 찾아보니 '추억의' 용어들이 마구 튀어나왔다. 당시엔 별로 관심없던 것들이라 대놓고 수업시간에 배웠지만 그 의미가 뭔지 생각조차 해보지 않았던 것인데, 생각해보니 나도 그렇게 그렇게 원리보단 용어 암기에 보다 더 빨랐구나 싶다. 

몇 가지 정리해보자.

- Moving Average (MA) model

이것은 입력의 어떤 평균값이 출력으로 나타난다고 보는 것이다. 평균은 말이 평균이지 각각의 입력 time series에 곱해지는 값이 모두 같지 않으므로 FIR filter라고 보면된다. random signal이 FIR filter를 타고 들어오는 그런 형태의 현상을 모델링한다 하면 그게 MA model인 것이다. 그냥 딱봐도 행렬로 모델링하기도 쉽고 해 (=weight)를 계산해내기도 상대적으로 쉬워보이는 느낌이 든다. 

- Autoregressive (AR) model

스스로 뒤돌아가는 (그러니까 자기 자신의 출력이 되물려 둘어가는) 그런 모델이다. 이름에서 IIR filter의 냄새를 진하게 풍기고 있음을 알 수 있다. z domain이나 omega domain으로 수식을 꾸미면 전달함수가 분자가 상수인 분수식으로 꾸려지는 그런 모델이다. 현재 입력은 그냥 현재에 영향을 미칠 뿐, 출력의 과거값이 현재 출력에 영향을 미치고 있다. 그러니까 FIR filter가 뒤집어진 꼴, IIR filter이다.

- ARMA model

전달함수의 z transform 을 보면 분자와 분모에 전부 수식이 들어차있는 꼴이다. 현재 입력 과거 입력도 어떤 명확한 관계로 영향을 미치고 과거 출력도 영향을 미치고 있는 그런 모델이다. 이쯤 되면 좀 복잡해진다.

- Equal-loudness-curve

사람의 청력이 모든 주파수에 대해서 골고루 좋은 게 아니라 저음 혹은 고음으로 갈 수록 민감도가 낮아지고 1kHz에서 대략 10kHz 이내의 영역에 민감하기 때문에 실제로 어떤 사운드의 음압이 모든 주파수에 대해서 골고루 같다고 하더라도 사람은 그것을 '같다'라고 느끼지 않는다. 즉 100Hz에서 10 dB의 음압의 소리와 2kHz에서 10 dB 음압의 소리 중에서 후자가 훨씬 더 크게 들린다는 말이 되겠다. 그래서 주파수에 따라 사람들이 같은 크기의 음량으로 듣는 정도를 나타낸 것이 equal-loudness-curve이다. 

이러한 특성은 이미 mp3 codec에도 반영되어있을 정도로 이젠 상식화되어있다. 만일 사람에게 적용시키는 loudness (소리의 큰 정도)를 디지털 영역에서 측정하려 한다면 이 커브를 이용하는 것이 맞다. 그런데 물론 여기에는 또 하나의 가정이 붙게 된다. 이 전기신호를 소리로 바꿔주는 스피커가 충실하게 flat한 특성을 갖고 있어야 된다. 그러나 실제의 스피커는 저음/고음 전달에 상대적으로 부실하기 때문에 이 equal-loudness curve는 좌우측으로 더 위로 올려줘야 한다고 볼 수도 있다.

