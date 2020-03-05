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

몇 가지 중요한 directive만 놓고 보자면

1) HLS_PIPELINE_LOOP: loop를 pipeline으로 기동할 수 있다. 대신 많은 instance를 사용해야 하다보니 area가 늘어난다. 
2) HLS_CONSTRAIN_LATENCY: latency를 정해놓고 synthesize를 하게 된다. 물론 latency를 무제한으로 했을 때에 비해 resource를 많이 사용해야되니까 area가 늘어난다. 
3) HLS_UNROLL_LOOP: loop를 모두 풀어헤쳐서 처리하게 한다. latency가 줄지만 area가 늘어난다.
3) HLS_FLATTEN_ARRAY: array를 풀어헤쳐서 동시에 여러 개의 array를 access할 수 있게 된다. 속도가 빨라지는 반면 역시 area가 많이 늘어나게 된다.

