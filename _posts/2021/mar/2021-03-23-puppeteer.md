---
title: "Puppeteer.."
tags: [nodejs, puppeteer]
---

아마도 사용하는 사람들이 제법 많지 싶다. 뭐하는 거냐면 크롬 웹 브라우저를 원격조종하는 라이브러리? 정도로 보여진다.

쉽게 말해서 웹을 통해서 하는 작업들을 자동화하겠다 하면 마우스를 이용하는 자동화보다 훨씬 짧고 간결하게 그리고 멋지게 만들 수가 있다.

headless chrome이라고 해서 웹브라우저가 화면에 뜨지 않은 상태에서도 자동화작업을 할 수 있는 것이니까 웹으로 어디가서 데이터를 긁어오겠다거나 뭔가를 꾸준히 자동 업로드를 시키겠다든가 아주 다양한 작업에 응용할 수가 있다. 

아주 예전에는 웹에서 데이터를 긁어오겠다 하면 link를 recursive하게 뒤져서 그 html 문서를 가져와서 같은 폴더구조로 만드는 것이었는데, 사실 어디에 로그인해서 뭔가를 가져오는 짓은 하지 못했다. 지금은 wget 같은 게 그런 일은 훨씬 더 잘해낸다. 

그러나 이런 자동화 툴들은 login을 하는 건 그냥 아주 당연한 것이고 웹 상에서 일어나는 여러 가지 일들 (쿠키를 받고 그 쿠키를 다음 과정에 연동하는 등등)까지 멀쩡한 브라우저를 통해서 자동화를 시키는 것이라 이를테면 외부에서 로보트가 들어와서 자동화된 일을 하고 갈까봐 이런 저런 장치들 다 만들어놨다고 하더라도 어렵지 않게 해낼 수가 있다. 

물론, js의 작성자는 모든 과정을 수동으로 흝으면서 html 및 javascript도 읽어내야 하는데, chrome이 웹 디버깅을 위해서 워낙 잘 만들어졌기 때문에 이 또한 전혀 어렵지 않다. 이를테면 turbotax에 내 은행계좌를 알려주면 알아서 세금 파일들을 가져오는 일과 같은 과정의 일을 해낸다고 볼 수도 있다. 별로 쓸 일은 없겠지만, 월급 날이라든가 돈이 빠져나가는 날 등등 은행에 온라인으로 접속해서 재정상태를 확인하고 문제가 있으면 메일을 던진다거나 하는 등등의 일도 자동화가 가능한 것이다.

생각보다 매우 편리하다. 복잡한 과정으로 로그인해야 하는 사이트의 접속은 물론 파일의 업다운 정도는 그냥 껌이다. 아마도 그 옛날 문제가 되었던 사건들의 배후에는 이것을 이용한 로보트들이 있었지 싶다. 일단 하나의 뼈대를 갖춰놓고 여기 저기 로그인 하는 변종들만 만들어놓으면 같은 게시물을 여기 저기 복붙하거나 고스트 계정들을 가지고 게시판을 도배하는 것들은 일도 아니다 싶다. 

쓰임새는 많을 것 같은데, 개인적인 쓰임새가 없다는 것이 흠이다. 내겐 쓸 일이 없다ㅠ.