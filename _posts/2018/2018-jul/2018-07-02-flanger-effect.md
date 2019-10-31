---
layout: post
title: "Flange effect: 원리는 무엇일까?"
tags: [flanger, signal processing, guitar effect]
categories:
    - guitar
    - electronics
---

플랜저의 원리는 간단하다. Chorus의 출력의 일부를 입력으로 feedback하면 그것이 flanger다.

결국 Chorus effect를 만들고 여기에 feedback ratio을 얼마로 할 것이냐를 정해주면 Chorus/flanger가 된다.

이 떄 feedback을 순수한 chorus effect를 적용한 것으로 하느냐 아니면 dry + chorus signal로 하느냐에 따라 다르게 적용할 수 있는데, 사실 이것은 그다지 의미가 없고 positive feedback에 의한 oscillation을 야기할 수 있으니 그럴 이유가 없다.

요약하면

- Flanger는 Chorus w/ feedback control 이다.
- Combined signal (dry + wet)을 feedback 할 이유가 없고 오직 wet signal만 feedback한다.

