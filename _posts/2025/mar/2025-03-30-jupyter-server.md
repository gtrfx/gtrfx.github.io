---
title: "오늘 한 일..."
tags: [llm, aiml]
layout: post
author: "Keith"
---

cuda GPU를 회사에 설치해놓고 여기 저기서 불러다 쓸 수 있게끔 jupyter notebook server를 열어놨다.

VS code에서 쉽게 부를 수 있다는 게 꽤나 장점이다.

문제는 VPN이 잘 되는 곳에서만 사용이 가능하다는 것인데, 잘 안되면 MPS라도 쓰면 되고 MLX도 쓰면 된다.

이제 python 실력을 좀 올려야 되니 복잡한 일 하나를 python으로 만들어봐야겠다.

내가 다른 언어를 위해서 새로운 라이브러리를 만들 수는 없으니 울며겨자먹기로.

일단 머신은 내가 주로 쓰는 기계 뒤로 보냈다. 무슨 말이냐면 internet sharing (NAT)으로 내 주력기종 뒤에 private network 안에 두어서

외부에서 건드리지 못하게 해놓고 ssh -f -N -L 로 일종의 portforwarding을 해놨다.

