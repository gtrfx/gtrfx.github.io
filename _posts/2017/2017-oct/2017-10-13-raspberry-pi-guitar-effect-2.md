---
layout: post
title: "라스베리파이를 이용한 기타 이펙트 (2)"
categories:
    - project
author: "Keith"
---

라스베리파이로 기타 이펙트를 만드는 일도 따지고 보면 진공관 앰프를 DIY하는 것과 별반 다르지 않다. 개인이 DSP를 개인적인 용도로 쉽게 사서 쓰기는 쉽지 않기 때문에 이에 버금가는 노릇을 하는 게 라스베리파이쯤 되는 것이다. 어차피 라스베리파이로 만들더라도 프로토타입에 불과하고 양산용 하드웨어로 보긴 뭐하니까 그렇긴 하다만 현실적으로 이만한 계산능력과 확장성을 가진 저렴한 하드웨어는 구할 수가 없다. 특히나 소프트웨어까지 착실하게 누군가 계속 유지 보수 개발해주고 있으니까 말이다.

여기에 비추어 기타를 치는 사람들에게 있어 주변환경의 발전은 참으로 더딘 편이라 할 수 있을 것 같다. 
- 아직도 많은 사람들이 풋 패달을 쓴다.
- 아직도 많은 사람들이 무거운 앰프와 이펙터를 들고 다닌다.
- 아직도 많은 사람들이 이펙트에 많은 돈을 쓴다.

기타가 무선으로 연결된지는 아주 오래되었다. 80년대에도 기타 캐이블 없이 무선 트랜시버로 공연하던 밴드들이 많았으니까. 하지만 여전히 기타 캐이블을 쓰고 있다만. 

그러나 아직도 풋 페달은 유선으로 연결되어있고 이것을 무선으로 대체한 상품이 히트를 쳤다는 얘긴 못 들어봤다. 이게 무선이 되더라도 어차피 풋 페달의 위치는 공연장 어떤 곳에 고정이 되어야 하니까 이펙트의 패치를 바꿔야 하는 상황에서는 기타리스트는 반드시 그 자리로 돌아와서 페달을 밟아주어야 한다. 기타 케이블로부터는 나름 해방되었지만 아직 풋 컨트롤러에는 종속되어있는 것이다.

디지털 신호처리 기술이 사실상 더 발전할 게 없을 정도로 좋아졌고 저전력 기술은 엄청나게 발전했지만 고작 3단자 혹은 5단자 소자 1, 2개 들어있는 전구만한 진공관이 박힌, 그리고 전원 트랜스 출력트랜스가 왠만한 어른 주먹보다도 크고 무거운 진공관 앰프를 가지고 다닌다. 손가락 만한 배터리 하나면 공연장을 울릴 정도의 출력을 내주는 앰프가 있는 세상에서 열이 펄펄나는 진공관 파워앰프를 쓴다.

아쉽게도 스피커는 그 물리적 한계 때문에 크게 진보를 할 수 없으니 그렇다 치지만, 좋은 PA 시스템이 구비된 공연장에서 구태여 12인치 유닛 4방짜리 캐비넷을 귀아프게 울려댈 이유는 없다. 결국 그러한 이유로 앰프 + 캐비넷 + 마이크의 조합은 디지털 filter로 대치되고 보컬과 함께 믹스되어 공연장 주 PA 시스템으로 나가는 시대가 되었다. 

다시 말해 지미 핸드릭스 및 그 시절 기타 쟁이들이 한마디로 과시용으로 마샬 스텍을 등 뒤에 쌓아놓고 있던 시절이 다 옛날 이야기가 된 것이다.

그래서 내가 아직도 의아하게 생각하고 있는 것은,

1) 왜 풋 컨트롤러는 여태 남아있는 것인가? 와이어리스 시스템은 다들 쓰면서. 와이어리스 시스템에 컨트롤 버튼 대 여섯개 정도 붙여서 기타에서 곧장 컨트롤 하면 되는 것 아닌가? 연주에 열중한 상태에서 내 발이 풋 페달을 제대로 누르고 있는지 봐야 한다는 게 쉬운 일만은 아닌데 말이다. 쉽게는 기타 바디쯤에 버튼으로 운용되는 무선 컨트롤러 한대면 그만인데, 왜 그것을 못하고 있을까?

2) 왜 기타 이펙트는 거대한 것인가? 프로세서들이 아주 좋아져서 DSP에 미친 듯 의존하지 않아도 되고 쓸데없는 모델링 기능을 제거하면 이펙트 알고리즘도 엄청나게 가벼워지는데 왜 안하고 있는 것인가? 고급알고리즘을 단순화시키면 충분히 저가 이펙트에서도 고급진 소릴 낼 수 있는데 왜 안하고 있는 것인가? 왜 보급형 프로세서들은 보급형 소리밖에 내지 못하는 것인가? 이미 과거의 명기들에서 사용되는 알고리즘들은 다 알려진 것이나 다름없는데 말이다.

3) 왜 사람들은 stomp pedal을 여태 쓰고 있는 것인가? 부피와 무게에 의한 번거로움도 번거로움이지만 잡음에 취약하고 전원 문제가 그다지 간단하지 않은데도 이것을 하나의 세트로 만들어 애지중지하며 들고다니는 이유는 무엇인지 궁금할 뿐이다. 이 좋은 세상에서 9V 전원을 꼭 써야만 하는 이유도 알 수 없고 값싸고 좋은 5V 충전 배터리가 널려있는 세상에서 패달 파워라 불리는 멍청한 물건을 이용해야 하는 이유도 알 수가 없다.



