---
layout: post
title: "USB audio interface: power noise problem"
categories:
    - technology
---

상용제품으로 나와있는 오디오 인터페이스를 열어서 확인해보니 USB로부터 들어오는 5V power의 노이즈를 간단하게 해결했다.

단순히 3.3V용 regulator를 이용해서 강압시킨 것이다. 어차피 audio interface chip은 3.3V에서 잘 돌아간다. 나머지 opamp들도 잘해봐야 +1/-1V만 swing하면 되는 신호들을 취급하기 때문에 약간의 마진을 가지고 동작하면 되는 수준이라 별 문제가 없는 것이다.

이 말은 USB audio interface가 USB로부터 받는 전원 단자(VCC)를 끊어버리고 안정적인 외부 전원을 받도록 만들어도 된단 뜻인데, 어찌되었든 기판을 칼로 긁어내서 wire를 없에야 하는 것이니 그다지 쉽지는 않다. 그럴 바에야 아예 동글타입의 voltage regulator가 있으면 더 유용한데 마땅한 물건이 없어서 손수 제작해야 한다.

결국, USB를 케이블로 연결시키고 그 중간을 뜯어내서 외부 전원을 공급받을 수 있도록 개조해야 된다. 이것이 내가 취할 수 있는 가장 좋은 답이다.
