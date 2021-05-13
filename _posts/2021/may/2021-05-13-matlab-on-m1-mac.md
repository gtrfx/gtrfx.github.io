---
title: "Matlab 2020b on an M1 Mac"
layout: post
tags: [matlab]
---

요약해서 말하면,

1. 그냥은 설치 안됨. mathworks에서 나눠주는 2020b update 3부터 설치가 가능함.
2. 어차피 x86으로 빌드된 것이라 rosetta로 돌아가는 것이다.
3. 신기하게 AVX512 명령어가 들어있는 라이브러리도 잘 동작함. mkl도 동작함.
4. blas/lapack을 m1용으로 컴파일 한 것 (brew로 가져옴)으로 대체한 것으로 사용해도 잘 동작함

별 것 아닌 것처럼 보일 수 있는데, x86으로 빌드된 것을 rosetta로 돌리면서도 m1용으로 build된 shared library를 같이 쓸 수 있다는 이야기다. 

성능? m1용으로 최적화되질 않아서 그다지 좋지 못하다. 특히 graphic 점수가 낮게 나오는데, 대부분 mac에서 돌리면 graphic 점수가 낮게 나온다. 어쨋든 잘 쓸 수 있다는 것에 위안 삼고 이상.

