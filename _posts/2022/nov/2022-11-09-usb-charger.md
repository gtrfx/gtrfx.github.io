---
title: "USB 충전기.."
tags: [fake, usb pd, usb charger]
layout: post
---

요새 집에서 심심해서 집 어딘가에서 썩고있는 모든 DC 전원장치 (어댑터)를 USB charger로 개조하는 일을 하고 있다. 어차피 20W 정도의 GaN charger가 얼마 하지도 않는데 뭐하러 그런 일을 하냐고 할 수 있다. 그렇다 소형의 GaN charger는 성능도 좋고 크기도 작아서 아주 요긴하다. 그런데 그렇다고 이런 저런 장치에 따라왔던 DC power supply를 버리기도 뭐하다. 

이것들은 대개 저출력인 경우엔 7805를 달고 있는 경우가 대부분이고 나름 출력이 좀 있다고 하면 전력 TR (엄밀히 FET)로 스위칭을 하는 전원장치인데 후자의 경우는 찾기 쉽지 않다. 왜냐면 덩치가 커지기 때문에 특별히 많은 전류 출력을 요구하는 디바이스가 아니면 잘 안쓰기 때문이다. 사실 GaN FET가 나오기 전엔 이런 역할을 하는 TR에 방열판도 붙어있어야 되고 (7805도 방열판이 붙는 게 일반적이지만) 트랜스포머도 큰 걸 써야되고 보호회로도 붙어야 되고 하니까.

어쨌든 7805가 달린 전원장치들은 출력이 너무 작아서, 7805 자체의 spec은 출력이 1.5A라고 되어있지만, 7805의 입력이 되는 전원, 그러니까 정류된 전압 자체도 높지 않고 전류 출력 또한 크지 않다보니까 이마저도 못하는 수준인거다. 

이런 지경에 USB 포트/케이블을 이용해서 충전하는 게 워낙 흔한 세상이 되다보니 일반 전원 아웃렛에도 USB 포트가 달려나오기도 하고 익스텐션 코드에 붙어나오기도 하는데, 대개 5V USB output을 보자면 대개 2.4A를 내보낼 수 있다고 되어있다. 무슨 말이냐면 5V가 유지되는 상황에서 2.4A가 나올 수 있다, 즉 12W 출력을 내보낼 수 있다 뭐 그런 뜻인거다. 

그런데 그 장치 어딜 봐도 12W를 내보내기엔 턱없이 작은 크기로 되어있어서 뭔가 전원 설계에 있어 첨단 기술을 가지고 있나 싶었으나 이 모든 게 다 뻥카라는 게 다른 디바이스들을 연결해보면 알 수 있다. 

일례로 내가 가지고 있는 Android tv box가 있는데 (S905X라는 Soc를 쓴 것이다) USB 전원을 이용해서도 구동이 가능한 것인데 5개의 USB charger/charging port에 모두 연결해봤는데 중간에 시스템이 reset되는 것을 경험했다. 무슨 말이냐고? 시스템 부하가 올라가면 전원 공급이 모잘라 그냥 리셋되어버린 거다. 그러니까 많은 전류를 요구하는 상황에서 전압이 5V로 유지되지 못해서 시스템이 리셋된 것이다. 

웃긴 것은 집에 굴러다니는 5V, 2A 출력이 나오는 DC adaptor를 연결하니 아무 문제없이 잘 동작했단 것이다. 물론 65W 출력이 된다고 써있는 GaN charger를 연결했더니 아무 문제없이 잘 돈다. 나름 비싸게 주고 산 다른 Charger들 중에 멀쩡히 잘 되는 것은 하나도 없었다. 그러니까 다시 말하면 내가 속아서 산거다. 

꼭 고속 충전 기능이 된다고 적혀져있는 충전기가 아니라도 단지 5V 출력만 훌륭해도 빨리 충전시킬 수 있다. 물론! 전원부 출력이 좋은데 QC라든가 USB PD가 되면 더 빨리 충전을 시킬 수 있을 거다. 다른 기능 다 잘 안되더라도 단지 5V 출력만 튼실해도 충전엔 별 어려움이 없단 말이다.

QC가 된다거나 USB PD가 된다거나 하는 것과는 다른 문제다. 이들 규격은 전원 전압을 올려서 많은 전류를 흐르게 하겠다는 일종의 프로토콜/전략인 것이지 이 기능들이 된다고 전류 출력이 크다는 의미는 아니다. 쉽게 말해서 buck converter같은 것을 써서 5V 전원을 뻥튀기해서 올릴 수 있게 했다든가 아니면 down converter로 평소에는 5V 출력을 내보내다가 경우에 따라 높은 전압 (9, 15, 20..)을 내보내게 할 수 있다든가 하는 기능이 있다 뿐. 

여기에 GAN device가 붙으면 고출력을 내보낼 수 있다고 하는데, 그것도 전원부가 어떻게 구성이 되었느냐가 중요할 뿐 GAN device (GaN (Galium Nitride) FET가 맞다)는 단지 Rds (FET가 도통 상태일 때의 저항값)이 낮은 transistor에 불과하다. Rds가 낮으면 당연히 열이 덜 생기고 그로인한 전력손실이 작아서 더 높은 효율로 전원을 전달할 수 있다는 것이지 없는 전력을 끌어다 대는 능력이 있다는 것은 아니다.

어쨌든! 내가 가진 거의 모든 USB charger는 정격이 뻥으로 되어있고 그것을 법적으로 뻥을 치지 말라고 규제하는 장치가 없다보니 속을 때가 허다하단 말이다.

9V 혹은 12V라든가 20V 정도의 출력을 내보내는 전원장치들의 경우는 USB로 직접 연결을 시킬 수가 없다. 별도의 USB charger회로를 붙여줘야 한다. 알리익스프레스에서 QC/USB PD가 지원된다는 것을 아무리 싸게 구해도 개당 5불이 넘어간다. 그러니까 안 쓰는 DC 아답터에 이 보드하나 붙여서 만들어놓으면 모양도 흉칙할 뿐더러 비용적으로도 그리 아름답지 못해서, 차라리 30-40W짜리 GaN charger를 1x불에 구입하는 것만도 못한 결과를 얻게 된다.

결론을 요약하자면
- 대부분의 USB 충전기의 스펙은 뻥이다. 잘해야 5V 1A 이내의 출력을 내보낸다.
- 5V 출력만 좋아도 USB 충전기로 빠른 충전이 가능하다. 물론 대출력의 QC/USB PC 충전기만은 못하더라도.
- 못쓰는 전원장치는 대출력이 아닌 이상엔 그냥 버리자. 괜히 개조해서 USB charger로 만들어봐야 별 의미 없다. 가격적으로든 미관상으로든.