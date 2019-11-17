---
layout: post
image:/assets/images/3f79d63629748cec9947bd1a75491066.png
title: "Speaker Simulator (from JMP1)"
---

Marshall의 JMP1 샘플들을 들어보니 스피커 시뮬이 괜찮길래 한번 분석해봤다.

아래는 회로도..OPAMP가 5개 들어간다. 예전 회로에서 남는 2134와 TL074 하나를 넣어주면 해결 가능하다.
![image](/assets/images/3f79d63629748cec9947bd1a75491066.png)
아래는 Frequency Gain을 보여준다..
![image](/assets/images/366229afe58d4c2e98a7239c3cda4b43.png)
메사의 VTwin에 비하면 훨씬 정교한 모델링이라고 볼 수 있다..


소리가 어떤가??

Preamp Ouptut:
<audio src="/assets/images/5a3deb9769cbea8a9ac8b0a9ffe01f93.mp3" controls preload></audio>

Simulator Output:
<audio src="/assets/images/da897afd116e5ac5ffed76d31915d61c.mp3" controls preload></audio>

시각적인 비교를 위한 spectrum analysis이다. Simulator 출력의 응답이 어떤 것인지 확실히 구분이 된다.
![image](/assets/images/038765522493e20459b902c5f3294f3c.png)



