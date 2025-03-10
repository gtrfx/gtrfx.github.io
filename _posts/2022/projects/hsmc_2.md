---
title: "행렬 연산기를 만들어볼까?...2"
tags: [matrix, linear algebra]
layout: post
author: "Keith"
---

행렬연산기의 설계/구현이 구조적이면 좋겠는데, 사실 그것이 구조적이고 모든 부분이 딱딱 들어맞는 그런 것이면 좋겠지만 사람이 하는 일이라는 것이 한방에 완벽할 수 없고 수 없이 많은 시행착오와 개선을 거칠 수 밖에 없으니 문제해결을 위해서 생각 나는 것들을 어떻게든 조합하여 일단 시작을 하고 차후에 개선 방향을 찾아가는 것이 나은 방법이라고 생각한다.

사실 행렬 연산기라고 해서 복잡할 게 없고 단지 그렇지 않은 연산기와의 차이점을 구분해보자면 다음의 문제를 어떻게 고려했느냐의 차이점이 존재할 것이다.

1. 메모리에 데이터가 어떻게 정렬되어야 하는가, 또 정렬된 메모리를 어떻게 읽어와서 처리하는가?
2. 행렬 연산의 특이성을 이용하여 어떻게 하드웨어적인 요소를 최소화하면서도 높은 정확도와 처리 속도를 얻을 수 있을까?

더 많은 요소들을 고려해 볼 수 있겠지만 가장 큰 것은 위 두 가지가 아닐까 한다. 사실 위 두 가지만 잘 만들어놓으면 사실상 전부를 다 해냈다고 봐도 과언이 아니라고 본다.

1. 행렬의 구성 요소들을 메모리에 정렬하는 방법, 메모리 액세스 최소화

아마도 이 문제는 이렇게 이야기해도 될 것 같다. 

- 다루게 될 행렬의 크기에 따라 메모리에 어떻게 데이터를 배열해야 읽기과정을 최적화할 수 있는가?
- 내부에 data cache를 두어서 자주 읽게 되는 데이터의 경우 외부를 통해 액세스하지 않게 할 수 있는가?
- 이것들을 어떻게 micro-instruction에 반영시킬 수 있을까?
- 2 phase로 나누어 micro-instruction/external memory access를 어떻께 최적화할 수 있을까?

대략적으로 instruction은 internal (cache)와 external memory access에 대한 flag을 하나 두고 선택할 수 있게 하고 각각의 경우의 penalty (latency/cost)를 별도로 계산하게 한 뒤에 컴파일 시에는 최적의 해를 일단 brutal search를 하게 할 수 밖에 없을 것 같다.

2. 행렬연산의 특이점을 반영?

역행렬 계산만 놓고 보더라도 부동소수점 연산이 아니면 쉽지 않은 부분이 있어서 사실 이것을 구현하겠다 하면 정수연산으로 최소한의 요소를 활용해서 꾸역꾸역 해내는 방법이 있을 수 있고 그냥 아예 부동소수점 연산으로 밀고 가는 방법을 생각해볼 수 있다. 개발하자는 측면에서 보면 부동 소수점연산을 한다고 하면 일단 다루는 수의 폭이 엄청나게 넓어지게 되니까 예외 경우를 거의 생각하지 않을 수 있지만 많은 자원을 사용하게 되니까 전체적으로 공통 연산 자원을 하나 설계해놓고 그것을 계속해서 재사용하는 방법으로 구현할 수 밖에 없다. 정수연산을 한다고 하면 각각의 연산자원이 하드웨어 전체에 분산되어도 상관없겠지만. 정수 연산으로 처리할 때의 문제는 다루는 수의 정확도가 지극히 제한되고 이 정확도 때문에 연산 단계별로 이 문제를 보완해주는 처리를 해주어야 하고 그게 상당히 성가실 수 밖에 없단 것이다.

그렇다면 공통된 연산자원은 어떻게 구성되어야 하는 것인가? 또 어떻게 재사용되어야 하는가, 또 자원활용률과 앞에서 말한 메모리 접근시의 효율을 극대화하는 방법은 어떻게 구현되어야 하는 문제가 남는다.

2.1 공통 연산 자원 설계

어차피 메모리에서 데이터를 읽어올 때의 버스 폭이 얼마냐가 가장 중요하다고 본다. 적어도 시스템 자원을 최적화해서 쓰려면 매클럭 읽어오는 데이터 모두를 단번에 처리해서 그 결과를 곧바로 다음 단계로 넘겨줄 수 있어야 한다. 또 행렬연산의 특성상 열과 행을 구성하는 각각의 원소들끼리의 곱을 하나의 메모리에 계속 누적해나가는 과정이 요구되는데, 이를 위해서 더 높은 정확도를 갖는 연산 자원도 필요하다.

또 연산과정에서 부동소수점을 어떻게 처리하느냐도 문제가 된다. IEEE (IEEE 754)의 부동소수점 연산을 예로 들어보면 소수점 자리가 다른 두 수를 더하거나 할 때 일단 소수점 자리를 갖게 해놓고 연산을 하고, normalization이라고 불리우는 과정을 수행하는데 이것은 mantissa를 최대한 위로 끓어올린 후에 (non-zero bit이 나올 때까지) exponent를 다시 결정하게 된다. 
