---
title: "Verilog Basics: 별 거 없다"
tags: [verilog, basic]
layout: post
---

프로그래밍을 하다보면 더 빠른 방법이 없을까 생각하다가 결국 assembly를 하게 되고 assembly까지 왔다면 더 빠르게 뭔가를 해봐야 할 방법이 떠오르지 않는다. 원치 않아도 복잡한 ALU를 써야 되고 등등등. 이런 구조가 flexibility가 거의 무한대에 가까운 응용분야에 대해서는 매우 유리하지만, 반대로 고정된 계산을 매우 빨리 해야겠다는 측면에서 접근하면 비효율적이기 짝이 없는 구조가 된다. 그래서 그 고정된 계산을 매우 빨리, 최소의 자원으로 해내야겠다면 H/W를 설계하게 되는 것이고 그래서 사용하게 되는 도구로서의 언어가 verilog 되겠다. vhdl도 있지만 애진작에 verilog가 업계 표준이 되었다. 

#### 기본 구조

본론으로 돌아와서 verilog는 다음과 같이 기술한다.

```
module module_name( arg0, arg1, .... )

...

endmodule
```

하나의 function을 보는 것 같다. 그러나 시간 개념의 차이점을 가지고 있다. 일부러 시간과 관련된 것을 표현하지 않으면 모든 statement는 동시에 실행되는 것이라고 보면 된다. 그리고 이렇게 작성해놓으면 가상의 공간에 하나의 instance 가 생겨나는 것이므로 주어진 조건이 성립되는 한 계속 실행 되는 것이다. 그래서 이것을 프로그래밍언어로 쓰면 (while(1) { ... }) 이 되는 것이다.

arg들의 type을 정하는 것은 "()" 안에 하든 밖에 하든 상관없다. type이란 것도 사실 간단해서 bit width가 얼마가 되는지와 wire인지 register (reg/logic)인지 입력(input)인지 출력(output)인지 혹은 user가 define한 pack인지 (struct쯤 해당한다고 보면 된다, 이게 bus라고 치면 bus가 된다).

#### 시간 개념

시간 개념이란 것은 사실 기본 전제가 동시에 항상 실행되는 것이라고 이해하면 된다. 말이 실행이지 statement를 기술함으로써 땜질(wired)이 되어버리는 것이다. 

```
module module_name( arg0, arg1, .... )

=== concurrent block ====

always @(...) begin

=== procedural block ====

end

endmodule
```

단 always ... 혹은 if ... 가 들어가는 경우엔 (둘다 다 조건문에 해당한다) 시간적인 개념이 달라붙게 된다. 즉, 이것을 실제로 구현하는 것은 납과 wire가 아니라 logic gate (FF)가 들어가야 되기 때문이다. 다시 말해 전기적으로 스위칭되고 전기적으로 읽혀지고 쓰여지는 것이라 시간 개념이 붙게 된다.

```
assign c = d;
```
라고 하면 사실상 c와 d는 wired 되어있다고 이해하면 된다. 

```
always @(posedge clk) begin
   c <= d;
end
```
라고 기술했다고 하면 clk이 positive edge일 때 d의 값이 c에 들어가게 된다. 항상 d의 state가 c의 state가 되는 것이 아니라 (wired 되어있는 것이 아니라) posedge clk일 때만 d의 상태가 c의 상태로 들어가게 된다. 그러하다 하더라도 begin, end 사이의 statement는 일부러 시간적인 delay ('#'로 표시되는)를 주지 않는 이상, 그 안의 위치에 상관없이 모두 동일한 시간에 진행되는 것이라고 보면 된다.

#### blocking/non-blocking assignment

이것도 기초 중에 하나인데, 좀 애매한 면이 있긴하다.

Blocking assignment는 사실상 그냥 wiring하는 것과 같은 의미가 된다. 반면에 Non-blocking assignment는 특정 시점에 상태를 갱신해주는 것을 의미한다. 

아래를 보면 'out = (a|b)&d' 가 되는 logic이라고 이해하면 된다. 그냥 wired가 된 거다.
```
reg c, out;
wire a, b, d;
always @(*) begin
    c = a | b;
    out = c & d;
end
```

대신 always부분을 아래와 같이 쓰면 positive clk이 되기 직전의 A와 OUT 또 C, B의 상태를 이용해서 새롭게 C와 out을 갱신하는 것을 말한다.
위의 경우는 늘상 a, b, d가 변함에 따라 c, out이 갱신되지만, 아래의 경우는 postive clock edge에서 과거값을 가지고 갱신이 된다. 
또 statement의 위치와 상관없이 동일하게 작용하기 때문에 새로 갱신된 c의 결과는 out에 영향을 주지 않고 과거의 c값이 영향을 주게 된다. 
```
always @(posedge clk) begin
    c <= out | a;
    out <= c & b;
end
```

clock에 따라 또 sequence에 따라 이걸 구분해야 하는 상황이 존재하기 때문에 이러한 일을 하는 것이다. 


#### FSM (finite state machine)

만약에 순차적인 일을 수행하고자 한다고 하면 state를 알려주는 register를 하나 두고 그것에 맞춰서 'case' statement에 따라서 logic을 구성하면 된다. 사실 이것이 FSM (finite state machine)이 된다.

```
reg [10:0] global_state

...

case (global_state)
    11'd000: begin
       ...
       end
    11'd001: begin
        ...
        if (...) begin
            global_state <= 11'd033
        end
    end
    ...
    ...
end
```
이런 식이 되는 것이다. 말이 거창할 뿐이지, 그냥 시간에 맞춰서 어떤 일을 하겠다 하는 것과 같다. pipeline도 마찬가지로 이미 결정해놓은 자원을 일렬로 늘어놓고 그것을 순차적으로 처리하는 과정이기 때문에 마찬가지로 FSM을 컨트롤러 삼아 일을 하게 된다. 

애매할 것 같아도 나머지는 tool이 다 알아서 해준다. 

#### ALU/RAM/ROM

이것은 내가 처한 상황에 따라 다르다. FPGA처럼 모두 다 되어있는 경우엔 합성하는 과정에서 이미 만들어져있는 (최적화되어있는), 혹은 각각의 라이브러리를 가지고 있는 경우에는 툴이 알아서 이것들을 쓰게끔 해주고 그렇지 않은 경우는 모두 자체의 방법론에 따라 합성하게 된다. 이 과정에서 general한 rule이 사용되게 될 것이므로 아까운 gate들이 마구마구 소모되게 될 것이다.

나머지는 모두 tool이 알아서 해준다. 제약조건 같은 것들은 툴에 맞춰서 업체에서 제공해준다. 개인 입장에선 FPGA를 쓸 수 밖에 없는 시스템이다. 회사의 경우는 각각의 부분별로 담당하는 전문가들이 있으니까 일반 로직을 설계하는 사람들은 주어진 spec에 따라서 RTL만 잘 마무리하면 되지만 말이다. 