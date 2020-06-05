---
title: "RTL과 일반 프로그래밍 언어의 차이"
tags: [letter]
layout: post
---

RTL (register transfer level)이란 게 이름 그대로 register transfer가 이루어지는 level을 추상화한 것이기 때문에 대부분의 기술 내용이란 것이 어떤 logic 상태의 변동을 register에 기록했다가 다음에 꺼내서 또 바꾸고 하는 일들의 연속이 된다. 

일반 프로그래밍 언어의 경우 그것이 program counter에 따라 순차적으로 동작하는 개념을 가지고 있어서 윗줄에 기술된 내용이 먼저 실행되는 개념이라고 보면, RTL의 경우는 그와 상관이 없이 동시에 일어나는 것이라고 보면 되는데, 여기에 assignment (= 또는 <=)가 연관되면 개념의 혼동이 일어난다.

즉, 프로그래밍 언어에서

```
a = c;
b = a;
```
라고 기술했다고 치면, c의 내용이 a로 복사되고 그 다음 a의 내용이 b로 복사되는 것이니까 결과적으로 a, b, c가 모두 c의 내용을 갖게 된다.

RTL에서 다음과 같은 내용이 기술되어있다면,

```
always @(posedge clk) begin
a <= c;
b <= a;
end
```

이것은 이번 클럭에 c의 현재 state를 a로 넣어주고, a의 현재 state를 b에 넣는다고 봐야 한다. 즉, c와 a의 현재 내용이 a와 b의 내용으로 치환된다. 이 두가지 내용은 이번 클럭에 동시에 일어나는 것을 염두에 둔다.

그러니까 좌변의 a, b는 작성자의 입장에서 보면 현재가 아닌 미래의 값 (다음 클럭부터 유효하게 되는 값)이 되는 셈이다. 

이것을 non blocking assignment라고 한다. 
그런데, 이것을 아예 assign한다고 치면
```
assign a = c;
assign b = a;
```
a, b, c는 wired된 셈이니까 그냥 같은 entity (땜이 되어버린 것이니까 사실상 하나) 라고 보면 된다. 

이것을 blocking assignment라고 칭한다. 납땜이 된 것이니까 blocking이 될 수 없는 것이지 하면 된다.

사실 이게 가장 크고 중요한 차이이다. 이것을 전방위적으로 적용하면 된다. 

그냥 생각하면 non-blocking은 flipflop으로 신호가 이동하는 것처럼 보여지고 blocking은 wire로 연결되어있는 경우로 생각할 수 있는데, 이것을 non-blocking한다 blocking한다 라고 하는지 연결하기가 애매하다. 

그런데 간단히 생각해서 wiring이 되는 것은 연결 당사자들을 제외하고 다른 연결을 불허하는 것이 되니까 blocking이 되는 것이고, FF에 의한 연결은 해당 연결에 의한 transition은 clock transition 시점에 이루어지는 것이니까 연결 당사자들을 다른 assignment에 활용할 수 있기 때문에 non-blocking이라고 하는 것이다.

즉,
```
assign a=b;
```
라고 보면 이때 
```
assign c=a+b;
```
할 수 없는 것이다.

대신 아래는 가능하다. 
```
always @(posedge clk) begin
a <= b;
c <= a * b;
end
```
이걸 discrete-time series에 대한  수식으로 적어보자면 아래와 같이 쓸 수 있다. 

a(n) = b(n-1)
c(n) = a(n-1) * b(n-1)