---
title: "초고속 연산기 프로젝트..1"
tags: [floating point]
---

일반적인 행렬연산을 하는 연산기를 가정하면 모양새는 다음과 같아진다. 그러니까 현재 입력 두 개의 곱을 더하는 방식으로 가는 거다.

복소수 연산은 기본이니까 대개 이렇게 된다.

R0= A C - B D 

R1= A D + B C 

그러니까 복소수의 곱 하나를 하기 위해서 4개의 multipler를 쓰고 2개의 adder를 쓰는 거다. 

이것을 2개를 더 만들어 놓으면 하나의 unit은 2개의 복소수 입력에 대한 곱의 합을 얻을 수 있게 된다. 생각보다 매우 pricey하다.

이 때 정확도를 늘려주기 위해서 mentissa의 크기가 좀 더 큰 unit 한개를 더 만들어놓자.

[lp1] + [lp2] --> [hp] -->