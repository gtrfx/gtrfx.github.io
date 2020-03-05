---
title: "HLS: 1주째"
tags: [HLS, stratus]
layout: post
---

HLS tool을 본격적으로 돌려본지 1주째 되고 있다. 여태 이런 저런 제반 지식만 탐독하고 있다가.

대충 정리해보자면,
1) C --> verilog 변환 능력
   working C code가 있다고 하면 resource scheduling을 잘 해서 제대로 된 결과를 낼 것 같지만, 그것은 c++ 혹은 systemc 상에서만 그러하고 HLS로 synthesis한 뒤의 결과는 전혀 딴판으로 나올 수 있다.
2) HLS directive
   HLS용 몇 가지 directive를 몇 가지 지정하면 C code를 verilog로 strict하게 변환시키는데 이 과정에서 (timing) violation이 일어난다. C code의 작성개념과 verilog의 그것이 같지 않으므로 발생하는 것이다. HLS tool에서는 C 상에서의 시간 개념을 그대로 verilog로 옮겨오지 않는다. C도 verilog처럼 생각해서 가져오게 되므로 여기서 violation이 발생한다.

결국, HLS가 스스로 알아서 microarchitecture도 최적화할 것 같지만, 개발자가 그 나름대로의 timing strategy를 가지고 있다면 여기서 문제가 발생한다.

다시 말해서 개발자가 아예 HLS에게 모두 일임하거나 아니면 HLS directive를 이용해서 개입해야 하는데, 이 경우에는 원치 않은 timing violation이 계속 발생해서 이렇게 저렇게 retiming하다보면 말도 안되는 결과를 얻게 된다. 

다시 또 한번 HLS 따위 다 버려버리고 verilog로 작성하는 게 맞는 거 아닌가 하는 갈등에 빠지게 된다.

