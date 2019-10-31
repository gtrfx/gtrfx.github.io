---
layout: post
title: "Decade/Octave"
---


Filter의 response의 특징을 얘기할 때 cut off frequency 말고도 slope(기울기)를 얘기하는데, 이때xx dB/decade 또는 xx dB/octave라고 얘기한다. 이것은 filter가 cut off frequency를 지난 영역, 즉 cut을 하는 영역에서 주파수에 따른 필터응답의 변화(기울기)를 나타내는 이야기다.




따라서 이 값이 크면 filter가 그만큼 sharp하다는 얘기가 된다. 즉, 1kHz를 cut-off frequency로 하는 low pass filter라고 하면 slope의 절대값이 클 수록 심하게 깎는다, 1kHz를 넘어서는 신호성분을 심하게 제거한다는 의미가 된다. 회로로 보자면 filter의 order가 높은, 수식으로 계산하자면 필터 다항식의 차수가 높은 필터가 되겠다.




여기서 decade와 octave는 무슨 의미를 가지고 있느냐 보자면, 주파수의 변화 폭을 의미하는데, 1 decade는 10배, 1 octave는 2배 차이를 의미한다. 그런데 이게 로그 개념을 가지고 있는지라 (주파수 값 자체도 엄청 크지만그 변화폭도 그 값의 로그 값으로 나타내는 것이 상대적으로 편하고 사람이 느끼기에도 그편이 훨씬 자연스럽다), 2 decade는 100배, 2 octave는 4배 차이가 되는 것이다.




따라서, 20 dB/dec하면 주파수가 10배 변하는데 필터(혹은 시스템의) 응답이 20dB 커진다는 것을 의미하고, 26 dB/oct하면 주파수 2배 증가에 대해 26dB 응답이 커진다는 것을 의미한다.




일반적으로 필터 다항식에서 필터응답 (amplitude)은 주파수가 x로 들어간 다항식의 n차 식이 된다. 기본적으로 1차 식이라고 하면 그 응답의 변화를 dB (20 log10 (amplitude))로 나타낼 때, 주파수가 10배 늘어날 때 출력도 10배 증가하는데, 그것을 dB로 표현하게 되면 20 dB/dec가 된다. Octave로 놓고 보자면, 6 dB/oct가 된다.




여기에 차수가 n이 되면 20n dB/dec 또는 6n dB/oct가 되겠지. 


