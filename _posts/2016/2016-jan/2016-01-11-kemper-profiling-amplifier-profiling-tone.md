---
layout: post
image: /assets/images/920dea7c8f79a6ed32d4bbc9241e6a2a.png
title: "Kemper Profiling Amplifier: Profiling tone"
author: "Keith"
---


이번엔 soundcloud에 올라온 test tone을 관찰해서 어떠한 방법으로 profiling을 하고 있는지 알아보려고 한다.




전체 profiling은 약 45초의 test tone을 쏘아보내는 것으로 이루어진다.







<audio src="/assets/images/c1d200a26167f57fcff8c75a4c824f88.mp3" controls preload></audio>





원래의 테스트 톤이 아니라 특정 앰프의 파일링 시에 마이크를 통해 받은 신호이므로, 많이 찌그러진 소리임을 알 수 있다.




시간을 길게 잡는 것은 무엇보다도 noise를 suppress하려는 측면이 있다. 무슨 말이냐면 하이게인 앰프의 경우는 그 자체로 잡음이 매우 심하기 때문에 간섭신호 (열잡음, 전원 잡음, ...)의 영향을 줄이기 위하여 매 패턴 측정한 결과의 평균을 내는 방법을 취할 것이라 본다. 같은 신호도 여러번 측정해서 평균을 내게 되면 고정된 성분은 그대로 남지만 잡음처럼 시간에 따라 변화하는 값은 0에 가깝게 수렴하게 되기 때문이다.






![image](/assets/images/920dea7c8f79a6ed32d4bbc9241e6a2a.png)

입력신호의 진폭은 다음과 같이 그려볼 수 있었다. 크게 4부분으로 쪼개지는데, 첫번째는 중간 음역대의 chirped signal, 두번째는 impulse, 그 다음은 white noise, 세번째는 저음역대의 chirped signal인 것으로 보여진다. 음량의 크기로 볼 때 네번째 부분의 소리가 가장 큰 음량임을 알 수 있다. 

![image](/assets/images/d6d6301278b349289d534c3f7b0f0c1c.png)

첫번째 테스트 톤이다. 그래프는 spectrogram으로 시간에 따른 주파수 스펙트럼의 변화를 나타낸 것이다. 진폭은 색깔로 나타나게 된다. 나중에 파워를 나타내서 보겠지만 생각보다 음의 진폭이 크지 않다. 이 테스트의 목적은 앰프가 어디서 saturate하는지를 확인하기 위함으로 보여진다. 입력 신호는 그림에서 보다시피 chirped signal (주파수가 시간에 따라 변화하는)인데 주파수의 변동폭이 그리 크지 않다. 시간이 갈 수록 진폭을 키우다보니 앰프에서 일어나는 찌그러짐 때문에 하모닉이 점점 더 늘어나고 있음을 알 수 있다. 이 과정을 통해서 profiler는 앰프가 어디에서 신호를 찌그러뜨리지 알 수 있다. harmonic 성분은 어느 주파수 이상으로는 늘어나지 않는데, 그 이유는 스피커 + 마이크의 주파수 응답의 한계가 있기 때문이다. 대략 10kHz 미만의 신호만이 스피커를 통해 나오게 된다.




그림으로만 판단해볼 때 대략 440Hz에서 880Hz (A2-A3)사이의 음으로 보여진다. 그 위에 같은 모양의 선이 그려져있는 것은 모두 다 harmonic이다. 




대략 만들어본 소리인데 실제의 테스트 톤과 거의 유사하다. frequency는 linear sweep하고 있는데, 대략적으로 이것이 중요한 의미를 띄고 있는지는 잘 알 수 없다. 약 7초간 40 여 dB의 진폭을 ramp up하는 것으로 나타나는데, 실제로는 이보다 더 높은 진폭의 신호가 들어가게 되지만, 완전히 찌그러져서 실제 앰프 출력에서는 진폭이 증가하지 않은 것처럼 나타난다. 하나의 패턴이 대략 100ms 정도 되고 있으므로, 매 패턴당 약 0.1 dB씩 출력을 증가시켜 테스트 함을 알 수 있다. 메뉴얼에서 얘기하는 것은 이 톤을 통해서 앰프가 어디서 distortion이 일어나는지를 알아보려고 하는 것이라고 하는데, 실제로 기타 앰프는 어느 한 곳에서 distortion이 일어나는 것이 아니라 찌그러짐이 일어나는 stage가 다양하고 주파수에 따라 다르고 얼마나 찌그러지느냐의 문제도 있기 때문에 이 테스트 톤으로 앰프의 어떠한 성질을 찾아내려고 하는지 잘 생각해봐야 한다.







<audio src="/assets/images/1b24bcce5dbe5d464bd41872033f4bd2.mp3" controls preload></audio>










![image](/assets/images/a849001bb0b3b2af15ffc8b17e0fb5df.png)




두번째는 impulse signal이 입력된다. 아마도 '퍽!'하는 소리가 날 것이다. Impulse 이후의 tail은 시스템의 특성을 그대로 반영한다. Impulse 자체도 찌그러졌을테지만, 찌그러진 위치가 스피커로 가기 바로 직전이라고 보면 이것은 cabinet IR이라고 할 수 있을 것이다. 위 그림에서 보면 impulse 이후에 서서히 감소하는 응답을 볼 수 있는데, 서서히 감소하면서 꼬리가 길게 늘어지고 있는 걸 보면 스피커의 resonance frequency의 영향이 나타나고 있는 것으로 보여진다. 고음과 관련된 response는 impulse이후 초반부에 다 끝나게 된다. 그림의 모양새를 보면 약 10msec 정도의 주기를 갖는 패턴이 나타나는데 이것은 100Hz 근방에 Q가 높은 특성을 가지고 있다고 해석할 수 있을 것이다.




![image](/assets/images/4c0b58060efadf84ee9ade330a147e84.png)

그 다음은 white noise가 입력된다. 귀로 듣기에 완벽하게 white noise로 들리지 않고 키질하는 소리처럼 들리는 것은 위 그래프에서 보는 바와 같이 진폭의 변화가 같은 패턴으로 주기적으로 반복되고 있어서 그렇다. 




white noise의 음량이 비교적 크고 (chirped signal의 음량보다 큼) 그 큰 음량때문에 대부분 찌그러진 신호가 되는데, 앰프 내부에서 EQ에 의하여 여러 가지로 주파수 특성의 변형이 있었을 것이므로, 스피커의 주파수 특성을 제외하더라도 완벽하게 white하다고는 볼 수 없다. 그러나, 그렇다고 가정하는 경우에는 이 신호들을 이용하여 스피커 IR을 측정할 수는 있을 것이다.
![image](/assets/images/202c90ecbd225aba709c7ba74703b498.png)

마지막으로 또 한번의 chirped signal인데, 그림으로는 다소 분간하기 어렵지만 음량이 대음량이고, 그림에서 보다시피 0-400Hz(?)구간에서 swing하고 있는데, 앞서 관찰했던 구간을 되짚어보자면 기타 앰프의 초저음 영역 (스피커의 임피던스+댐핑 관련 부분)을 측정하고자 함이 아니었을까 추측하게 된다. 핵심 주파수 영역은 반드시 80Hz 근방을 포함해야 되는데, 소리를 들어볼 때는 매우 낮은 주파수에서 sweeping이 일어나는 것처럼 들리는데, 찌그러졌기 때문에 정확히 어디서 어디까지 스윙하고 있는지는 잘 들리지 않는다. 





종합하면 다음과 같다.




1) Training하는 tone은 크게 4부분으로 나뉜다. 

- 중간 주파수 영역대를 sweeping하는 signal

- impulse signal: for impulse response measurement: 시스템 전체의 response를 측정

- 전 주파수 영역대를 커버하는 white noise

- 초저음만을 sweeping하는 signal




2) 각각의 tone이 target으로 하는 부분은

- 중간 주파수 영역대의 톤을 통해서 매 0.1 dB 진폭마다의 harmonic의 조합을 계산한다. 

- impulse를 이용하여 speaker IR을 측정한다.

- white noise: ?

- 저음 영역대의 톤을 통해서 초저음의 speaker IR (speaker impedance에 의한 damping factor를 측정하는 듯?)을 refine한다.




기타 앰프의 특성은 사실상 입력 진폭과 주파수에 따른 harmonic이 비율이 어느 정도인가가 가장 중요한 요소가 된다. 그러나 여기서 많은 부분은 앰프 내부 혹은 스피커에서 소멸되고 오직 20-10kHz 대역의 harmonic만 통과하게 된다. 




다음에서는 harmonic의 배합을 측정했을 때 그 측정값을 토대로 어떻게 디지털 영역에서 재현을 할 수 있을지를 생각해보기로 한다. 














