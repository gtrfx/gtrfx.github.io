---
title: "retiming 하기"
layout: post
tags: [pipeline architecture, hdl]
author: "Keith"
---

hdl 구성 요소 중에서 clock이 좀 소요되는 장치가 붙어있으면 어쩔 수 없이 리타이밍을 해야 한다. 

무슨 말이냐면 시간 지연이 있는 장치에서 원하는 결과가 얻어질 때까지 다른 주변 로직도 시간 지연을 주어야 한다.

어떻게 주냐고?

뭐 별 거 있나? delay가 생각보다 길다면 register를 길게 잡아놓고 for loop를 돌리는 것이다. 얼마 안된다면 스스로를 계속해서 non-blocking assignment를 통해서 돌리는 일이고.

즉, 아래와 같은 모양새가 된다.이를테면 100 Tc 가까이 지연시키겠다면 아래처럼 한다.
```
reg [10:0] d [99:0];

always @(posedge clk) begin
...
for (i=1;i<100;++i) begin
    d[i] <= d[i-1];
end
end
```

그게 아니라 1,2개 clk이 밀린다면 아래처럼 대충 밀어비린다. 기왕이면 input output에 얼마나 밀려서 결과가 얻어지는지 signal의 이름으로 알려주는 것도 좋은 방법이지 싶다.
```
reg [10:0] a0, a1, a2;
always @(posedge clk) begin
...
a1 <= a0;
a2 <= a1;
end
```