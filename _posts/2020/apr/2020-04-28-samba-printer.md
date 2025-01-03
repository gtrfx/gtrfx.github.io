---
title: "samba printer 붙여보기: pdf 인쇄"
tags: [samba, smb, cups, pdf]
layout: post
author: "Keith"
---

살면서 참 다양한 프린터를 써보고 살았지만, 어느 시점에 이르러서는 pdf printer이외에는 거의 쓰지 않는 것 같다. 종이를 아끼기 위해서라기 보단 뭔가 인쇄해놓은 뭉치를 들고 다닌다는 자체가 거추장스럽고 뭐랄까 '왜 이러고 있지?' 싶은 생각이 들어서 그런 것 같다. 지금도 책상위에 여러 가지 자료들을 엄청나게 인쇄해놓고 그걸 플래스틱 파일이 끼워놓는다거나 마치 대단한 장서라도 되는 양 관리하는 사람들이 있다. 나로선 잘 이해가 되지 않지만, 그 사람은 그것으로 자신의 삶의 재미를 찾는 것이니 내가 뭐라할 것은 못되지 싶다.

심지어 pdf로 만들어놓은 것이라도 시간이 조금만 흐르면 신선도가 떨어지는 것으로도 모잘라 내용자체가 유물이 되어버리는 세상이라 1-2년 전에 찍어둔 것이라면 도무지 의미없는 짓이 되고야 만다. 그러니 책의 형태로 자신의 생각을 정리해서 출판하는 이들은 얼마나 대단한 이들일까 싶은 생각도 든다. 내가 작성한 것은 조금만 지나서 다시 읽어도 '왜 이렇게 썼지?' '이건 뭐하러 적었지?' 싶은 게 허다한데 말이다. 

pdf 인쇄가 요즘엔 대부분의 OS에서 지원이 된다. 예전엔 MacOS에서만 되었고 여기선 print to pdf가 아니라 프린터 창이 뜨면 save as pdf 뭐 이런 식이었던 것 같다. 내가 MacOS로 넘어와서 '너무 좋다' 생각했던 것 기능 중의 하나가 이것이었다. 당시에도 윈도우에서도 이렇게 할 수는 있었지만 몇 단계를 거쳐야 했기 때문에 불편하기 짝이 없었고 뭔가 그 소프트웨어가 하는 짓이 믿음직스럽지가 않았다. 

쉽게 말해서 GNU쪽에 있던 소프트웨어를 가져다가 윈도우쪽으로 포팅해서 나온 것이라 그랬는데, 시간이 아주 오래 흐르고 보니 윈도우즈에서도 pdf printer를 직접적으로 지원하기에 이르렀다. 그런데 최소화 크기로 만들어져서 나오는 윈도우즈10에는 이런 기능들이 죄다 빠져있어서 또 사람을 번거롭게 만든다. 물론 설치 후의 풋프린트가 2GB 밖에 안되는 장점을 누리면서 이런 소리하면 좀 곤란하긴 하지만.

그래서 할 수 있는 짓은 호스트OS에 pdf printer를 설치하고 이것을 윈도우즈 쪽으로 samba를 이용해서 share하는 것이다. 이게 뭐 뻘짓하는 거냐 할 수 있는데, 어쩔 수가 없다. 급하면 이렇게라도 해야지. 

최소화용 버전으로 돌고 있는 윈도우즈에는 자체 스풀러 기능도 꺼져있는 상태라 잘못하면 samba에 프린터를 제대로 설치해놓았지만 윈도우즈에 붙이지 못하는 경우가 생긴다. 왜냐면 에러 메시지가 애매하게 적혀있어서 서버쪽의 스풀러가 이상하다는 건지, 아니면 로컬의 스풀러가 이상하다는 것인지 갈피를 잡을 수가 없으니까 말이다. 인터넷을 아무리 검색해도 이런 얘긴 찾을 수가 없다. 왜냐면 다들 정상적인 버전의 윈도우즈를 쓰고 있으니까 그럴 것이다. 그런데 정상적인 윈도우즈 10의 풋프린트는 불필요하게 크니까.

정리하면
- 최소 설치 사양의 윈도우즈는 자체 스풀러 꺼져있고, IPP 서비스 추가를 할 수 없다. 따라서 서비스 동작 여부를 찾아내서 켜주고 서버에서는 samba로 share해야 한다.
- samba 서버가 cups를 붙이는 것은 매우 간단하다. 그냥 일반 프린터 공유하듯 몇 줄 써넣으면 끝난다.
- 윈도우즈에서 프린터를 설치할 때 드라이버를 달라고 하는데, 대충 post script를 지원하는 것 아무거나 골라서 쓰면 된다.

좀 웃긴게 네트워크 프린터라고는 하지만 pdf 인쇄용이라 결과물을 클라이언트 쪽으로 다시 돌려줄 것 같지만, 그렇지 않다. 자체 스풀링 폴더에 쌓아놓는다. 쉽게 말해서 프린터가 모여있는 방안에 있는 어느 프린터 위에 인쇄되어 놓여있으니 알아서 가져가라 라는 것과 같다.

나한테는 이런 뻘짓거리가 하루에도 수없이 발생한다. 내가 잘못된 것인지 아니면 세상이 이상한 것인지 왜 이렇게 정신없이 하는 것도 없이 바빠야 되는지 잘 모르겠다. 