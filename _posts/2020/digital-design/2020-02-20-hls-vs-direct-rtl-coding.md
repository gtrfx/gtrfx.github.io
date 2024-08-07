---
title: "HLS vs. Direct RTL coding"
tags: [hls, rtl]
layout: post
author: "Keith"
---

HLS 툴을 받아서 사용한지 대략 보름 정도 된 것 같은데 그동안 파악된 내용만 정리하면 다음과 같다. 이것은 ASIC이나 RTL을 하는 쪽에서 바라본 것이 아니라 시스템 엔지니어쪽에서 바라본 것이니 그러려니 하자. 

##### 사용방법이 간단하다. (진입장벽이 높지 않다)

비싼 툴에 한정한 것이다. 공개용 툴들은 사용하려다가 이러저러한 이유로 도중에 포기했다. 아마도 비싼 개발툴을 쓸 수 없었다면 끝까지 시도해봤겠지만, 아직은 그럴 필요가 없었기에. 다만 사용방법을 익힐 때의 초기 진입장벽이란 게 좀 있다. IDE를 꼭 써야될 필요도 없고 유저 가이드에서 시키는 것을 다 따라 할 필요도 없다. 일단 어떤 식으로 전체 프로젝트가 빌드되는지 맥락만 따라가다보면 command line 툴로 대체가 가능하고 이것도 scripting 좀 해서 automation하면 급할 때마다 쉽게 활용할 수 있다. HLS라는 게 극소수의 인원으로 IP를 개발하려고 할 때 유용한 것이지만, 인원이 많은 회사라면 거쳐야 할 전통의 프로세스도 있고 (그래야 관리하는 입장에서 안심하니까) 분야마다 전문가가 있으니까 HLS를 하는 목적은 rapid prototyping일 뿐이니까 너무 깊게 들어갈 이유가 없다. 사용할 수 있는 툴도 엄청나게 많을 뿐더러.

뭐 이쯤에서 대충 짐작이 가겠지만, 이를테면 MATLAB에서 HDL을 하겠다고 했을 때 나오는 결과나 허접한 HLS 툴에서 나오는 결과나 별반 차이가 없다. 좀 비싼 것들은 설계의 정석대로 잘 지켜서 만들어내긴 하는데, 그 역시도 RTL을 잘하는 사람이 머리 속에 시스템 전체를 잘 그려놓고 만든 것에 비할 바가 전혀 못 된다. 그래도 나름 data path와 control path를 잘 분리해서 만들기는 한다. 사실상 프로그램의 흐름에 따라 FSM을 만들어주는데 약간 기계적인 면이 있어서 결과물을 봤을 때 쉽사리 이해가 가게끔 만들지는 못한다.

##### Microarchitecture라든가 알고리즘 같은 걸 고민하는 게 무의미한 것 아닌가 하는 생각이 들었다.

이 분야를 전공한 사람의 입장이라면, 혹은 오랜 RTL일을 해와서 이쪽에 일가견이 있는 입장에서는 쉽게 동의하기 어려운 말일 수도 있는데, 최적화 능력이 놀랍다고 볼 수 있다. 개발자가 의도하였건 의도 하지 않았건 그 결과물은 멋드러진 microarchitecture가 최적화된 결과물이 된다. 최적화를 하다보니 결과가 그렇게 도달하게 되는 것인가 싶기도 하다. 
    
1-2년 정도 사용해서 각종 directive들을 능숙히 쓸 수 있게 되면 엄청나게 빨리 개발하면서도 결과는 목적에 최적화된 것으로 얻어낼 수 있다. 다만 결과물이 사람이 쉽게 해독할 수 있게 되어있지 않아서 이 점이 제법 불편할 뿐인데, 어차피 verilog로도 복잡한 기능을 만드는 경우는 작성자가 아닌 타인이 쉽게 해독하기 불가능할 정도로 복잡하게 되어있으니까 HLS/human-rtl의 논쟁은 의미가 없는 것 아닐까 한다.

HLS은 정석에 따라 data path와 FSM으로 구분해서 무자비하게 optimize를 한다. 이 때 거의 C code block을 rtl로 1:1 mapping하다 시피 하기 때문에 검증할 때 양쪽의 결과가 다르게 나올 확률은 매우 낮다. 더군다나 검증하다가 문제가 생겼다고 하면 그것은 툴이 만들어낸 중간 산물인 사람의 눈으로 쉽게 이해하가 힘들 게 되어버린 verilog를 건드려야 된다는 말인데, 이것은 말이 안된다. 

##### 기술하는 입장에선 C++가 다소 모호한 부분이 있으니 verilog가 차라리 낫다 생각하게 된다. 그러나..

tool이 바보가 아니기 때문에 개발자의 어설픈 기술 내용도 스스로 파악해서 최적의 resource만을 사용하게 한다. 이게 시스템의 규모가 작으면 의심해서 하나하나 다 따져볼 수 있겠지만, 덩치가 커지면 하나 하나 사람이 파악해서 확인한다는 것은 불가능에 가깝다. 구현해야 하는 기능의 복잡도는 계속해서 증가하고 리드타임은 짧아지고 있는데, 옛날 방식을 고집해야 할 이유가 없는 것이다.

##### SystemC 반드시 써야되는 겁니까?
   
SystemC는 내가 보는 관점에서는 verilog를 C화하려고 했던 시도인 것 같은데, 버전이 올라가면서 기존의 것들과 중복되는 것도 많아지고 애매한 것들도 많아져서 오히려 간결하기 이를데 없는 verilog만도 못해졌다고 본다. systemc를 검증에서도 사용하는데 그런 면에 있어서도 perl과 verilog가 결합된 system verilog가 훨씬 더 깔끔하다.
    
HLS에서 system C의 역할은 verilog와 C 사이의 연결부에 잠깐 쓰일 수 있는 정도라고 본다. 무슨 말이냐면 어차피 HLS의 결과물은 verilog이고 그것으로 synthesis도 하고 simulation도 하는 것이기 때문에 tool이 기본적으로 들고 있는 자원들은 전부 verilog 혹은 그와 관계된 것들이다. 개발자는 그 세계에 C/C++을 들고 들어가는 입장이니까 어느 부분에서는 중간단계가 존재해야 되는데 그게 systemC가 되는 것이다.

더 엄밀히 말하자면, C/C++로 의미상 verilog와 1:1 대응하게 프로그램을 작성할 수 있지만, verilog와 1:1 대응하는 예약어의 역할을 해야 하는 게 필요하고 (이를테면 입출력(clk, rst 전부 포함)신호) 그때 systemc를 쓰게 된다. 나머지 부분은 C/C++로 작성해도 무방하다. 어차피 개발자는 C/C++ 세계에서 검증을 해야되고 그 검증된 결과물을 들고와야 되니까 그것을 모조리 systemc로 바꾸는 것은 어찌보면 무의미한 일이다. 이 과정에서 오류가 생길 수도 있고 그렇게 한다고 해서 HLS tool이 더 좋은 결과물을 내는 것도 아니기 때문이다. 애초에 그럴 거였다면 verilog로 쓰고 다른 tool을 이용해서 최적화를 꾀하는 편이 맞다.

다만 C/C++를 사용하더라도 HDL를 써내려가듯 하면 더 좋은 결과를 얻게 되고, 알고리즘 자체가 잘 정돈되어있지 못한 경우라면 어떻게 노력해도 좋은 결과라는 게 나올 수가 없다. 또, STL 같은 것들은 제대로 지원이 안되니까 쉽게 생각해서 verilog로 작성하기 곤란한 것들을 C로 작성해서 rtl로 구현하는 경우에 쓰는 거라고 봐야 된다.

따라서, 중간단계인 wrapper를 하나 만들어두고 C세계와 HDL세계를 연결하게 하면 보다 손쉽게 작업할 수 있다고 본다.

##### Floating point arithmetic 지원됨?

verilog에서는 floating point처럼 애매한 (딱 떨어지지 않는) 수를 다루지 않는 대신 C에서는 쓸 수 있는데, HLS의 경우는 tool에 따라 지원 여부가 결정된다. floating point 연산을 하는 instance를 synthesize가 가능한 경우에는 허락이 된다. 물론 float/double을 쓸 수 있다는 게 아니라 별도 type으로 지정해주면 사용이 가능하다. 툴에 따라 CORDIC을 쓰는 cos/sin도 합성할 수 있고 sqrt, exp 등등 다 쓸 수 있다. 

##### 내 생각 ++

이렇게 좋은 데도 사용하지 않는 이들은 이 툴을 못 미더워 하고 전통의 프로세스대로 가지 않으면 불안해 하는 관리자가 많아서 그런 것 아닐까 한다. 이쪽 사업이란 게 원하지 않게 큰 버그가 생기면 대박터지는 것인데다 칩이 나간 후라도 쉽게 디버그가 가능해야 한다는 점이 있다. 사람 좀 더 쓰고, 시간도 더 쓰고, 그렇게 칩 공간을 좀 희생하더라도 추후의 디버그 여지를 두는 것이 장기적으로는 낫다는 계산이지 싶다. 