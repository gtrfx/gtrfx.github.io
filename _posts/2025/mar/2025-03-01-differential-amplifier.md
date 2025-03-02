---
title: "differential amplifier/current mirror..."
tags: [life]
layout: post
author: "Keith"
---

Microelectronics라고 해서 opamp 설계하는 내용을 담은 과정을 들은 적이 있는데, 사실 이 과목에서 가르쳐 준 내용의 대부분은 differential amplifier와 current mirror로 요약할 수 있을 것 같다.

## Current mirror

이건 쉽게 current copier? 라고 생각하면 된다. 아래 회로를 보자.

![current mirror](/assets/img/mirror.svg)

좌측의 Q1을 위해서 bias를 걸어놓으면 R값에 의해서 전류값이 결정이 되는데 이게 우측의 Q로 그대로 복사된다고 이해하면 된다.

이것을 다음과 같이 응용할 수 있다. (netlistsvg로 그린 거라 결과가 이상(?)하다)

![current mirror](/assets/img/mirror2.svg)

bias가 걸린 Q가 두 개 (Q1, Q3)이므로 이 때 R을 통해 흐르는 전류가 I라고 하면 나머지 Q2, 4, 5, 6에도 각각 0.5 I가 흐른다고 볼 수 있고, 그 총합은 2I라고 생각할 수 있다. 따라서, 모든 Q를 통해 흐르는 전류는 3I라고 계산할 수 있다.

실제의 계산 값은 약간의 차이가 있긴 하지만 회로는 그런 목적으로 설계된 것으로 볼 수 있다.

## Differential Amplifier

이것도 굉장히 자주 나오는 패턴의 회로다. 입력 포트 두 개에 각각 positive, negative 입력을 넣으면 각각의 Q의 collector 측(R3, R5)에서 관찰되는 전압이 증폭된 결과로 나타난다. 

![differential amplifier](/assets/img/diff.svg)

