---
title: "Valvetronix - Valve Reactor..?"
---
# Valvetronix - Valve Reactor..?

영국의 Vox사가 일본 Korg사에 넘어간 뒤에 나온 제품들은 Valvetronix라고 하는 기술을 채용하여 제작되고 있다. 명기로 불리우는 AC15니 AC30같은 풀진공관 앰프만 생산해서는 지금과 같은 경쟁체제 속에서 살아남기 어렵다보니 결국 Korg에 넘어갔으리라 추측된다.

Vox는 이미 80년대에 영국의 최대 기타 앰프 생산업체인 Marshall에게 넘어갔다가 마침내 90년초에 Korg에 인수되었다. Korg가 Vox를 인수하면서 옛날 방식 그대로의 AC15, AC30를 부활시키는 한편 생산기지를 중국으로 이전하여 저가에 대량생산을 가능하게 했을 뿐만 아니라, Valvetronix라는 기술을 적용하여 값비싼 진공관 부품을 쓰지 않은 고품질(?)의 앰프와 이펙터를 대량 생산하여 현재까지 맥을 잇고 있다.

Valvetronix에 관련한 특허는 Korg에서 가지고 있는데, 특허 내용을 읽어보면 전혀 Vox스럽지 않은 Korg스러운 특허 - 다시말해 DSP와 TR/opamp를 활용한 꼼수 덩어리 - 임을 알 수 있다. 물론 특허를 쓴 사람들도 모두 일본인들이다. 어찌되었건 이 기술을 채용해서 Vox의 최신 앰프들은 DSP를 이용한 프리앰프(앰프시뮬+EFX)에 TR 출력단을 가지고 있고, Valve reactor라는 부분에만 12AX7을 채용하고 있다. 생산 단가는 낮추면서도 제품가치는 도리어 상승하는 (반면에 authenticity는 떨어지는, 하지만 대중에게는 이게 오히려 먹혀들어가는) 결과를 가져와 매출 신장에는 크게 도움이 되었으리라. (아마도 AC15와 AC30를 설계하고 제작했던 엔지니어들은 하나도 남아있지 않으리라)

뿐만 아니라 Vox사는 Tonelab이라는 멀티이펙트에 같은 기술을 적용하고 Vox의 이름빨을 살린 Wah pedal을 장착하여 Vox 창립이래의 공전의 히트를 기록했다.

Line6의 제품과 같이 모든 이펙트를 DSP에 전적으로 의존하지 않고, 아날로그적인 특성 (Valve reactor)를 이용한다는 것에 경쟁포인트를 두고 있는데, 이것도 막상 뚜껑을 열어보면 역시 현대적인 상술에 불과함을 알 수 있다. 이것이 Line6와 비교해서 압도적인 기술의 우위를 보였다면 오늘날 잘 나가는 line6는 아마 없었으리라.

다시 말하자면 Vox의 Valvetronix라는 것은 Korg의 앰프 시뮬 DSP 기술 + Valve reactor + Vox의 아날로그 도메인에서 쌓은 이미지가 결합된 것이라고 볼 수 있다. Korg에 Toneworks라는 이미지로는 아날로그를 고집하는 고객들에게 어필하는데 한계가 있다고 생각했기 때문이리라..

아래의 도면은 Valvetronix라 불리우는 기술의 경쟁력 포인트로서 쉽게 말하자면 다양한 세팅의 파워앰프를 흉내내는 회로부를 나타낸 것이다.
![image](/assets/images/f7c5c6a4a07457629db4ec1696eb23cb.jpg)Valve Reactor 관련 특허의 도면


그림을 보면 10번에 해당하는 블록이 phase splitter에 해당하고, 12번 블록이 power amp에 해당하는 부분 되겠다. 13번 블록은 피드백 네트웍으로서 일반적으로 앰프의 presence, 저/고음 특성등을 결정하는 부분이 된다.

기술적인 면을 대충 요약하면, 기타 앰프의 출력단이 class A 혹은 class AB로 꾸며지고, 앰프들 마다의 feedback loop gain이 다르다는 점에 착안하여 각각의 특성을 하나의 회로로 모두 반영하겠다는 것이다.

특허내용을 보면 '39번 스위치와 35번 TR을 off/on 시키는 것으로 class A/class AB 전환을 할 수 있다'고 하는데, 특허에 설명된 내용만으로는 다소 이해가 쉽지 않다. (아마도 16번의 덧셈기가 회로상에서는 wire가 연결된 지점으로 표현되어 39번 스위치가 turn on되면 해당 지점이 ground되어 33번 triode가 동작하게 되지 않게 되니, 34번 triode가 class A로 동작한다는 의미로 파악해야 옳을 것으로 보인다, 하지만 이것도 2개의 triode중 하나의 input이 ground가 되면 self splitting 회로처럼되어 push pull로 동작하게 되니 이것도 다소 애매한 측면은 있다).

출력트랜스의 다음에는 virtual power circuit이 달라붙게 되는데, 이 회로는 36번 트랜스의 2차측의 전압과 전류를 증폭하여 tube회로에서 바라보는 load impedance와 virtual power circuit이 바라보는 load impedance를 같게 만들어준다고 한다. 아마도 이 이야기는 2개의 triode로는 transformer가 있다고 하더라도 사실상 impedance가 낮은 reactive load를 제대로 drive할 수 없으므로 별도의 전압/전류증폭을 통해서 마치 2개의 triode가 load를 drive하고 있는 것처럼 만들겠다는 의미로 해석된다. 결론은 12ax7 triode 두 개로 speaker를 drive하는 것과 같은 상태로 만들겠단 얘기다.

모든 것을 종합해 볼 때 나의 리뷰의견은 다음과 같다.

1) Vox의 Valvetronix 기술은 Vox의 아날로그 기술이 디지털 기술과 만나 이루어진 쾌거라고 하는데, 막상 뚜껑을 열어보니 Korg의 DSP 기술 (앰프모델링, EFX)과 12ax7를 사용한 일종의 fake가 결합된, 무늬만 Vox인 또 다른 Korg의 기술이다.

2) 12ax7을 집어넣은 Valve Reactor 기술은 최종단의 찌그러짐을 진공관으로 얻고 feedback loop의 EQ 특성을 반영하는 것 외에 주목적인 power amplifier의 특성을 제대로 흉내내자는 것에는 다소 미달하는 것으로 보여진다. 다시 말하자면 모든 소리는 digital로 만들어놓고, 마지막에 살짜쿵 진공관과 아날로그 필터의 맛을 입힌 거라고 해석하면 될까?

3) 출력관이 일반적으로 쓰이는 pentode가 아닌 triode인데다, 출력관에 따른 특성을 제대로 반영하기 어렵다는 사실을 알면서도 제품 선전에서는 EL84, EL34, 6L6GC, 6V6의 특성을 모두 반영하는 것처럼 씌여있고, 필요성이 의심되는 (어차피 다음단에 별도의 TR 증폭단이 더 들어가는데) 트랜스포머로 파워앰프의 다이내믹함을 살렸다는 선전 문구들로부터 Vox도 AC 씨리즈 말곤 건질게 없다는 결론을 내리게 만든다.

관련 특허 첨부로 붙임

[ Electric_instrument_amplifier.pdf](http://tonebrew.tistory.com/attachment/cfile27.uf@276D163458710AE91B1504.pdf)





