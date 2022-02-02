---
title: "Yamaha YM 시리즈"
tags: [retro sound]
---

누군가의 자료를 무단으로 퍼왔다.

| FM unique | FM 4op | FM 2op | FM 4op with SSG/PCM | SSG | other sound generator |
|---|---|---|---|---|---|
| YM21280 (OPS) |  |  |  |  | |
| YM21290 (EGS) |  |  |  |  | |
|  |  |  |  | YM2149 (SSG) | |
|  |  |  |  | YM2149F (SSG) | |
| | YM2151 (OPM) |  |  |  | |
| |  |  |  |  | YM2154 |
| |  |  |  |  | YM2163 |
| | YM2164 (OPP) |  |  |  | |
YM2198 (KAS) |  |  |  |  | |
| |  |  | YM2203C (OPN) |  | |
| |  | YM2420 |  |  | |
| |  |  |  |  | |
| |  |  | YM2608 (OPNA) |  | |
| |  |  | YM2610 (OPNB) |  | |
| |  |  | YM2610B |  | |
| |  |  | YM2612 (OPN2) |  | |
| |  |  |  |  | YM3423 (GEW3)
| |  |  |  |  | YM3424 (KPU)
| |  |  | YM3438 (OPN2C) |  | |
| |  |  |  | YM3439 (SSG?) | |
| |  | YM3526 (OPL) |  |  | |
YM3806 (OPQ) |  |  |  |  | |
| |  | YM3812-F (OPL2) |  |  | |
| |  | YM3814? |  |  | |
| |  |  |  |  | YM3931 |

어차피 공통적인 요소를 골라내고 칩별로 차이를 적용하면 모든 칩을 지원할 수 있게 되는데, 기존의 코드들은 음질 자체보다는 에뮬레이션의 정확도에 초점이 맞춰져있다. 그러니까 단순한 sine table을 쓰는 것으로 인한 신호처리상의 여러 가지 불순물 (의미 없는 하모닉 성분, quantization error, 화상으로 치면 저해상도 영상에서 보여지는 수 많은 깍뚜기와 같은 artifacts 또 이것을 filtering을 통해서 가리는 과정에서 생기는 blurriness)을 가지고 있다는 말이다. 그런데 옛날의 회로도를 보면 대개 RC filter로 이 허접함을 많이 가리고 있는데, 에뮬레이션 코드를 보면 이런 부분도 모두 반영이 되어있다.

사실 신호처리 측면에서 바라보면 설계자가 의도했던 사운드 그대로 만들어내면 (정확도를 매우 높이 가져가는 것으로 설계를 변경함으로써) 전체적인 느낌은 매우 깔끔해지는 반면 예전에 비해서 소리가 꽉차는 느낌은 상대적으로 줄어든다. 이것이 어찌보면 harmonic의 성질이 아닐까한다.

2149는 사실상 AY-3-8910의 복제판이기 때문에 일부러 AY-3-8910을 모델할 이유가 없고, 대부분의 YM 계열 칩의 에뮬레이션 코드는 mame의 sound device안에 들어있어서 이것을 적당히 활용하면 된다.

중요한 요소들을 적당히 정리하면 다음과 같다.

- 8910 계통: 단순한 waveform generator (Mocking board/MSX)
  - 지원하는 파형은 모두 linearly ramping up/down하는 파형으로만 구성된다.
  - 위의 파형을 조합하여 saw/triangular waveform만을 제공한다.
  - YM2149(MSX2, Atari, ...)
- YM시리즈: FM signal generator
  - YM21280/21290 (DX7의 음원)을 기반으로 한 FM signal generator engine
  - PCM signal generator (lowfi waveform player(DAC))

따라서, 소프트웨어적인 요소를 따져보면 8910 스타일의 waveform generator와 FM signal generator (FM signal source + operator ())로 구성하면 되는데, 그 스펙사항을 보면 YMF278(OPL4)가 사실상 최근 칩이고 하위호환성을 가지고 있으므로 딱 2가지로 작업하면 될 것으로 보인다. 문제는 칩과 CPU 사이에 오가는 데이터를 켑춰해서 기존의 튠을 replay하는 것이 중요한 요소가 아닐까 생각된다. 이것은 다음에 다루기로 해야할 것 같다.

참고로 비록 YM2149가 AY-3-8910의 일종의 카피버전이긴 하지만 뭔가 개선된 구석이 있다는 것을 다음에서 확인할 수 있다.

https://maidavale.org/blog/ay-ym-differences/

대략적으로 waveform table과 DAC의 오차가 다소 줄어든 것으로 파악이 된다.

사실 80년대의 8bit 사운드라고 하는 것은 8910 하나를 모델링하는 것으로 완전히 끝이난다고 할 수 있다고 본다. 여기에 Yamaha의 FM 음원이 더 해지면 음색/패치를 결정하는 timbre라는 개념을 포함하게 되고 사실상 GM (general MIDI)의 전단계로 진화하게 되는데, 개인적으로 보면 이것은 MIDI도 아니고 8bit chip sound로 보기도 뭐한 상태가 된다.

8910 계열의 칩으로 만들어진 하드웨어(업소용 게임기, 콘솔 게임기, MSX, Atari, Mockingboard ...) 가 워낙 오랜동안 히트를 쳤기 때문에 주로 가정용 IBM PC에서 adlib card + soundblaster로 미친 영향력은 상대적으로 매우 작기 때문이다. 