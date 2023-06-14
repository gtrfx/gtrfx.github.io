---
layout: post
image: /assets/images/aa624ce2ad41a80c10593eac916ca62f.gif
title: "Feedback..Frequency response"
author: "Keith"
---

Power amplifier를 간단히 그려보면 feedback forward path와 feedback path를 그려놓은 모양이 된다. Gain을 frequency ($\omega$)의 함수로 나타내면, 즉 * Open loop gain: $A(\omega)$  * Feedback gain: $f(\omega)$ Close loop gain은 다음과 같아진다.$$ G_{closed}= \frac{A(\omega)}{1+A(\omega)f(\omega)} $$출력을 flat하게 그대로 돌려보낸다고 가정하면 사실상 최종 출력은 1에 가까와지고 주파수 특성도 flat한 모양에 가까와진다.그러나, feedback은 출력의 일부만 돌려보내므로 power amplifier의 주파수 특성을 어느 정도 반영하게 되고 (feedback이 작으면 작을 수록 더 크게 반영되고 전체적인 gain도 더 올라가게 됨), presence control이 붙는 경우는 presence로 강조되는 주파수 영역 (중저음 대역)을 제외한 영역이 boost되어 전반적으로 중-고음 영역대가 부각되는 결과를 가져온다.





![image](/assets/images/aa624ce2ad41a80c10593eac916ca62f.gif)



 간단히 위와 같이 그려보면 다음과 같이 된다.$$ G_{closed}= \frac{A(\omega)}{1+A(\omega)\frac{R_i}{R_i+R_f}} $$대략 Marshall amplifier에서는 $R_i, R_f$ 각각 4.7k와 100k ohm 정도 되므로, presence를 고려하지 않으면 feedback gain은 0.045정도가 되고 주파수가 높은 경우 presence가 높을 때는 0.03727, 낮을 때는 0.098정도 된다고 보면, Open loop gain을 20정도로 가정했을 때 (power amplifier 그 자체의 gain은 고정이다), close loop gain은 6.76에서 10.52 정도가 되는 것이다. dB로 따져보면 약 4dB 정도 차이가 나는 것인데, open loop gain대비 6 dB가 낮은 상태에서 presence에 따라 추가로 3dB정도 더 낮아지기도 한단 얘기다. 이 회로에서 빠진 부분이 speaker impedance에 따른 출력의 주파수 왜곡인데, open loop gain을 20으로 볼 때 기본적으로 6dB gain이 feedback loop에 의해서 보완이 되고 나머지는 보완이 되지 않는단 말이다.즉, speaker impedance를 open loop gain에 포함시켜 계산하면 power amplifier에 non-linear distortion이 없다고 가정하면 (절대로 그럴리가 없다), 다음의 식으로 종합되는데,$$ G_{closed}= \frac{A(\omega)}{1+A(\omega)f(\omega)} $$Distortion이 일어난다고 가정할 때는 이 관례를 어찌 이해해야 하는지의 문제가 좀 복잡해진다. 왜냐면 신호의 주파수 성분 별로 gain이 다르고, 찌그러짐이 생기면서 높은 주파수 성분이 생겨나고 또 찌그러짐에 의해서 feedback이 작아지고 또 그에 따라 입력이 늘어나고 하는 문제가 벌어지게 된다. 입력이 커지는 경우에는 출력단에서 찌그러짐이 발생하는 것은 당연한 것이므로, 결과적으로 feedback을 덜하게 되는 것과 마찬가지 결과가 된다. 즉, presence니 depth(혹은 resonance)이런 거 열심히 만들어놓았는데 얘네들의 효과가 미미해지는 것이다. 찌그러짐에 의해서 feedback gain이 줄어드는 결과를 초래하는 것이니까. 그런데 간단한 수식으로는 표현을 못한다. 역시나 non linear state variable 얘기가 나오는 것이다. 피곤하다.

