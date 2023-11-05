---
layout: post
title: "Pentode vs. Triode"
author: "Keith"
---

진공관 앰프의 출력단에 보면 대개 class AB 구성으로 pentode의 screen grid에 적정 DC 전압을 가해 높은 출력을 내게 설계되어있는 것이 있는가 하면 (pentode mode), pentode의 일부 전극을 plate에 연결해서 마치 triode인 것인양 동작시키는 경우도 있다. 
물론, 토글 스위치로 pentode mode와 triode mode를 전환할 수 있도록 만든 앰프도 있다. 
둘의 차이점을 정리하면 대충 다음과 같다.
1) Pentode mode에서는 전류를 많이 흘릴 수 있으므로, 높은 출력을 기대할 수 있다. 반면 triode mode의 경우 출력이 약 1/4 정도로 감소한다.2) Triode mode의 경우는 even oder harmonic를 pentode mode에 대하여 상대적으로 더 많이 얻을 수 있어서 더 sweet한 소릴 낼 수 있다고 한다. 물론 이 내용에 대해서는 이견이 분분하다.
나의 궁금긍은 여기서 한발 더 나아가, triode mode로 구동되는 증폭단과 pentode mode로 구동되는 증폭단을 병렬 연결해서 동작하는 이른바 simul-class amplifier에는 어떤 특징이 있길래 그 난리일까에 초점이 모아진다.
언뜻 드는 생각은 어차피 기타 앰프가 crank-up이 되면 출력관까지 saturate가 되는데, 두개의 mode로 도는 증폭단이 있다고 하면 낮은 전압에서 saturate되는 것과 높은 전압에서 saturate되는 것이 독특한 효과를 내는 것이 아닐까 생각했다.
그러나 시뮬레이션을 해본 결과 그러한 문제는 잘 드러나보이지 않았다. 아마도 출력의 하모닉 특성만 달라질 것으로 보여진다.

