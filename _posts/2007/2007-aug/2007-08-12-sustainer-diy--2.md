---
layout: post
title: "Sustainer DIY..#2"
---

Sustainer DIY 보러가기

piezo transducer로 feedback을 일으키려고 했던 아이디어는 생각보다 piezo transducer의 출력이 크지 않고, 찌그러짐이 심한데다 소리가 발생하는 이유로 접기로 했다.

대신 coil이 감겨있는 전자석을 이용하는 것이 좋은 방법일 것 같아서, 미들 픽업을 이용해서 sustainer로 구동시켜봤는데 생각보다 좋은 결과가 나왔다. 그러나, 픽업을 전자석으로 이용하려고 보니 줄을 진동시키기 위해 만들어진 것이 아니라 효율이 떨어지면서 외부로 간섭신호까지 방출하는 단점이 있었다. 또한 단순한 opamp로만 사용하니 출력이 작아서 상대적으로 움직이기 힘든 고음현에서는 sustain의 증가가 거의 없는 것으로 보인다. 개선 방안으로..

1) low voltage power amplifier: LM386을 쓴다.
2) 픽업과 연결하려면 impedance가 높은 초단을 써야하는데, small signal JFET이 없는 관계로 OPA2134를 그냥 쓰기로 함
3) Harmonic mode는 일단 빼고 최소구성으로 제작한다..

아래는 드라이버 회로..
![image](/assets/images/9dc6463c7aea9de768b2917c2da0cb0f.png)아래는 기판의 component side

![image](/assets/images/66745d4342f70c8b87125512ab669a34.png)
아래는 다림질용 pattern

![image](/assets/images/961b3ff78cbaa6b46614ae7661c5ac22.png)



