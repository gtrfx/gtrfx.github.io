---
title: "mex 만들어 쓰기"
tags: [mex, MATLAB]
image: https://research-it.berkeley.edu/sites/default/files/styles/large/public/matlab-logo.jpg?itok=Zse5goL-
layout: post
author: "Keith"
---

헬스 초보자들을 '헬린이'라고 부르듯 엔지니어 초년병들을 '엔린이'라고 불러야 맞지 싶은데, 어쨌든 SoC 만드는 회사에 있는 입장에서 '엔린이' 고객들이 원하면 뭐든 만들어줘야 하는 의무 아닌 의무가 있는 관계로 mex 같은 걸 만들어줄 때가 있다.

왜 명확한 API도 다 있고 이런 저런 라이브러리도 다 빌드해서 갖다주는데 그것도 모잘라서 mex냐 할 수 있는데, 고객이신 엔린이들이 원한다는데 어쩔 도리 있나. 

mex가 뭔지 모르는 사람이 있을 수 있으니 대충 설명하자면, C/C++로 인터페이스되는 외부 라이브러리? 라고 보면 될 것 같다. 그 라이브러리는 뭘로 짜여졌든 바이너리 상태로 있고 그게 C/C++로 MATLAB과 연계되도록 되어있다. 그러니까, 외부에 잘만들어진 library가 있다든가 C/C++로 잘 짜여진 뭔가가 있다면 그것을 빌드해서 mex라는 형태로 두고 MATLAB에서 함수처럼 불러서 쓰는 것이다.

이게 무슨 장점이 있냐고? 일단 복잡한 기능을 내가 만들지 않고 남이 만든 것을 가져다 쓸 수 있고, MATLAB으로 짜넣으면 느려터진 경우엔 C/C++로 만들어서 마치 가속기처럼 불러다 쓰게 되는 것이다. 

SoC 회사에서 왜 고객들한테 이런 걸 만들어주느냐 할 수도 있을 것이다. SoC 안에 들어간 가속기를 MATLAB에서 불러다 쓰고 싶으신 엔린이 고객들이 요구하신다. 왜 이런 건 안 만들어주냐고. 해줘야지 뭐.

언뜻 생각하면 MATLAB이란 플랫폼이 모든 OS에 제공되고 있으니까 mex도 어느 OS에서든 일단 빌드하면 다른 OS의 matlab에서도 돌겠거니 생각할 수 있는데, 그렇지 않다. mex도 한번 제공하려면 여기 저기서 빌드해줘야 된다. 주로 윈도우를 쓰시는 엔린이들이 많으니까 윈도우로 먼저 만들어드리고 linux용으로도 만들어드린다. MacOS용으로 요구하는 엔린이들은 없는 것으로 보면 대개 고객님의 회사가 개발자들에게 맥을 제공하는 넉넉하고 인심좋은 회사는 아니로구나 알 수 있다.

그러면 mex는 어떻게 빌드하느냐?

먼저 MATLAB에서 대놓고 사용할 C/C++ 컴파일러를 지정해야 한다. 세상이 gcc/g++ 환경으로 사실상 표준화가 되어버렸으니까 사실 이쪽이 선호되는데 MATLAB에 붙어서 온다는 lcc라는 것도 있고 윈도우즈에서는 MSVC를 쓸 수도 있다. 고객의 요청이 다양한 경우라면 무조건 gcc/g++로 가야할 수 밖에 없다. 그래야 플랫폼에 크게 구애받지 않고 여기 저기서 빌드할 수 있으니까. 윈도우즈에서는 gcc/g++ 유사환경인 MinGW가 지원이 된다. 물론 MacOS에서는 clang으로 설정이 된다. 사용자가 원하면 fortran과도 연결이 된다. 옛날 사람인 내 입장에서 fortran이 지금도 있나 싶은데 수학관련 소프트웨어에서는 아직도 gfortran을 불러다 빌드가 되고 있는 걸 보면 좀 신기하긴 하다. 

그 다음엔 C/C++ 파일을 matlab 상에서 빌드해야 한다. MATLAB과 C/C++을 연계해주는 몇 가지 함수가 정의되어있는데, 그것을 header로 불러서 기존의 C/C++ 함수 혹은 외부 라이브러리와 연결해주는 interface (wrapper)를 짜넣어주면 된다. 거의 모든 변수들은 double로 넘어가고 matlab의 것들은 string의 형태로 주고 받는다고 보면 된다. 

언뜻 봐도 엔린이들이 다루기 편한 MATLAB을 쓸 수 있게 하면서도 속도를 올려보겠다고 하는 일인데 MATLAB과 외부 function과 데이터를 주고 받는 과정에서 시간 다 까먹는 것 아닌가 하는 생각이 저절로 들게 된다. 어쨌든 이런 지경이라도 '엔린이'분들의 입김이란 걸 무시할 수 없으니 이런 방법으로라도 여기 물건에 길들여지게 해야 하는 입장에서 하란 대로 다 해주는 게 급선무인 것이다. 

내 개인적인 경험으로는 MacOS에서의 빌드가 가장 깔끔했다. 그런데 아무도 요구하지 않으니까 가장 먼저 테스트해보는 용도로 해본다. 일단 Mac에서 작업하면 불필요한 노동을 최소한으로 가져갈 수 있기 때문에 여기서 자동화까지 대부분 완료시켜놓고 나머지 OS에서 돌려주면 된다. 

SoC회사에서 이런 짓을 하는 게 일반인의 시각에서도 '아 그럴 수도 있겠네' 정도니까 회사 안에서 봐도 '나의 role은 뭔가?' 싶을 정도로 별에 별 다양한 노가다는 다 하고 있는데, 사실상 아무런 광은 나지 않는 일이다. Fabless인 반도체 회사에서 가장 광나는 일은 실제로 구현하는 사람들일 수 밖에 없다. 더 크게 보면 사실 공사장 인부들보단 공사 잘 따오는 놈들이 공이 커보일 수 밖에 없다. 어쨌든 이 바닥에선 설계자라는 입장은 공사장 인부처럼 일하는 것은 맞는데 공사장에서 딱 보면 공구리를 치거나 미장을 하지도 않고 목수도 아니면서 눈에 잘 안 뜨이게 바쁘기만 하고 실제로 머리만 많이 써야 되는 광안나는 입장이 되는 것이다. 그냥 RTL이나 검증처럼 납기 맞춰서 진도 빨리 마치고 빠져 있는 이들이 젤 유리하다. 이 사람들이야 어디서 어떤 공사를 하든 꼭 필요한 사람들이니까 공사판이 벌어지는 동안엔 일이 끊어질 일 없고. 

OS 여기저기 옮겨니며 일할 이유도 없고 PPT에 각종 그림 다 그리고 메뉴얼 작성하고 고객 요구까지 다 들어주고 RTL이랑 붙어서 씨름하고 스펙쓰고 특허쓰고 이런 저런 모델이란 모델은 다 만들어주고 실험해주고 ...

생각해보면 예전엔 차타고 필드 돌면서 노트북으로 로그도 받고 들어와서 분석하고 어디가 문제인지 사람 모아다가 고쳐달라고 해야되고, 그것도 모잘라서 고객사 출장가서 필드 돌고 고객사 버그도 잡아주는 일까지 했으니 이것은 어찌보면 좀 양반이라고 봐야지 싶다. 남의 잘못을 지적하려면 근거가 충분해야 되니까 돌아와서 밤늦게 같은 실험도 해줘야한다. 세상이 머리 더 많이 쓰고 힘든 일 더 많이 했다고 그만큼 보상을 해주는 시스템이 아니라는 것을 잘 알고 있으니까 불평은 하지 말아야지. 

그런데 가끔보면 '...해서 못한다', '... 해줘야지 할 수 있다' 하면서 거의 태업하며 시간 잡아먹으며 버티는 놈들이 부러울 때가 있다. 그냥 내가 일복이 많구나 할 뿐인데, 오래 일 할 수 있을지는 모르겠다.