---
layout: post
title: "CMake란 무엇인가?"
tags: [cmake]
author: "Keith"
---

cmake를 마주해본 적이 있던 사람이면 이게 무슨 역할을 하는 것인지 대충은 알 것이다.

쉽게 말해서 내가 어떤 플랫폼에서 작업을 하든지 크게 구애받지 않는 조건에서 Makefile을 만들어주는 응용 프로그램이다 라고 보면 된다.

cmake라고 해서 전부 다 알아서 해주는 것은 아니고 CMakeLists.txt라는 설정 파일을 만들어주어야 그에 맞춰서 Makefile을 만들어준다. 이 형식은 매우 쉬운 편이라 Makefile을 직접 작성하는 것보단 쉬울 수 있지만, 내가 예상 되는 모든 경우에 대해서 다 테스트 해보지 않고서 이게 모든 가능한 조건에 대해서 다 동작할 거라고 볼 수는 없다.

무슨 말이냐면, 적어도 내가 배포하는 이 소프트웨어가 쓰이게 될 환경에 대해서 적어도 전부 다 테스트해보지 않고선 모른단 말이다. 또 cmake가 제공하는 기능이 모든 플랫폼에서 모두 다 쓸 수 있는 것도 아니다.

결국, 실제적으로 여러 가지 제한이 가해지고 내 CMakeLists.txt도 조건문도 많이 붙여야 되고 Module이라고 해서 일종의 environment detecting function들을 만들어서 써야 하는 경우도 있다.

물론 모든 기능을 다 쓸 수 있는 환경은 linux/unix 환경이긴 하지만 Windows에서도 돌고 Visual Studio의 solution/project file까지 만들어내는 기능도 있다. 제대로 잘 안되서 문제이긴 하다만.

결국, 해야될 노가다는 Makefile로 만들어주거나 cmake를 하거나 다 하게 되어있단 거다. 

다음엔 autotools에 대해서 살펴보자.