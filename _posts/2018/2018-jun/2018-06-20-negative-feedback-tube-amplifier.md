---
title: "진공관 앰프에서 파워 앰프 NFB와 Presence"
tags: [tube, amplifier, feedback, presence, audio]
categories:
    - electronics
    - tube
    - gear
    - music
---

예전에도 이와 같은 주제로 골똘히 생각했던 것 같은데, 아무래도 전자회로, 그것도 매우 단순한 진공관 회로를 너무 어렵게 생각했던 것 같다. 사실 그 회로 때문이라기 보단 이것 저것 얽혀들어가면 사실 눈에 보이는 R/C 값만으로 실제 출력을 예상할 수 없으니까 (차이가 있으니까) 그랬던 것 같다. 무엇보다도 그러한 원인을 제공하는 것은 출력 트랜스와 스피커 때문인데, 그 둘을 이상적인 것이라고 가정하고 보면 문제는 간단해진다.

1) NFB를 안하면 출력이 커진다.

NFB를 안하면 당연히 출력이 negative하게 바뀌어 입력단에 영향을 주는 성분이 사라지니까 출력이 증가하게 된다. 그런데, 이때 단순히 출력만 증가하느냐? 에 대해서 생각해 볼 것이 있다. 

즉, negative feedback이 사라지면

- 출력이 증가하면서 saturation이 더 심해진다. 찌그러짐이 더 심해진다는 이야기다.
- negative feedback이 사라지면 일반적으로 저음과 고음이 빠지면서 중간 음역대만 더 강조된다고 한다.

첫번째는 쉽게 이해할 수 있는데 두번째는 왜 그런지 생각해보자.

일반적인 기타 스피커는 특유의 공진주파수 (대략 80Hz 안팎)에서 높은 임피던스를 갖고 또 1kHz 이상이 되면 임피던스가 주파수에 따라 증가하는 경향을 보이는데, 이것만큼 negative feedback이 온다고 볼 수 있다. 

즉, flat한 입력이 주어진다고 하더라도 스피커에서는 80Hz 부근의 저음역대와 고음역대의 임피던스가 크기 때문에 이쪽으로 많은 전압이 걸리게 되고, 그것이 - 방향으로 feedback되므로 입력에서 그 정도만큼 덜 증폭하라고 하게 된다. 이것을 가지고 저음과 고음이 줄어들게 되는 것이다라고 볼 수는 없다. 이러한 피드백 방법이 생긴 것은 스피커를 feedback에 의해서 강제로 제어하지 않으면 저음에서 벌벌 거리는 문제가 있기 때문이기도 하고, 기타 스피커의 경우에는 10kHz 이후의 음은 거의 소리가 나지 않아서 아무리 임피던스가 높아진다 하더라도 아무런 의미가 없다. 사실 NFB를 하게 되면 이쪽으로 불필요한 에너지를 내보내지 않으니 출력을 더 효과적으로 이용할 수 있게 된다고 볼 수 있다.

피드백을 걷어내면 출력이 증가하는 것도 하는 것이지만 예전보다 낮은 지점에서 power amplifier (실제로는 phase splitter)에서 디스토션이 걸리게 되므로 살벌한 소리가 나게 만들 수 있을텐데 그래서 mesa boogie의 amplifier가 feedback resistor를 건드려서 그런 일을 했고 peavy의 5150은 feedback network를 더 건드려서 contour라는 것을 컨트롤 했다.

2) Presence control

이 Feedback network에 간단히 RC filter를 추가하면 (대개 고음이 빠져나가는 filter) presence를 컨트롤 할 수 있게 할 수 있는데, 그냥 단순히 RC filter의 cut off frequency를 대략적으로 보고 1차 high pass filter로 생각하면 그것을 대략적으로 모델할 수 있다고 본다. 즉 feedback resistor는 feedback의 정도, 즉 gain이 빠져나가는 정도, 입력단의 입력이 줄어드는 정도를 결정한다고 보면 presence control에 의한 것은 high pass filter에 의해서 통과되는 성분만큼 입력에서 사라진다고 간단히 모델하면 된다. 사실 그만큼 중요성은 높지 않다.

3) Amplifier simulation

Feedback loop를 제대로 모델하기 쉽지 않다. 이 부분을 엄청나게 정확하게 하겠다고 하는 것 보단 대략적으로 하는 것도 그다지 차이가 없다. 출력단을 이상적으로 보면 모든 대역의 출력이 스피커로 그대로 빠져나가는 것이라고 볼 수 있는데, 여기에 가상적으로 feedback을 고려하면 입력단의 입력이 줄어들어서 출력단 distortion이 더 늦게 걸리는 정도로만 만들어주면 다행이라고 보고 presence 혹은 contour가 고려되는 feedback network도 마찬가지로 in-filter(in)의 구조로 풀어내면 될 듯 하다.