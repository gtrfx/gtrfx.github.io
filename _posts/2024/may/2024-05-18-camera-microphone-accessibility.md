---
title: "해킨에서 카메라/마이크 허용이 잘 안될 때..."
tags: [hackintosh]
layout: post
author: "Keith"
---

카메라와 마이크의 사용권이 필요한 앱이 제법 있다. 이들이 MacOS으로부터 허가를 받기 위해 요청이 들어가면 요청을 수락하겠느냐라는 작은 dialog가 뜬다. 이것은 정상적인 상태이고 뭔가 MacOS가 애매하게 설정되어있으면 아예 이런 dialog 자체가 뜨질 않는다.

인터넷을 검색해보면 다음과 같은 명령을 사용하고 나서 정상적으로 되었다는 이야기들이 있다.

```
tccutil reset Camera
tccutil reset Microphone
```

이것은 말 그대로 tcc db를 리셋해서 허가되었던 모든 앱들을 없에버리는 것이다. 뭔가 OS 설정이 잘못되어있어서 요청을 수락조차 할 수 없는데 db까지 날려버리면 아무 앱에서도 (사파리나 페이스타임과 같은 애플 앱은 제외한다.) 마이크와 카메라를 쓸 수 없게 된다.

내 경우는 SIP이 disable된 관계로 tcc db 자체의 변경이 불가했기에 앱에서 접근 요청을 해도 아무런 일이 일어나지 않았다. 왜 SIP을 disable 했냐고? OLCP라는 patcher를 구동해서 broadcomm wifi card를 쓰려면 어쩔 수 없는 선택이다.

무슨 말이냐고? SIP을 enable하면 허용되지 않는 kext들을 써야 하기 때문이다. 이것은 apple이 옛날 broadcomm card들을 지원하는 kext를 모두 retire해버렸기 때문이다. 그런 걸로 따지면 차라리 intel wifi card를 쓰고 OLCP를 쓰지 않는 것이 훨씬 유리할 때가 있다. 가장 아쉬운 것은 AirDrop이 잘 안되는 것인데, broadcomm wifi card가 아니라도 iphone 같은데서 해킨으로 airdrop은 잘 된다. 그 반대방향으로의 전송이 안되서 문제지.

잠시 SIP을 enable하면 원하는 마이크로폰/카메라의 허가권을 모두 새로 설정할 수 있다. 물론 wifi card가 제대로 동작하지 않게 된다.

그렇다. 내가 사용하는 모든 앱에 마이크로폰/카메라의 허가권을 모두 설정하고 다시 SIP을 disable하면 된다.
