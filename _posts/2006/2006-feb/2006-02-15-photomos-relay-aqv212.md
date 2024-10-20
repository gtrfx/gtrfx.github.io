---
layout: post
title: "PhotoMOS Relay AQV212"
author: "Keith"
---


진공관 프리앰프는 진공관을 동작시키기 위해서는 높은 직류 전압을 필요로 하지만 증폭단에 나타나는 신호는 출력단에 이르기 전까지는 임피던스가 높아서 연결 경로를 길게 할 수록 톤이 깎이고 잡음을 타는 성질이 있다. 초반 증폭단의 신호는 더더욱 중요하다. 되도록이면 연결 경로는 짧게, 연결 경로는 되도록이면 쉴드선으로 연결하고 AC 신호와는 철저히 분리되어있어야 원하지 않는 험을 막을 수 있다.

그런 의미에서 프리앰프 회로의 경로를 스위치로 변경하기 위해서 외부로 선을 길게 뽑다보면 자연히 잡음을 타게 되므로, 일반적으로 LDR (Light Dependent Resistor, CdS)를 써서 제어한다. LDR에 쪼여주는 빛의 양을 조절하면 그 자체가 가변저항의 역할을 하므로, programmable preamp의 일부는 그 성질을 이용하여 ToneStack을 LDR로 만든 것도 있다. 그러나, LDR과 LED를 밀착한 후 빛이 들어가지 않도록 완벽히 밀봉해야 하므로, 대량 생산을 생각한다거나 나와 같이 귀찮은 것을 싫어하는 사람은 좀 다른 방법을 찾게 마련이다. 

이를 위해, 단순히 스위칭만을 위한 LDR과 동일한 기능을 하도록 만든 것이 PhotoMOS Relay이다. 일반적인 MOS FET의 gate가 빛에 의하여 동작한다고 보면 되는데, MOS FET 1개는 단방향의 전류를 control할 수 있으므로, AC 신호의 스위칭을 위해서 2개의 PhotoMOS FET과 2개의 Diode가 연결되어있다고 볼 수 있다. 따라서, 빛이 발생하면 2개의 MOS FET이 모두 ON 상태가 되지만, 전류의 방향에 따라 둘 중 하나의 MOS FET과 Diode로만 전류가 흐르도록 된다.

전류는 대개 1mA이상에서 50mA까지 흘려넣을 수 있는데, 1mA정도면 ON이 된다고 볼 수 있다. (온도가 올라가면 보다 많은 전류를 흘려야 ON이 된다) 이때 전압 강하는 1.2V 정도로 볼 수 있으므로, 이것을 감안하여 저항값을 계산하면 문제없이 스위칭을 할 수 있다.

AQV(6pin)는 1개의 photo switch가 있다고 보면 되고, AQW(8pin)는 2개의 switch가 집적되어있다.


