---
title: "HLS: 1주째 (2)"
tags: [HLS, stratus]
layout: post
---

여러 가지 예제를 가져다놓고 실험해보고 있다. 결과는 verilog로 직접 들어가는 것보다 그다지 깔끔하지 못하고 쓸데없이 옵션들이 많아서 피곤하게 한다는 것. 

1. 기본적인 synthesize 전략

   RTL의 기본인 data path + state machine에 따른다. data path는 되도록이면 combinational logic (assign a = b ? c)로 가고 state machine이 clock에 따라 조건을 달리 가져가는 모양새를 취한다. 반드시 그래야 할 이유는 없지만, C를 작성할 때도 비슷한 구조를 가져가는 것이 상대적으로 debugging에 유리하다. 

2. RTL 변환

   RTL 변환은 내부 signal 단위마다 always @.. 의 section을 쓰는 식으로 진행한다. 각 section에서는 해당 모듈의 state variable에 따라서 case ... 로 동작한다. 결국 mux로 구현된다고 보면 된다. 

3. HLS_DEFINE_PROTOCOL

   이 지시자(directive)가 붙으면 해당 부분은 cycle accurate하게 가겠다는 것이다. 사용자의 연산과정 중에 원하는 timing에 output 안나오는 지경이면 path violation error를 낸다. 대개 강제로 wait를 추가해야 한다. 그러면 전체 global state에서 해당 event가 일어나야 할 state를 조정해서 일종의 retiming을 한다. 

4. HLS_PIPELINE_LOOP

   이것을 선언하면 해당 연산과정이 전부 작은 data path 요소들로 전환되고 입력들이 여러 개의 register 들로 시간에 따라 이동하도록 verilog를 작성하게 된다. 다루는 계산작업이 단순할 경우에는 이것을 선택하거나 말거나 아무런 차이가 없다. 

5. HLS_UNROLL_LOOP

   Loop를 풀어서 한방에 계산하게 해주는 마법의 기능처럼 보일 수가 있는데, 실제로 그것은 현재의 결과를 다음 클럭에 재 사용하게 되는 경우엔 해당하지 않는다. loop에서 어떤 계산을 할 때 그것이 전부 개별적인 입력을 가져와서 개별적인 출력 path로 나가는 경우에만 해당한다. 이 때 for loop에 묶여있는 것들이 전부 개별적인 assignment로 바뀌게 된다. 
   그런데 이 옵션을 주지 않아도 unroll하는 경우가 유리하다고 판단되는 경우 스스로 unroll하겠다는 메시지를 내고 맘대로 unroll해버린다. 

Directive를 적용할 때, 실제로 compiler가 더 열심히 돌면서 좋은 결과를 찾아내려 애쓰지만, 애초에 하기 어려운 일이라고 판단되면 컴파일러도 마찬가지 결과를 내게 된다. 즉, directive를 이것 저것 붙여서 최적화를 더 시킨다고 하더라도 대세는 바꾸지 못한다. 이래서 HLS가 verilog 작성에 비해 유리하냐 안하냐를 계속해서 고민하게 되는 것이다. 

애초에 architecture를 잘 잡아놓았다면 microarchitecture도 그에 따라서 아름답게 잡히게 되고 HLS로 하든 verilog로 하든 아름다운 모양새로 나타나게 된다. C 상태에서는 architecture를 엉터리로 잡아놓았다고 하더라도 시간과 자원의 구애를 받지 않기 때문에 어떻게든 돌아가게 할 수 있지만, verilog에서는 그렇지 않다. 
