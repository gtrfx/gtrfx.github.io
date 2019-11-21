---
layout: post
title: "Code signature invalid"
tags: [MacOS]
---

필요에 따라서 바이너리를 좀 수정해서 슬쩍 넘어가야 할 경우가 왕왕 있다. 지금은 AMD CPU 때문에 그렇다.

일단 디스어셈블리해서 코드를 대충 찾아보고 중요한 분기점에서 분기하지 않게 만들거나 분기 조건을 바꾸면 이게 가능하다. 사실 이게 젤 간단한 방법이다. 원인 해결은 할 수가 없으니 (커널을 패치하면 된다. 이건 좀 나중의 문제다.) 당장.

그래도 좀 괜찮은 OS라 그런지 code signature라는 것을 미리 밖에 세겨놓아서 내용물의 변경이 일어나게 되면 kernel이 이런 에러를 뿜으며 killed: 9 이란 메시지를 내보낸다. 

이럴 때 어떻게 해야되냐? code sign을 날리면 된다. 어떻게 하냐고? github.com/unsign에 가면 누가 올려놓은 게 있기도 하고 codesign이란 내부 유틸을 이용해서 제거해도 된다. 신기하게도 codesign은 architecture 마다 걸려있는 것을 알 수 있다. 예전엔 i386, ppc, x86_64 세개를 모두 지원했었을 수 있으니 그랬겠다 싶기도 하다. 지금은 i386이란 architecture는 지원하는 곳이 없어지고 있으니까 의미는 없다만.

원래 code sign이 되어있던 소프트웨어인데 그걸 날려버리면 알 수 없는 제작자가 만든 소프트웨어라며 귀찮게 만든다. 상관없이 열겠다고 하면 허락해준다. 이 다음엔 바이너리를 내 맘대로 변경해도 위와 같은 문제는 발생하지 않는다. 문제가 되는 몇 가지 소프트웨어를 patch 해봤는데 아직은 원하는 만큼의 결과는 나오지 않았다. Docker는 호환되지 않는 CPU라며 에러를 내던 것은 사라졌지만 helper install을 하겠다며 root password 입력하기 무한 뺑뺑이 중이고 MATLAB의 libiomp5.dylib은 여전히 계속해서 illegal instruction 또는 segmentation fault를 내고 죽는다. 외부에서 달리 제작한 libiomp5.dylib을 받아서 그냥 돌려주는 게 정신건강에 이로울 것 같다. 적당히 돌려봤는데 아직은 아무런 문제를 발견할 수 없었으니까 AMD Hackintosh에서도 잘 돈다고 할 수 있을 것 같다. 

