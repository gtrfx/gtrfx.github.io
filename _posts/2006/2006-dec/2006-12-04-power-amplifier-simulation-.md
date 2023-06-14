---
layout: post
title: "Power Amplifier Simulation..."
author: "Keith"
---

Duncan Amp에서 제공한 50W Transformer Model을 이용해서 Dual Rectifier 50W Power Amplifer를 PSPICE로 Simulation해보았다..

결과를 대충 정리하면..

- Modern Mode (feedback을 하지 않음)일 경우 대부분 매우 평탄한 출력을 얻고, 10kHz 이후의 대역이 크게 강조되는 결과를 얻는다.
- Feedback이 있는 Vintage Mode 또는 Clean Mode에서는 저음역이 크게 강조되는 결과를 얻게 된다.

다소 이해하기 힘든 결과이다..

오히려 Vintage Mode에서는 저음이 많이 빠지고 Moder Mode에서 저음이 크게 올라오는 인상을 받았는데, 시뮬레이션 결과는 정 반대로 얻어진다. 여기에 스피커의 특성곡선을 한꺼번에 적용하면 저음역이 크게 빠지는 출력을 얻게 된다.

왜 그럴까??

Modern Mode에서는 feedback을 하지 않기에 gain이 feedback을 하는 mode에 비해서 더 높다. 결국, power amplifier distortion이 더 일어나기 쉬운 조건이 성립된다. 저음이 좀 빠지게 되더라도 이것은 기타 스피커가 재생하기 어려운 영역이므로 큰 차이는 없을 것으로 보여지고 고음역이 살아나면서 harmonic이 더 풍부한 소리가 될 것이다. Feedback이 많아지게 되면 그만큼 power amplifier의 gain이 줄어들게 되어 power amplifier distortion이 일어날 확률 또한 줄어들게 된다. 따라서, 클린 톤이나 크런치 톤에 적합하게 된다. 따라서, Modern Mode는 과거의 앰프에서 피킹을 크게 하거나 부스터를 써서 할 수 있는 일을 앰프에서 대신 해주게 된다는 얘기다. 물론 이미 프리앰프에서도 엄청나게 찌그러진 신호를 받아서 파워앰프에서도 엄청나게 찌그러뜨리기 때문에 피킹의 강약에 대한 sensitivity는 오히려 낮아진다.


