---
layout: post
title: "Preamp tube modeling?"
author: "Keith"
---


Spice를 돌릴 목적이 아니라 최대한 간단한 연산으로 입출력을 흉내내기 위해서 2가지를 생각해볼 수 있을 것 같다.




1) saturation (grid current limiting/cut-off)

2) cathode capacitor/output filter




실제로 기타 앰프의 경우는 진공관이 대부분 비선형 영역에서 동작하고 있고 (선형 영역에서 동작하면 진공관 앰프의 장점은 없다) 그 중에서도 대부분 grid current limit 혹은 cut-off에 의하여 비대칭 saturation을 일으키는 경우가 주된 경우이므로, 우리가 해야할 일은 그외의 영역은 사실상 선형 증폭 특성을 가지고 있다고 가정해야 연산이 간단해진다.




마지막으로 2)의 경우는 plate follower의 응답특성을 결정하는 부분이므로 cut-off frequency를 변수로 하는 filter로 만들어주면 될 것 같고.




그러면 결국 하나의 plate follower는 grid current limiting (grid전압이 cathode보다 높아서 cathode에서 방출된 전자가 plate가 아닌 grid로 빨려들어가는 현상)과 cut-off (grid 전압이 cathode보다 너무 낮아서 전자가 plate로 흘러가지 못하는 현상)을 모델해야 하는데, 이것을 어떤 비선형 curve에 mapping하도록 하고 (일단은) 그 결과를 HPF하는 구성으로 만들어서 테스트하도록 하자. 





