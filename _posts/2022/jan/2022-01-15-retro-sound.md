---
title: "레트로 사운드.."
tags: [retro sound]
layout: post
author: "Keith"
---

2022년에 재미삼아 진행해 볼 프로젝트를 여전히 찾고 있는 중이다. 잉여력을 방치하면 중독성이 있는 다른 무엇인가를 탐닉하는 성향이 사람에겐 있다고 믿고 있어서 되도록이면 잉여력을 덜 자기 파괴적인 분야로 확장하는 것이 차라리 낫다고 생각하고 있다.

이번에 걸려든 것은 지난 번에도 약간 언급을 한 것인데, 8bit sound라고 부르는 옛날 컴퓨터 사운드를 에뮬레이션 하거나 플러그인으로 만들어서 가지고 노는 일이다.

Plogue라는 회사에서 chip sound라는 플러그인을 냈는데 사실 옛날 컴퓨터 사운드를 내는 플러그인임에도 비싼 가격을 받고 있기에 너무한다 싶었던 기억이 있는데, 갑자기 그게 생각나서 잠시 인터넷을 뒤져보니 그 옛날 부품들이 지금도 생산되고 있고 (무슨 일인지 알 수는 없지만) 그것을 아두이노에 붙여서 재미삼아 가지고 노는 이부터 USB로 확장해서 외부 보드의 형태로 제작해서 사용하는 사람들도 있고, 일부는 플러그인으로 만들어서 판매하는 이도 있는 듯 하다. 글쎄 무슨 생각으로 시작했는지 모르지만 이것으로 돈을 벌어볼 생각으로 시작했다면 그것은 큰 오산이지 싶다.

음악 플러그인을 만들어서 제대로 돈을 버는 사람은 보지 못했다. 아무리 잘 만들었다고 하더라도 말이다. 그래서 뛰어난 개인용 컴퓨터를 놔두고 외장형의 이펙터로 가는 것이라고 나는 생각한다. 

본론으로 와서 이미 옛날 사운드를 내는 유명한 신디사이져들은 대부분 플러그인으로 복각(?)이 되었다. 그 중 하나가 DX7을 소프트웨어로 모델한 DEXED란 것인데 뭐랄까 실제 DX7보다 잡음은 없는데 (당연히 floating point로 만든 sine table을 쓰고 있으니 거의 순수한 FM synthesizer라고 봐도 되니까) 뭐랄까 사운드가 너무 순수한 까닭에 오리지널 사운드와 뉘앙스가 다른 패치가 제법 있는 것 같다. 그러니까 원작은 사운드가 여러 가지 하드웨어적인 제약 때문에 의도와 달리 살짝 엉뚱한 소리였다고 치면 DEXED에서는 공식 그대로 살려내고 있기 때문이 아닐까 한다.

이 신디사이저는 80년대 초에 나왔지만 사실 8bit 사운드라고 부르기는 뭐하고 대개 8bit 사운드라고 부르는 것들은 80년대의 개인용 컴퓨터 (MSX/APPLE) 게임에서 나던 소리, 또는 그 시절 콘솔 게임들에서 나던 소리를 재현한 것이라고 봐야 맞다. 여기에 IBM PC에 들어갔던 애들립 카드의 아순드를 추가하는 것 같다. 뭐랄까 애들립까지 가면 조금 덜 레트로한 느낌이 난다. 그러니까 투박한 사운드지만 현대적인 흉내를 너무 내면 덜 authentic한 맛이 떨어진다고 해야할 것 같다.

대개 이 시절을 풍미했던 사운드는 다음의 부품들로 요약이 가능하다.

- AY-3-8910
- YM2413(OPLL) 혹은 OPM/OPL이라고 부르는 시리즈의 야마하 칩셋들

- OPL: 3526, 2413(OPLL), Y8950(MSX), 3812(OPL2), F262(OPL3), F289(OPL3-L), F278(OPL4)
- OPM: 2151
- OPN: 2203 (2608(OPNA), 2610(OPNB), 2612(OPN2), 3438(OPN2C),F288(OPN3))
- OPP: 2164 

사실 그냥 야마하의 프로그래머블 시그널 제너레이터(PSG)들이 80년대 레트로 사운드를 거의 장악했다고 봐야지 싶다. 개인용 컴퓨터, 업소용 게임기, 콘솔 게임기에 모두 야마하의 칩셋이 들어갔기 때문이다. 물론 애들립이란 카드 뿐 아니라 사운드 블래스터라는 제품, 그것이 개량된 시리즈에도 전부 그렇게 되었고 ESS라고 야마하의 IP를 복사(?)해서 하위 호환성을 갖는 칩셋을 낸 메이커도 있었다.

그럼 대체 뭘 어떻게 하자는 건가?

1) 플러그인을 만들자는 거다.
2) 옛날의 어설픈 소리의 뉘앙스는 살리되 SNR을 높이자는 취지다. (골수 팬을 위해 필요에 따라 원본 그대로 소리를 내게 할 수도 있게 하자.)
3) AY-3-8910은 나름 확실한 특색이 있으니 그냥 놔둔다.
4) 야마하 칩의 경우 공통부분을 건져내서 하나의 몸뚱이로 만들어 모든 변동에 대응하고자 한다.
5) 예전 유명한 소리들을 수집해서 재생할 수 있게 한다.

대충 계획이 이렇다. 

사실 옛날 사운드라고 해서 이들이 100%를 커버한 것은 아니다. 일부는 이들 칩을 쓰면서도 사람 목소리를 플레이하기 위해서 PCM 신호를 처리하기 위한 별도의 칩셋을 쓰기도 했다. 사실 이 기능이 결국 YM 시리즈에 모두 통합되었다고 할 수 있지만. 모두 구현상의 제약을 극복 혹은 설계 컨셉의 불완전함으로 인해서 원했든 원하지 않았든 모두 특색있는 소리가 되었다. 

이를테면 DAC도 linear하지 못하고 또는 삼각파도 완전한 삼각파가 아니라거나 또는 half sine wave(?)를 씀으로써 발생하는 여러가지 하모닉/잡음적 요소가 포함되다보니 신호처리 측면에서 보면 상당히 어설프지만 고유한 특성을 가지고 있기 때문에다.

엄밀히 말해서 이 모든 것을 one-for-all로 소화하는 신디사이저가 이미 플러그인으로 만들어져 있다. 다들 바보가 아니고 옛날의 것들을 적당히 참조해서 만들었기 때문인데, 문제는 그것을 어떤 조합으로 사용해야 온전히 레트로 사운드를 낼 수 있는 지를 일반 사람들은 알 수 없다는 것에서 출발한다. 쉽게 말해 지금 우리가 어떤 음식을 만들고자 하면 예전보다 더 다양한, 그리고 더 신선하고 더 청결한 재료를 사용할 수 있어서 뭐든 만들 수 있지만, 일반 사람들은 지금의 재료로 옛날 어떤 갈비탕 원조집의 맛을 되살려 낼 수 없다고 생각해서 누군가의 비법을 전수 받아야한다고 생각하는 것과 같다라고 해야할 것 같다.

그러나 잠깐만 검색해보면 다 나온다. 고색창연한 칩셋의 에뮬레이션이 거의 칩마다 다 되어있다. VST/AU의 품질이 그다지 좋지 못해보여서 문제일 뿐. 충실도는 꽤 높아보인다.

일단 AY-3-8910부터 들여다보기로 한다.
