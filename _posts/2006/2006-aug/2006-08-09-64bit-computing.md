---
layout: post
title: "64bit computing.."
author: "Keith"
---


x64 edition을 Xeon 3.2G Dual Core 머신에 설치하고, 여기에 걸맞는 x64 컴파일을 해봤다.

VisualStudio를 쓰는 사람이라면 설치시에 x64 compiler 및 관련 툴 설치를 해주어야 x64 컴파일이 가능하다.

컴파일러 옵션에 보면 EM64T를 선호하는지 AMD64를 선호하는지 /favor라는 옵션이 붙어있고, link의 경우 해당 모듈이 x64 모듈인지 x86 모듈인지 구별하는 /MACHINE이라는 옵션이 붙는다.

x86 머신과 같이 SSE, SSE2 지원을 묻는 옵션은 없어졌다. 그도 그럴 것이 x64를 지원하면 SSE/SSE2는 자동 지원이다. 최근 CPU는 SSE3, SSE4 (Xeon 5100이상)까지 지원된다.

좀 아이러니하긴 한데, 컴파일시에 잘못은 없는 것 같은데 어플리케이션에 따라 x64 로 컴파일한 것이 동일한 OS 상에서 x86 만 못한 성능을 보이는 것들이 있다. 인터넷을 열심히 뒤져보았는데, 아직 x64 환경에 익숙해진 분들이 없어서인지 이런 얘긴 아직 안올라오는 것 같다. 



