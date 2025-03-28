---
layout: post
title: "MinGW/MinGW64/Cygwin/..."
categories:
    - computer
author: "Keith"
---

잘 알려진 OS 3개를 매일 같이 이리 저리 부팅하면서 살다보면 리눅스와 맥오에스는 둘다 다 유닉스 기반이라 command line으로 동작시키는 애플리케이션은 사실 대동소이하고 linux에만 있는 것들도 macport 같은 것을 통해 빌드/배포되고 있어서 사실상 이 둘 간의 장벽은 거의 없는 것처럼 느껴진다. 돈과 인적 자원이 풍부하게 투여되는 MacOS를 주로 쓰다보면 Linux가 더 답답하게 느껴질 수 있다. Linux는 Linux대로 하드웨어를 가리지 않고 거의 모든 임베디드 하드웨어에서 표준이 되고 있으므로 이둘의 발전 방향이 같든 같지 않든 컴퓨터와 많이 가까와지면 질 수록 이쪽 환경이 편하게 느껴질 수 밖에 없다.

사실 윈도우즈는 요즘 같은 상황에서 구태여 마이크로소프트의 GUI 환경에 너무 익숙한 게 아니라면 고집할 이유가 없을 뿐더러 답답하고 골치 아픈 부분 (새로운 하드웨어가 자주 붙거나 하는 경우)가 많아서 자연스레 멀리하게 된다. 특히나 버릇없이 시도 때도 없이 업데이트하겠다고 메인 화면에 떡하니 다이얼로그 창을 띄워대는 걸 보면 어쩔 땐 살기충만한 느낌도 들 때가 있다. 어떤 애플리케이션에서 작업을 하고 있었다 치면 이 창이 떠오르면서 커서 주도권까지 빼앗기게 된다. 조용히 화면 구석에서 작게 알림을 띄워줘도 불편한 기분이 드는 마당에 말이다. 

본론으로 돌아와서 MinGW/MinGW64/Cygwin은 사실 윈도우즈 상에서 유닉스 기반 환경을 만들어주고 유닉스에서 구동되는 앱을 빌드할 수 있도록 도와준다. 그러니까 일반적인 C/C++ 문법만 따라서 작성해놓은 프로그램이면 윈도우즈에서 동작시킬 수 있다. 구태여 이런 게 3가지나 되는 것은 (실제로 몇 가지가 더 있다) 사용자 입장에선 선택과 갈등을 하게 만드는 빌미를 주므로 짜증이 날 수 있는데, 선택권이 넓다는 것은 좋은 것이라고 생각하는 것이 나을 듯 하다.

큰 차이는 MinGW 계열은 이 안에서 빌드한 프로그램이 별 다른 외부 DLL의 의존 없이 그 자체로 마이크로 소프트웨어의 DLL에만 의존한 상태로 실행이 되게 할 수 있는 반면 Cygwin은 그 자신의 DLL에 의존된다는 차이가 있다. 따라서 Cygwin으로 프로그램을 개발해놓으면 cygwin이 설치되지 않은 곳에서 실행할 수 없게 된다. 그러나 object 사이즈가 줄어들고 지원할 수 있는 소프트웨어가 매우 폭넓다는 장점은 있다.

그러나! 리눅스로 멀티 부팅할 수 없는 지경이 아니라면, 또 윈도우즈밖에 쓸 줄 모르는 지경이 아니라면, 또 윈도우즈밖에 쓸 수 없는 사람에게 소프트웨어를 제공해야 하는 입장이 아니라면 그냥 리눅스나 맥오에스를 쓰는 게 정신 건강상 좋다. 

MinGW/MinGW64/Cygwin 상에서 실행할 수 있는 일들 (대개 소프트웨어 빌드)을 윈도우즈와 리눅스/맥오에스에서 시켰다고 보면 리눅스가 가장 빠르고 그 다음 맥오에스, 그리고 비교도 안되게 느린 윈도우즈의 순으로 실행이 된다. 리눅스가 다른 것을 다 떠나서 맥OS의 mail app, preview, finder 정도의 기본 앱만 착실히 제공된다고 하면 맥OS도 과감히 버릴 수 있을 것 같다. 

다시 말해 같은 프로젝트를 빌드하더라도 그 일하는 모습을 보면 윈도우즈에서는 봐주기가 괴로울 정도로 느리다. 윈도우즈만 쳐다보고 있다면 참을 수 있겠지만, 같은 일을 리눅스에서 돌려봤다면 도무지 이 OS 환경(윈도우즈)에는 무슨 문제가 있어서 이렇게 느려터진 것일까 하게 된다. 

게다가 이젠 거의 모든 OS에서 기본적으로 제공하고 있는 python/perl/ruby/git 같은 것도 뭐하나 그냥 제공되는 게 없다. 급하게 뭔가 해야할 것 같아서 찾아보면 있는 게 하나도 없다. 그러나 OS 용량은 무지막지하게 크면서 별 일 하지 않아도 계속해서 늘어나고 계속해서 업데하면서 또 늘어난다. 이거 미친 거 아냐? 싶지만 늘 그렇다.
