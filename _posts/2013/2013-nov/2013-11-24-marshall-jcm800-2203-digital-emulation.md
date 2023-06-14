---
layout: post
title: "Marshall JCM800 2203 Digital Emulation"
author: "Keith"
---


일단 digital domain에서 대충 simulation한 것이다.




사람들이 진공관의 느낌을 어디서 얻는지 모르겠지만, 진짜로 진공관의 느낌은 grid limiting current가 제대로 흐르는 아슬아슬한 조건에서다. 솔직히 이 부분은 어떻게 시뮬해야 될지 잘 모르겠다. spice 모델만도 꽤 다양하고 어떤 것이 진리의 모델인지 찾기가 애매하다.




Front pickup

<audio src="/assets/images/7ccedc62ed4c5f93c96394c2b6dbdd8f.mp3" controls preload></audio>








Rear pickup

<audio src="/assets/images/ef1d97693245879cecab91817646ad58.mp3" controls preload></audio>








어떤가 좀 비슷한가?




이것이 진공관의 느낌이다 라고 말하면 진공관이 아니라 진공관 회로에 붙어있는 엉성한 필터의 느낌인 것이다. 우리가 느끼는 따스함이 이것이라면 그것은 진공관의 불빛에서 그리고 진공관 회로에 들어있는 필터가 가져오는 따스함 때문인 것이다. 이 시뮬에서 진공관의 역할은 단순한 hard clipper 그 이상, 그 이하도 아니다.




시뮬레이터가 회로 시뮬레이터와 비슷해지고 있다. 그렇지 않으면 제대로 시뮬할 수가 없으니. 그러나 tube model은 아직도 좀 애매하다. tube model 자체가 스스로 회로를 analyze해서 스스로 돌아야 하게끔 만들어야 다양한 앰프를 모델할 수 있으니 이 또한 쉬운 일이 아니네.




계산량으로 봤을 때 이걸 실시간 플러긴으로 만들어도 엄청 나게 가벼울 것이고, SoC나 DSP의 힘을 빌어 standalone effect로 만들기도 어려워보이지 않는다.


