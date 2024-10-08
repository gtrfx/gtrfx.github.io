---
layout: post
image: /assets/images/7e549a9f41f36509314e864b693d3096.png
title: "Solid State Guitar Amplifier (3)"
author: "Keith"
---


FET(field effect transistor)가 왜 tube에 비견되는지에 대해서 먼저 얘기해야할 것 같다. 




FET가 흔한 BJT (bipolar junction transistor)와 다른 것은 control 전극 역할을 하는 base(FET에서는 gate, triode에서는 grid)으로 전류가 흐른다는 것이다. base에 해당하는 고체가 매우 얇게 성질이 같은 두 고체 사이에 붙어있는 것이기에, 단순히 voltage로 두 고체사이를 흐르는 전류를 control해야 함에도 불구하고 전류를 흘리게 되는 성질이 있다.




FET의 경우는 특정 성질의 고체 (n-type or p-type)에 흐르는 전자의 흐름을 다른 불순물을 주입한 부분(JFET) 혹은 규소 산화물 위에 부착한 금속 (MOS FET)의 전자장이 control하는 구성의 반도체라, 진공속에서 흐르는 전자의 흐름을 별도의 전극이 컨트롤하는 triode와 매우 흡사하다. 마찬가지로 control 전극으로 흐르는 전류가 거의 없다. JFET의 경우는 어느 정도 존재하지만, MOS FET의 경우는 그것이 거의 없다. 즉 input impedence가 거의 무한대에 가깝다. 




아래 그림을 보면 n-channel JFET을 나타낸 것인데, 기타와 관련된 장비들에서 흔히 많이 사용하는 FET로 보면 되겠다. p-channel이 아닌 n-channel을 쓰는 이유는 이게 흔히 많이 쓰는 npn BJT와도 비슷하고, 일반적인 triode와도 bias를 걸어주는 방법이나 전류의 흐름이 같기 때문이 아닐까 생각해 본다. 




여기서 늘 가지고 있던 불편 사항 하날 말하자면, '전자의 흐름과 전류의 흐름이 항상 반대다'라고 알고 있어야 하는 것이다. 왜 전자의 흐름이 전류의 흐름이 반대가 되게끔 전류의 흐름을 정의했을까 하는 것이다. 애초에 전류의 흐름이 전자의 흐름과 같게끔 정의했으면 이럴 일이 없었을텐데 하는 생각. 이 바닥에서 살다보면 +와 -의 개념이 누가 +를 달고 누가 -를 달고 있느냐 그 차이일 뿐 의미하는 바는 같다고 보게 된다. 그러나, 그간의 학습 덕택에 선입견상 '+가 좋은 쪽이고 -가 나쁜 쪽이다' 라고 생각하게 되는 것을 막을 수는 없다. 애초에 +를 전자의 농도가 높은 쪽, 전자를 제공하는 쪽에다 두었다면 여러 가지로 좀 편하지 않았을까 하는데. 지금 그렇게 바꾸면 엄청난 혼동을 각오해야겠지?



![image](/assets/images/7e549a9f41f36509314e864b693d3096.png)Junction Filed Effect Transistor







전기적 특성으로 보자면 FET가 triode보다 훨씬 더 우수하다할 수 있다. triode의 음향적 측면으로서의 장점 (even order harmonics가 더 많다는 근거)이자 전기소자로서의 단점인 grid limiting current 현상이 거의 없다고 볼 수 있다. 그 덕택에 여러 개의 증폭단을 개개 증폭단으로 완전히 분리하여 생각할 수 있다. 거의 완벽에 가까운 시뮬레이션/모델링이 가능하다. 더군다나, large signal model 또한 FET의 경우 매우 깔끔하다. 




그런데 딱 하나의 장점이자 단점이 존재한다. 그것은 소자의 반응이 진공관에 비해 매우 빠르다는 것이다. 다시 말해 진공관의 경우 parasitic capacitance에 의해서 증폭률이 높으면 해당 증폭률을 유지할 수 있는 band의 폭이 좁아지는 특징이 있었는데, FET의 경우는 그런 현상이 매우 작다. 더군다나 가청 주파수 영역에서 band가 cut이 될 일은 절대로 없다. 전자들이 매우 좁은 공간을 이동하면서 제어가 이루어지기 때문에 진공관처럼 어떤 기생하는 용량성분에 의하여 흐름이 느려질 개연성이 전혀 없는 것이다. 덕택에 매 증폭단 불어나는 히스잡음을 어떻게든 컨트롤을 해주어야 한다. 일부러 gate-drain사이에 cap을 끼워넣기도 하는 경우가 간간히 보인다. 




좀 더 추가해 보자면, 시장에 돌아다녔던 solid state preamp들을 보면 대부분 JFET으로 만든 것이다. 좀 웃긴 것이 grid에 높은 voltage가 걸렸다고 해서 triode가 사망하거나 하진 않는데, JFET을 심하게 positive bias 걸게 되면 gate를 타고 전류가 흘러서 JFET이 사망한다. 웃긴 것이 positive bias에 대한 모델 수식이 없다. 일반적인 모델에 postivie bias를 걸면 어떤 식으로 계산이 이루어지는지를 포함해서 이제 large signal model에 대해서 다뤄보기로 하자.


