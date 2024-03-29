---
layout: post
title: "2.1 Channel Speaker Modification"
author: "Keith"
---

## 들어가며

아마도 3년도 더 된 것 같다. 이 스피커를 아마존에서 구입한지. 2.1 채널 스피커인데 컴퓨터와 같이 사용하려고 샀던 것 같다.

![speaker](speaker.jpg?resize=800)

장점은 가격이 싸면서 소리도 나쁘지 않단 점이고 단점은 쓸데없이 와이어가 좀 많고 컴퓨터와 같이 쓰는데 켜고 끄기가 좀 불편하게 되어있다는 것 되겠다. 또 별도로 100V 전원을 취하고 있기 때문에 사실 별 것 안해도 전력을 계속 소모하고 있다는 문제가 있다.

사실 이 물건에다 어떤 짓을 해야겠다 생각하게 된 것은 내게 블루투스 스피커가 하나 있으면 해서 개조하는 것이 어떨까에서 출발했다. 싼게 비지떡이라고 이베이에서 저렴한 블루투스 붐박스를 샀는데, 생각보다 너무 작았고 음질은 말할 것도 없고, 모노포닉이었다는 것이다. 내부에 Li-Ion cell이 약하게나마 있었는데 수명이 얼마되지 않아서 사실상 무의미했다. 결과적으로 아무 짝에도 쓸모 없는 물건이었다. 단지 블루투스가 된다 뿐이지. 음질도 엉망 스펙도 꽝. 그냥 이 물건을 구입하는 데 들어간 돈을 점잖게 기부했다면 좋았을텐데 말이다.

어쨌든 내가 3년 여간 쓰지 않은 이 물건을 다시 꺼내게 된 것은 집에 놓을 마땅할 Loud speaker가 없어서였는데, 그렇다고 공간이 넓고 음악을 크게 틀어도 되는 상황이 아니다보니 괜찮은 것을 들여놓기도 뭐했고, 들여놨다고 하더라도 보나마나 최고 볼륨의 1/100-5/100 정도를 왔다갔다 할거라 더욱 그랬다.

## 내부를 뜯어보니

사실 이 물건은 버리긴 뭣하고 누구한테 주기도 뭐해서 그냥 버려야되는 것인가 했는데, 어쨌든 블투스피커로 재활용이 가능하다면 참으로 다행이겠다 했다.

그래서 막상 뜯어보니, 대략 14VAC 출력이 나오는 트랜스포머가 하나 있었고, 흔한 Class AB amplifier 칩이 들어있는 앰프 모듈이 있었는데, 방열판까지 달린 것으로 봐서는 제법 열을 내는 물건임을 알 수 있었고, 그 얘기인 즉 별 일 안해도 전력소모가 있겠구나 했다. 왜 이걸 신경쓰냐면, 스피커를 켜고 끄는 일이 불편하기 때문이다. 또 블투스피커면 무선으로 컨트롤하는 맛으로 쓰는 것인데, 일부러 스피커 앞으로 가서 켜주고 또 다 들었다 싶으면 꺼주고 하는 게 귀찮아서 아예 저전력으로 만들어버리면 온 종일 켜놔도 신경쓰이지 않기 때문이다.

뭐 소형 스피커 하나가 사용하는 전력에 그리 민감하냐 할 수 있는데, 사실 이 저출력의 스피커가 100V 전원을 사용하는 것도 웃기고 더군다나 쓸데없이 계속 전류를 흘린다는 게 많이 마땅찮았다가 맞을 것 같다. 기왕이면 USB power로 동작할 수 있으면 더 좋겠다고 생각했고 말이다.

![amp_module](module.jpg?resize=800)

앰프는 4채널짜리 IC인데 두 채널을 BTL로 연결해서 서브우퍼용으로 활용하고 있고, 회로 기판은 좀 쓸데없이 큰데 사진에서 보는 것과 같이 정류회로와 서브우퍼를 위한 필터가 추가되어 그렇다. 사실 변경을 최소화하면서 블루투스 기능만 더하는 것이 목표였는데, 사진에서 보이는 컨넥터에 컨트롤러 (볼륨/전원/외부입력)이 연결되는 거라 복잡하게 되어있어서 추적해보려고 하다가 결국 포기하고 모듈을 class-D로 바꾸기로 했다. 사실 이 물건을 뜯기 전엔 이 물건이 class-D amp로 된 줄 알았다. 워낙 싸니까 그렇게 만들지 않았나 했는데 사진을 보면 알겠지만 사람이 조립한 거라 노동이 훨씬 더 많이 들어간 것을 알 수 있다. 대개 class D는 SMD 부품 대충 깔아놓고 오븐 넣고 땜이 된거라 부품수도 작고 사람 손은 거의 닿지 않을 정도로 간단하게 만들어지기 때문에 단가는 이것과 비교가 안된다.

어쨌든 여러 가지로 불편하게 만들어놨기 때문에 다 뜯어버리고 작은 class D 모듈을 가져다 넣으려는데 100V을 사용하자니 정류회로와 bluetooth module을 위한 5V 전원이 또 필요했고, 그렇다고 USB 전원으로 모두 구동시키자니 파워가 딸릴 것 같고 해서 한참을 고민하고 실험해봤는데 결국 USB 전원으로 돌아가는 class D amp module을 쓰기로 했다. 소매로 구입해도 모듈 2개 (하나는 서브우퍼용) 배송비 포함 1불이 되지 않는다. 아쉬운 것은 bluetooth chip과 class-D amp가 하나로 된 모듈도 가격이 5불이 되지 않는데 이것을 알았더라면 이것을 택했지 싶은데, 아쉬운 것은 AUX 단자가 없다는 것이지만 어쨌든 그것을 추가로 땜을 해서 해결하면 되니까 사실 큰 문제가 되지 않는다.

## Class D amp module

![class_D_module](amps.jpg?resize=800)

위 사진에서 보듯 class D 칩 주변에 그리 많지 않은 R/C들이 붙어있는 것인데, 이게 어떻게 그리 큰 출력을 낼 수 있느냐 하면, 아마도 우리가 뻥 튀기 된 앰프 출력에 너무 오래 속아왔기 때문이지 한다. 일반적으로 대개 1-2와트 정도 출력만 되도 가정에서 사용하는 오디오로는 충분한 출력이다. 단지 문제가 되는 것은 이미 언급한 바와 같이 전원이 준비되지 않은 상태에서 갑자기 많은 전류를 요구할 때인데, 이것은 전류 출력이 좋은 대용량 충전지 혹은 대용량 Cap을 이용하면 된다. 

## Bluetooth integration

Bluetooth module은 USB용으로 나온 것을 별도로 구입해도 되고 매우 작은 보드 위에 전원과 출력단자만 연결해서 쓸 수 있도록 나와있는 모듈을 구입해서 쓰면 된다. 가격도 얼마 하지 않을 뿐더러, 사용법도 간단하다. 내 경우에는 이미 가지고 있던 USB용으로 나온 것을 분해해서 사용하였다. 그런데 문제는 역시 전원에 있었다. BT와 Class D amplifier가 같은 전원을 사용하고 있기 때문에 amplifier에서 많은 전류를 끌어가면 BT가 죽었다가 다시 재부팅하는 문제가 있었다. 따라서 원활환 작동을 위해서는 이 둘의 전원을 서로 분리해야 한다. 즉, BT가 사용하는 전원은 전압이 떨어지면 안되므로 외부에서 공급되는 전원을 그대로 가져다 쓰되, 앰프가 가져가는 전원은 전압의 변동이 있을 수 있으므로 충전지 혹은 Cap을 써서 급격한 변동만 최대한 막아줄 뿐, 외부 전원이 그것을 서서히 충전시키는 것으로 해야 한다. 다시 말해 전기적인 저항으로 외부전원과 내부 전원 (충전지 혹은 Cap)을 분리하는데, 이 저항 값이 너무 크면 충전이 느리게 되고, 반면에 앰프쪽에서 전압이 급격히 떨어질 때 받는 영향은 줄어든다. 

## USB power noise

일단 TV에 있는 USB 단자를 이용해서 앰프르 연결해보았는데 TV에서 audio 출력이 0인 상태에서도 꿀럭거리는 잡음이 났다. 티비를 처음 기동하면 잠시 잡음이 없다가 본격적으로 내부 AP가 동작을 시작하면 잡음이 발생했다. 다시 말해서 USB로 들어오는 전원에 잡음이 실려있는 것을 의미한다. 티비 내부에 있는 회로 소자들이 한꺼번에 많은 전류를 끌어쓰면 전압이 흔들리게 되는데, 그게 그대로 반영된 것이다. 더 자세히 말하자면 티비의 디지털 전원 (5V 계통)의 출력이 약간 모자른 듯 한 것으로 이해된다. 어쨌든 이러한 이유로 티비로부터 USB 전원을 가져다쓰는 스피커에 잡음이 그대로 실렸다. 이를 위해서 전원에 별도의 filter를 붙여야 하는데, 이것은 이미 말한 것과 같이 외부로부터 들어오는 전원과 내부 전원 (Li Ion cell)을 적절한 저항으로 분리해서 사용하는 수 밖에 없을 것으로 보인다. 다른 디지털 부품들은 이 정도 잡음에도 별 문제 없이 잘 동작하는 것으로 보인다.



