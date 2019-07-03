---
title: "HiWatt Preamp Module..? (2)"
---
# HiWatt Preamp Module..? (2)

Preamplifier를 추가로 더 분석해보도록 하자.

지난 번 포스팅의 회로도를 보면, 초단에서는 찌그러짐이 없이 증폭이 되고, 이것이 2번째 증폭단에서 절반이 찌그러진 채로 tone stack에 흘러들어가고, 그 출력이 3번, 4번째 증폭단을 거치면서
찌그러진다. 물론 power amplifier distortion도 있다. 그보다 headroom이 큰 phase splitter distortion도 아울러 있다.

따라서, 프리앰프를 만들 때에는 일단 feedback을 고려할 수 없으므로, feedback을 없다고 보고 (덩달아 presence도 없음) 4개의 증폭단을 모두 만들어주어야 한다. 물론 초단에 출력 cap이 다르게 2 채널이 존재하므로 이도 아울러 고려해 주어야 할 것이다.

결국 Modular preamp에 얹을 때에는..

- 초단을 2개 만들고 각각의 cap이 다르게 만든다.
- cap에 물리는 저항이 회로도 상에서는 470k이나, 모듈 상에서는 1MEG로 물리고, 여기에 병렬로 gain에 해당하는 가변저항을 물린다.
- 출력을 두번째 증폭단에서 취하고, Fender style tone stack에 물린다.
- 마스터 볼륨 이후에 2개의 증폭단을 두고, feedback은 없는 것으로 보고 절단한다.




