---
title: "Verilog Basics"
tags: [verilog]
layout: post
---

요새 아주 재미삼아 이것 저것 다 찝적거리고 있다. Verilog는 사실 업계 사람들이면 다 할 줄 아는 기본기에 속하는데, 그냥 간단히 적어보면서 내용 정리하려고 한다.

Verilog는 대부분 module description이다.대충 이런 식으로 되어있다. 검증 내진 확장용으로 system verilog라는 게 있는데 그것은 verilog + perl의 구조다. 간결하면서도 가독성이 대단히 훌륭하다 (VHDL에 비해서).

```
module xxx (a, b, c, ...);

input a;
input b;
output c;
...
...

wire aa;
...
...

reg ccc;
....
...

always @(condition)
begin

    if (condition)
    ...
    else
    ...
    
end


endmodule
```

여기에 몇 가지 애매 모호한 것들이 있다. 이것은 프로그램과 달리 하드웨어가 어떠한 구성을 하고 있다는 것을 묘사하는 것이라 시간 개념이라는 게 대단히 애매하다. 

무슨 말이냐면, 여러 줄로 작성하게 되면, 프로그램을 작성하던 사람의 관점으로는 위에 놓여있는 statement 일 수록 빨리 수행될 거라는 생각을 갖게 되는데, 이것은 그렇지 않다. 모두 같은 시간에 이루어지는 일이라고 생각한다. 그런데 logic gate의 특성상 동시에 이루어지는 일이라는 것은 없다. statement대로 일이 일어나긴 일어나되 delay를 갖게 된다고 인식해야 한다.

이것은 하드웨어가 어떻게 생겨져있는지 묘사하는 것이기 때문에 그 의미대로 작성을 해야 원하는 대로 합성이 된다. 합성(synthesis)과정은 사용자가 작성한 그대로 그 의미를 최대한 살려서 logic을 배치하고 연결시켜주는 일이다. 

#### concurrent/sequential statement

이를테면 다음과 같이 쓰면 이것은 사실상 그냥 logic을 hardwired 해버린 것이라고 보면 된다. A와 B가 입력으로 주어지는 adder의 출력이 C에 연결되는 것이다. 
```
assign c=a+b;
```
이와는 달리 always ... begin ... end, 또는 if (...) being end 로 가는 맥락의 기술에서는 순차적인 실행을 의미한다. 이것을 procedural block이라고 한다. 그러니까 절차를 설명하는 문단이라고 보면 된다.

어떤 조건이 붙고 begin end로 간다거나 하면 procedural block이 와서 붙는다고 보면 된다. 그 밖에 나와있는 것들은 concurrent statement다. 쉽게 말해 logic 간의 연결을 규정해놓은 것이라고 보면 된다. 

더 쉽게 생각하자면 프로그래밍적인 요소들은 procedural block안에 있고 그 밖에 있는 것들은 어느 부품이 어디에 땜이 되어있다 설명해 놓은 것 (netlist?)과 같다고 보면 된다. 


아래의 내용은 딱 봐도 procedural block에 있는 구문임을 알 수 있다. '#'이 보이면 이것은 강제로 시간 구분을 해놓겠다는 것이다. 
```
d=a;
a = #10 b&c;
#10 d = ~a;
```
이런 시간차를 두는 구문도 쓸 수가 있다. 

맨 윗줄은 지금 당장 a를 d에 넣는 일을 하게 된다. 두 번째 줄은 지금 당장 b&c를 계산하지만 그 결과를 10 클럭 뒤에 넣어주고, 거기서 10 클럭 이후에 a의 negate를 d에 넣어주게 된다.

#### blocking/non-blocking assignment

이게 모호한 개념 중 하나인데 다음을 보자. 

'='는 값을 대입시키는 (쉽게 말해 레지스터에 논리값을 넣어주는) 일이라고 본다. 이것을 blocking assignment라고 한다. 

즉, 우측의 값이 좌측으로 대입되는 과정에서 분명히 시간차가 있을 것을 가정한 구문이다.



```
module evaluates2(out); 
output out; 
reg a, b, c; 
initial 

begin 
   a = 0; 
   b = 1; 
   c = 0; 
end 
always c = #5 ~c; 
always @(posedge c) 

begin 
   a <= b; 
   b <= a; 
end 
endmodule
````