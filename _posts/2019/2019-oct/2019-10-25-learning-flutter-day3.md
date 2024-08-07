---
layout: post
title: "Flutter를 배워볼까?: Day 3"
image: https://venturebeat.com/wp-content/uploads/2019/02/google-flutter-logo-white.png?w=578&strip=all
tags: [flutter]
author: "Keith"
---

Flutter에 대해서 웹 검색을 해보니 또 실력자들만 몰래 암암리에 공부/실전 적용 중인지 별로 걸리는 게 없다. 걸려봐야 고작 피상적인 것들, 어디 가서든 얻어 들을 수 있는 것들 그런 것들이다. 그냥 플러터 커뮤니티에 가입해서 열심히 게시판 읽고 따라다니는 게 빠른 길이지 싶다.

dart라는 언어에 대해서 많이들 얘기하고 있는 것 같은데, 그냥 java + python (json, css, ...) 해놓은 것처럼 보인다. 기존 언어에 있는 요소를 조금씩 다른 예약어/형식으로 불러다 쓰는 것일 뿐 새로울 것도 대단할 것도 없어보인다. 그럴거면 그냥 기존의 언어하날 찍어서 할 것이지 왜 또 새로운 걸 만드느냐 하고 싶은데, 이런 저런 이유 (저작권?)가 있어서이지 싶다. 

dart라는 언어도 언어지만 flutter라는 프레임웍에 붙어서 돌아가는 것이니까 그 프레임웍이 제공하는 리소스가 뭐가 있는지 잘 알아놔야 빨리 개발할 수 있을 것 같다. 지금 시절의 언어라는 것은 기본 골격은 대개 유사한데 구체적인 부분이 살짝 살짝 다른 거라 언어 자체의 진입장벽보단 (타인이 만들어놓은) 프레임웍에 익숙해지는 것이 문제라고 본다.

옛날 사람의 입장에서는 언어를 새로 배우면 뭔가 기초부터 해야하는 거 아니냐 하면서 무슨 연산법칙부터 들여다보는 경우가 있는데, 그게 아니라 이미 만들어져있는 class + property 같은 것들이 뭐가 있는지 알고 대충 앱의 뼈대가 어찌 되는지 파악하면 나머지는 그때 그때 메뉴얼/help 찾아보며 개발하게 되는 거란 말이다.

앱의 구성을 보면 

main이란 함수가 Widget class를 불러내는 것으로 되어있고, Widget이란 게 Stateless/Stateful로 나뉘어지는데, 이름 그대로 상태를 가지고 있는 위젯 클래스 이냐 아니냐 로 되어있고 여기서 보면 클래스 자체를 함수처럼 부르고 클래스는 대부분 탬플릿 클래스라 데이터 type에 관련없이 돌게 되어있다. 그 데이터 type이라는 것도 DB 같은 데서 읽어오는 레코드(record/struct/...) 타입을 말하는 것이다. 

그러니까, 대개의 모바일 앱이라는 것들은 위젯이나 그래픽 형태를 갖고 그런 레코드의 리스트를 보여주고 편집하게 하는 기능이 대부분이라는 것을 단적으로 보여주는 것이라고 볼 수 있겠다. 여기서 모바일 앱을 만드는 사상(철학)을 읽게 되는 것이다. 플러터는 그런 일을 잘 할 수 있게 설계되어져 있는 것으로 보인다. 

대부분의 웹/모바일 프로그래머들은 그런 데이터들을 보여주고 조작하고 하는 일들을 주로 하고 있으니까 어찌보면 옛날 사람인 내가 하듯이 복잡한 계산 엔진 (쉽게 말해서 그냥 플러긴의 형태로 따라붙는 블랙박스) 따위엔 별로 관심이 없겠구나 싶기도 하다. 그저 그 모듈이 정해진 기능만 하면 그만일 뿐, 또 문제가 되면 거기다 불평불만하면 그만인 것이고 말이다. 

따라서 일상에 필요한 문제를 database handling 또 search의 문제로 해석해서 그것을 풀어내게끔 만들면 성공한 앱이 되겠구나 싶다. 

너무 뻔한 건데 이렇게 얘기해놓으니 어째 더 내가 바보라는 것을 더 잘 드러낸 것 같다. 

사실 크게 성공한 페이스북이란 것도 사실상 그런 database + 모바일의 상호작용인 것이고, 흔한 웹쇼핑이니 VOD도 마찬가지인 것이고 실시간 채팅 앱이나 죄다 데이터 베이스와 모바일이 상호작용하는 일만을 하는 단순 기능의 앱인데 그개 일상 생활에서 도움이 되는 것은 이 모든 일이 일어나게 하는 것의 주체가 사람이기 때문인 것이다. 

생각해보면 내가 하던 일은 모든 일을 수행하는 자체가 컴퓨터였기 때문에 나에게 직접적인 수익이 되지 못했구나 싶다. 내가 database를 다룰 줄 모르거나 이 쉬운 모바일앱을 못 만들어서가 아니라, 한번도 일반 사람들의 문제를 이런 식으로 해결하는 것이 돈이 되는 일이니까 해봐야겠다 생각하지 않았기 때문에 이렇게 살고 있구나 하고 말이다.

