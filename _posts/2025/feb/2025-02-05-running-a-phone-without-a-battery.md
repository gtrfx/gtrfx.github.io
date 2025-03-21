---
title: "배터리 없이 폰 굴려보기..."
tags: [life]
layout: post
author: "Keith"
---

왜 이런 일을 하냐고? 오래된 폰이 하나 있는데, 아니 어쩌다가 액정 패널 (스크린 + 디지타이저라고 한다)이 깨져서 안쓰고 있던 걸 알리 익스프레스에서 싸게 패널만 주문해서 수리해서 시계로 쓰고 있는 물건이 있는데, 이게 오래되서 그런건지 배터리가 부풀어서 커버가 뒤로 열려버린 걸 알게 되었다. 예전에 수리할 때 접착제로 단단히 붙여놨는데 한참 지난 지금 커버가 떨어져있기에 접착력이 안 좋아서 그런가 싶어 무거운 물건 아래에 한참 놔두었는데도 불구하고 여전히 뒤가 벌어지기에 확인해 보니 배터리가 부풀어버렸기 때문이란 걸 알게 되었다.

배터리가 일단 부풀면 배가 부풀어버린 개구리를 옆에 두고 있는 것 마냥 언제 폭발할지 모른다는 불안감 때문에 아직 충방전 기능엔 문제가 없어도 버릴 수 밖에 없다.

일단 폰에서 배터리를 제거하면 외부에서 USB로 전원을 인가하더라도 동작하지 않는다. 대신 배터리를 연결하는 콘넥터를 달아놓기만 해도 (배터리부분은 절단 하더라도) 외부 전원이 있으면 일단 켜지기는 한다. 부팅이 안되서 그렇지.

부팅이 왜 안되는지 정확하게 이유를 알 수는 없지만, 부팅시에 전류를 한꺼번에 끌어쓰는 부분이 있는 반면 전원은 그 정도의 전류를 한꺼번에 끌어당기면 전압이 떨어져버리는 문제 (그러니까 전원의 출력 임피던스가 큰 문제?)가 있어서 그렇지 싶은데, 이걸 어떻게 해결하는지 다른 사람들의 경우를 찾아보면 대부분 1-2A출력을 갖는 5V 전원 (USB로 부터 끌어옴)을 배터리가 연결되었던 단자에 붙여놓으면 별 문제 없이 동작하는 것으로 보인다.

배터리가 연결되었던 단자엔 약간의 회로가 붙어있는데, 그것은 일반적으로 '배터리 보호회로'라고 한다고 한다. 궁금해서 확인해보니 대부분의 lithium cell은 이런 보호회로를 가지고 있다. 그 역할 이란 게 과전류가 배터러로부터 흘러 나오거나 흘러 들어가는 것을 차단하는 기능을 갖는다. 리튬 배터리가 과방전하거나 사실상 단락(short circuit)되거나 하면 폭발할 위험이 있으니까 그렇다고 생각할 수 있겠다. 

그 회로 구성은 전력제어 칩에 MOS FET 두개가 붙어있는 모양을 하고 있는데 두 개의 MOS FET은 스위치 역할을 하고 전력 제어 칩에서 하는 것은 배터리 전압을 보고 과충전이 되고 있는지 아니면 과방전이 되고 있는지 측정해서 과방전/과충전 단자로 정해진 전압을 내보내는 기능을 한다. 쉽게 말해서 과충전 과방전 상태가 아니면 두 개의 MOS FET switch가 on이 되고 과충전이나 과방전 상태면 둘 중 하나가 off가 되어 전류 흐름을 차단하는 원리다. 아주 간단하다. (그러나 회로를 보기 전까진 알 수 없다)

어쨌든 이 과충방전 회로는 배터리와 폰이 연결되는 컨넥터에 달려 있고, 외부 전원을 땜하려면 배터리 단자에 땜하는 것이 편하니까 어쩔 수 없이 여기에 연결되는 전원의 전압은 과방전/과충전 상태가 아닌 정상전압 (대개 3.7v) 정도로 맞춰주어야 동작을 하게 된다. 또 충분한 전류 드라이브가 가능해야 보호회로가 동작해서 전류를 끊지 않는다. 또 스마트폰에서는 배터리 전압을 가지고 충전상태를 측정할 것이니까 전원회로가 나름 안정성이 있어야 된다.

그래서 다른 사람들의 예를 보면, 대개 높은 전압 출력을 갖는 아답터 (대개 9 혹은 12V)에 소형 DC-DC converter(buck converter)를 연결해서 3.7V 정도로 떨궈주고 여기에 배터리 보호회로를 연결하고 그 출력이 전용 컨넥터를 통해 폰으로 들어가게끔 해놨다.

아답터의 출력전압이 충분히 크니까 전류공급이 충분해서 부팅하다가 꺼져버린다거나 하는 일은 없을 것이다. 문제는 쉽게 살 수 있는 buck converter가 폰 안에 넣기엔 약간 커서 안에 넣기도 뭐하고 밖으로 빼기도 모양이 좋지 못한 거? 

내가 보기에 가장 좋은 솔루션은 작은 리튬셀을 넣고 외부에서 USB 전원으로 동작시키는 게 깔끔해보이는데, 문제는 작은 리튬셀도 소량으로 사려면 그냥 정식 배터리를 구입하는 거나 별 차이가 없다는 거.

그러다 보면 결국 그냥 멀쩡한 배터리 사다넣고 끝내는 게 가장 속편한 일이라는 결론에 도달하게 된다. 뭐랄까, 어떤 물건이 원래 의도된 대로 쓰여져야 편리하지 그 용도를 변경하거나 하려면 군더더기 + 노가다가 많이 들어간다는 것. 모양새도 좋지 못하고 오래 가게 하기 쉽지 않다는 것?
