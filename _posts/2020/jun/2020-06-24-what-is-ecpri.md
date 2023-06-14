---
title: "eCPRI 는 무엇인가?"
tags: [eCPRI]
layout: post
author: "Keith"
---

블로그 접속 통계를 보니 eCPRI에 대한 조회수가 가장 높다고 나온다. eCPRI는 이미 주기적으로 나오고 있는 spec이 있으니 그것을 참조하기 바란다. 혹시나 낚시용으로 작성한 게 아닐까 의심을 받기 싫어서 내용을 다시 작성한다.

CPRI 대비 eCPRI의 차이점은 CPRI packet을 ethernet (UDP) 으로 주고 받을 수 있고 baseband signal에 대한 압축을 할 수 있게 해놓은 것이다. 흔히 이것을 ORAN이라고 부르기도 하는 것 같다. 압축이란 게 무슨 LZH 같은 압축을 말하는 게 아니라 linear scale로 되어있는 baseband signal의 amplitude를 log scale에 가까운 curve를 이용해서 다시 mapping하는 것을 말한다. 그러니까 dynamic range를 압축하는 것이라고 보면 된다. 

중요한 것은 CPRI가 eCPRI로 왔다고 해서 완벽하게 vendor independent한 standard가 된 것이 아니다. 여전히 vendor specific한 message를 주고 받을 수 있게 되어있고 그 프로토콜 자체에 자유도가 많아서 vendor specific한 요소가 더 많아졌다고 봐야된다. Vendor가 바보가 아닌 이상 third party가 쉽게 들어오게끔 열어줄 이유가 없다. 그런 것처럼 티를 낼 뿐이지. 보나마나 이 글을 major vendor의 사람들이 읽을 이유가 없을테니까 아무리 standard라고 하더라도 standard라고 하기 뭐한 것이라고 말 해야 할 것 같다.

그래도 혹시나 힌트를 얻으려고 하는지 모르겠는데, 미안하다. 내가 본 vendor specific한 eCPRI의 모습은 회사마다 다 달라요 이고, 그 부분의 vendor specific한 event에 대한 handler가 제법 복잡하게 되어있다. 그것을 블로그에서 다룰 수 있는 내용도 아니고 그걸 내가 하나도 빠짐없이 열거해놨다고 한들, 말로 적어놓은 것을 리버스 엔지니어링 할 수 있는 것도 아니다. 검증하는 것 자체가 안되니까.

