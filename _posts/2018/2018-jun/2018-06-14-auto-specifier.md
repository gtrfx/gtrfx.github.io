---
layout: post
title: "auto specifier"
categories:
    - computer
author: "Keith"
---

역시 새로운 작업을 하면 할 수록 배우는 게 많다고나 할까?

C/C++를 오래 보아오고 있지만, auto라는 type specifier는 처음 본다. JUCE에 나온 예제들을 보다 알게 된 것인데, 

이게 C++11부터 등장한 것이라고 하니까 사실 생소할 수 있는데, 이미 나온지 7년이 넘은 거라 새롭다고 볼 수도 없을 것 같다. 

시중에 돌아다니는 컴파일러가 이것을 모두 지원하지 않는다. 웃긴 게 C++11부터 나온 것인데 현재 돌아다니는 컴파일러가 C++11도 지원하지 않는 버전이 꽤 된다. 사실 좀 보수적인 OS들은 gcc/g++도 상당히 낮은 버전의 것을 쓰고 있으니까 말이다.

어쨌든 이 type specifier는 그 자체가 뜻하듯 컴파일러가 알아서 type을 결정해주는 것이다. 귀찮게 프로그래머가 매번 type을 지정해주지 않게끔 말이다. 그러니까 애초에 어떤 값을 배정해주느냐에 따라서 컴파일러가 결정할 수도 있고 문맥에 따라 결정하기도 한다. 이를테면 그 변수가 참조하는 다른 변수의 type이 어떤 것인지를 보고 결정하는 것이다. 그러니까 프로그래머가 해야할 (귀찮은) 일은 점점 줄어드는 거다.
