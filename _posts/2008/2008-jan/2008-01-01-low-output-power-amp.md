---
layout: post
title: "low output power amp.."
author: "Keith"
---

방구석에서 기타를 녹음하자면 왠만한 출력의 앰프로는 크랭크업하기 어려우므로 감쇄기를 달거나 강제로 출력을 떨어뜨리는 등의 기술을 쓴다. 그런데 아예 저출력 앰프를 만들면 이 문제는 나름 쉽게 해소할 수 있다.

즉, 프리앰프용 3극관을 이용하여 class AB power amp를 만들면 수 watt의 파워앰프를 만들면 된다.

[2와트 PP 파워앰프 회로도](http://www.ax84.com/static/corepoweramps/2W_PP/AX84_2W_PP_Poweramp_Schematic.pdf)


[2와트 PP 파워앰프 회로도](http://www.ax84.com/static/corepoweramps/2W_PP/AX84_2W_PP_Poweramp_Schematic.pdf)


아이디어는 괜찮은데 프리앰프용 3극관을 쓰면 출력임피던스가 커서 출력트랜스를 구하기 쉽지 않다는 문제가 있다. -_-;

- Hammond에는 형명이 125A라는 트랜스가 있음
- 소X전자에 확인해보니 그런 트랜스는 제작하지 않는다고 함
==> 따라서, 별 수 없이 11kohm짜리를 사다가 같은 권선비라면 4 ohm 출력에 8 ohm 스피커를 달아주면 될까?
==> 1차 11k ohm이나 출력은 8, 16 ohm만 만든다고 함 ==> 결국 16 ohm 스피커를 8 ohm 출력에 달아주어야 한단 말.

어차피 impedance matching이 되지 않으면 출력 효율이 떨어지므로, 출력이 더 줄어들게 되어 좋은 점은 있겠으나, 분명한 건 동시에 주파수 응답이 달라져서 음색까지 변할 수 있을 거란 말..오히려 이게 더 매력일 수도 있겠음.

따라서, 괜히 해몬드 transformer를 구하려고 애쓸 것이 아니라 EL84 pp (15W)에도 쓸 수 있는 10k짜리 트랜스를 사다가 이용해 볼 수 있을 것으로 판단됨.



