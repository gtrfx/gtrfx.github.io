---
title: "Guitar Synth"
tags: [guitar synth]
layout: post
author: "Keith"
---

요즘에는 이 악기를 사용하는 사람을 보기 드문 편이긴 한데, 과거에 Pat Metheny가 애용하던 Guitar Synth라는 악기가 있다. 

이개 도대체 무슨 악기냐 하면 기타인데 신디 사이저의 소리가 나는 악기라고 할 수 있다. Roland에서 상품화했고 당시에는 midi pickup(??)과 guitar synth라는 별도의 모듈로 구성되는 장치였다. 즉, 기타에 픽업을 장착하고 거기서 나온 출력을 별도의 외장 모듈에서 받아서 소리로 바꿔 주는 그런 기능을 했다.

더 파고 들어가보면,

기타 사운드 증폭 --> Saturate --> square wave --> waveform shapping --> filter(EQ)

뭐 이런 식의 구성이다. 그러니까 기타 본체에 붙이는 픽업은 일종의 piezo pickup 장치이고 무슨 이유에서인지는 모르겠지만 roland는 각 string마다 각각의 출력을 내보내도록 먼들었다. 그래서 컨넥터를 보면 원형의 din type 모양새를 하고 있다. 대충 6개의 signal pin과 ground pin 한개로 구성되었지 싶은데 한꺼번에 받아도 되는 소리를 왜 이렇게 나누어서 받게 한 것인지는 알 수가 없다.

그 모양새가 흡사 midi connnector와 유사하여 픽업에서 곧장 midi로 변환되는 것이 아닐까 하는 생각을 할 수 있는데, 그 제품이 발매될 시절에 그렇게 좋은 기술이 나왔을리 만무하다. 그냥 아날로그 시그널이 흘러나올 뿐이다. 그것도 piezon 센서 답게 high impedance 출력으로 말이다. 

원리는 매우 간단해서 기타 출력을 digital 영역에서 다루기 쉬운 square wave로 만들고 그 파형을 원하는 다른 파형으로 바꾸는 과정만이 필요하다. 톱니파를 쓴다거나 아니면 임의의 wave pattern을 만들어넣거나 하는 일들을 포함한다. 최종적으로 LPF를 걸어놓을 떄 filter opening이라거나 filter의 Q를 조정하는 식으로 음색을 조정할 수도 있고 envelope control도 할 수 있게 하면 사실상 midi signal이 아닐 뿐 synthesized signal이라고 할 수 있다. 밴딩이나 dive도 가능하고 비브라토도 가능하다.

만일 이 신호를 midi signal로 바꾼다고 하면 