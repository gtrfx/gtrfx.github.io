---
title: "verilog와 synthesis"
tags: [verilog]
layout: post
author: "Keith"
---

요 며칠 verilog를 가지고 잘 놀고 있다. 

이것 저것 생각나는 것들도 만들어보고 합성하고 하다보니 얻은 결론은
- 기존 언어 대비 시간 개념의 차이에 재미가 있다.
- 융통성이 별로 없다.

시간개념의 차이는 좀 재미가 있다. 거의 대부분의 statement는 모두 동시 실행이 되는 것이라고 이해하면 된다. 다른 언어들처럼 위에서 아래로 가면서 차례차례 실행이 되는 게 아니다. 각각의 라인들이 필요에 따라 전부 로직으로 만들어지는 것이니까 그러하다. 일부러 순차적으로 동작하게 하려면 상태변수를 만들어놓고 1시에 뭐하고 2시에 뭐하고 이런 식으로 만들어줘야 하는데, 그게 더 귀찮다. 사고의 개념을 순차적인 (한번에 하나밖에 못하는) 개념에서 모두 '동시' '병렬'의 개념으로 바꾸면 생각보다 어려운 일도 빠르게 처리할 수 있는데 어렵게 생각했구나 하는 스스로의 어리석음을 깨닫게 된다.

verilog(다른 VHDL도 마찬가지)라는 언어는 정말 융통성이 없는데, 그것은 개개의 코드가 전부 칩안의 작은 부품들로 만들어져야 하기 때문에 뭔가 추상적이거나 그때 그때 달라요 식의 표현을 허락하지 않기 때문이다. 그런데 그 융통성 없음이 타 언어에 비해 너무 뚜렷해서인지 대략 2010년 정도부터 이 업계 사람들은 systemverilog를 기존 verilog에 더해서 사용한 것으로 보인다. systemverilog는 verilog에 비해서 엄청난 파격이 이루어지는데, 이렇게 얘기하면 마치 정해진 문법이라든가 형식이 완전히 확립되어 있는 것처럼 보여지지만 그렇지 않고 그냥 떠돌고 있을 뿐이다. 

그러니까 많은 것들을 만들고 검증해봐서 경험이 많으면 무조건 빨리 잘 만들 수 밖에 없다. 책이라고 나온 것들은 사실 기본 과정에 대해서 얘기하다가 끝나는데, 그것은 저자의 경험의 깊이가 그렇게 introductory한 수준에서 멈춰버렸기 때문이라고 나는 생각한다. 책의 대부분이 쓸데없는 배경이며 역사에 대해서 오래 얘기하고 또 전자회로/반도체 만드는 것에 대해서 떠들다가 중반부가 지나면 툴 얘기 좀 하다가 정작 실전에 관련된 얘기는 hello, world 에서 약간 더 나가거나 하는 수준에서 끝난다. 어차피 내가 책을 쓸 것도 아니고, 세상이 많이 변해서 이 분야에 대한 지식 수요도 별로 없을테니 그 얘기는 여기서 접기로 한다.

verilog라는 언어 자체가 융통성이 있다면 같은 개념의 모듈인데 파라미터만 바꿔서 확장하고 하는 식으로 빠르게 확장할 수 있었을텐데, verilog엔 그런 게 없다. 그런 이유로 systemverilog가 나온 것이겠지만. 툴의 경우도 지원의 범위가 달라서 어떤 툴은 systemverilog와 verilog가 혼용되어있어도 별 말 없는 경우가 있는가 하면, 어떤 툴의 경우는 칼같이 잡아내는 툴도 있다. 

세상이 좋아져서 simulation이 엄청나게 빨라졌다. 사실 다른 언어에 비해서 진화가 덜 되어서 원래 빨랐어야 되는 것이었는데 느렸다고 이해를 해야 맞을 것 같다.

비싼 유료 소프트웨어로 남아있던 덕택에 이들 EDA 툴들은 그 흔한 multi-thread도 하지 않는다. 엄청나게 복잡한 일도 single thread로 오래 오래 돌린다. 

어차피 그렇게 할배틱하게 만들어도 이 바닥은 공급처 다변화란 것도 없는지 업계에서 어느 정도 정평이 나 버리면 더 이상의 경쟁이란 게 되지 않는 것 같다. 그냥 한 방에 끝난다. 그러니까 좋든 나쁘든 계속 같은 제품만 쓴다.

결론? verilog로 좀 해보고 systemverilog로 실전으로 가면된다. 알아두어야 할 내용이 많지 않다. 어차피 이런 HDL은 제대로 만들지 않으면 결과 자체가 나오지 않기 때문에 엉터리 라는 게 있을 수 없다. 일단 잘못 찍어내면 엄청난 손해가 발생하기 때문에 검증도 엄청나게 철저하게 한다. 또 툴이 좋아서, 또 다루는 숫자 세계의 범위가 넓지 못하다보니까 언어 표현이 개판이었다고 하더라도 일단 제대로 만들었다면 최적화가 아주 잘된다. 

다른 컴퓨터 언어들은 처리 속도며 메모리 사용하는 것, 안정성 등등 개판으로 짜놓으면 최적화도 잘 안되고 느려터지지만 일단 결과는 나오게 할 수 있다.