---
title: "Hi-Fi 앰프? DAC?..."
tags: [life]
author: "Keith"
layout: post
---

무슨 일인지 유튜브에서 이런 저런 오디오 기기 관련 동영상이 뜬다. 열어보면 대략 수백 에서 수천 달러 하는 DAC + pre/power amplifier 가 나오고 있다.

가격대가 낮은 것은 출력단이 class D로 되어있고 좀 비싼 것은 TR로 된 class AB 인 듯 하다. 신기하게 진공관 출력단인 것은 없다.

대개 광고의 내용을 보면 DAC가 특정 제조사의 특정 모델이란 점을 부각한다거나 OP amp가 특정 제품이라고 한다거나 또는 출력단을 누군가가 설계했다고 한다거나 하는 것이다.

내가 아는 지식을 바탕으로 나눠서 생각해보면 이렇다.

### DAC

DAC의 성능이 좋다 나쁘다라고 하는 것은 출력신호의 신호대 잡음비를 분석해서 보면 된다. DAC가 잘 못하는 것은 원하는 전압 값이 아닌 다른 전압값, 그러니까 오차가 있는 전압을 내보낼 때를 말한다. DAC 자체는 내부에 증폭기가 들어있을 수는 있겠지만 순수하게 바라보면 출력의 디지털 값이 그대로 전압으로 나타나는가 아닌가가 중요하고 그 값에 문제가 있다면 그것은 오로지 잡음으로 뭉뚱그려 표현/측정할 수 있기 때문에 그러하다. 대개 sine wave를 출력해놓고 FFT를 해서 power spectral density를 관찰한다. 찌그러짐이 있다면 harmonic 성분들이 나타나고 잡음이 있다면 impulse에 가까운 signal 성분 아래로 깔리는 잡음 성분의 증가로 나타난다. 물론 오차가 white하게 나타난다고 할 때. 그렇지 않으면 colored noise의 spectrum으로 나타날 수 있지만 전 전압 영역을 스윙하는데 그 출력 전압의 오차가 colored가 되긴 어렵지 싶다. 

대개 아무리 DAC가 안 좋다고 하더라도 잡음이 증가할 뿐이지 신호의 해상도?/명료도? 등등이 두드러지게 떨어지진 않는다. 이를테면 16bit DAC를 가정할 때 가장 높은 진폭 (32767 * unit step)대비 0.5 * unit step의 에러가 있다고 가정하더라도 이 때의 신호대 잡음비는 96 dB 나 된다. 이게 좀 많이 안좋아서 성능이 떨어진다고 한들 80-90 dB 정도나 된다. 사람 귀로 이 차이가 분간이 가능하냐? 라고 하면 둘을 같이 가져다놓고 대음량에서 비교시키면 모를까 쉽지 않다. 

### class D amplifier

class D amplifier는 그 class D operation이 어떤 주파수로 이뤄지느냐 low pass filter는 어떻게 설계되었느냐 등등에 따라서 성능을 이야기할 수 있긴 하지만, 증폭 원리 자체에 비선형성이란 게 존재하지 않게끔 되어있는 것이라 그렇지 않은 class AB와 음질 자체를 비교할 수가 없다. 월등히 class D가 뛰어날 수 밖에 없고 전력효율, 발열 문제, 가성비 등등을 따져도 더 이상 게임이 되질 않는다. class D amplifier가 보편화 된 이후로는 기존의 오디오 세계는 망했다고 생각한다. 그리고 실제로도 그렇다. 

이를테면 시청자의 귀 부근에서 취득한 신호가 본래 보내려고 했던 신호 대비 차이가 있다면 이것을 이를테면 feedback loop를 만들어 보상하는 식의 오디오 시스템은 구성할 수 있을지언정 부품레벨, 회로 설계레벨에서 뭔가 엄청난 뭔가를 만들어낸다? 이것은 있을 수도 없고 있다고 하면 사기라고 밖엔 보여지지 않는다. 

### Op amplifier

아무리 저렴한 audio 용 OP amp라고 하더라도 충분히 성능이 훌륭하다. 아날로그 IC 제작 업체도 바보가 아닌 이상 성능이 떨어지는 물건을 계속해서 찍어다가 팔 일도 없고 opamp가 하는 일이 엄청난 고난이도의 기술을 요구하는 것도 아니다. 오디오 신호는 지금 인류가 다루고 있는 다른 신호들에 비하면 지극히 저주파에 단순하기 짝이 없는 신호가 되었다. 

글쎄. 내가 생각하기에는 mac mini한대에 1-20불짜리 class D amplifier 한대면 뭐 못 할 게 없다고 본다. 영화를 엄청 대음량으로 보고 싶다면 채널당 50W 출력이 모자르다 할 수 있겠지만 그게 100W가 된다고 한 들 고작 3 dB인데. 이런 사람에겐 훨씬 더 고출력의 앰프가 필요하겠지만, 솔직히 이 정도의 음량이 되면 아파트가 아닌 일반 단독 주택이라도 밖에서도 다 들을 수 있을 정도의 큰 음량이라 민폐 수준이 된다. 나는 채널당 50W 정도면 가정용 오디오 출력으로 충분하다고 생각한다. 