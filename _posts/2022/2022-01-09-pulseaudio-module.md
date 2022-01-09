---
title: "pulseaudio module"
tags: [pulseaudio]
---

일단 라스베리파이에 simulated surround 모듈을 direct/BT path를 이용해서 quarophic으로 올려보겠다는 생각은 pulseaudio module을 만들어넣는 것으로 가능하게 되지 싶다. 대충 인터넷을 뒤져보니. pulseaudio용 module이 몇 개 있긴 하지만 그게 내 입맛에 떨어지는 것도 아니고 더욱이 이런 괴상한 경우에 맞춰서 모듈을 만들었을리도 없거니와.

그러니까 만들어야 하는 모듈은 direct path용 sample delay와 BT path용 reverb 되시겠다. 사실 rear로 가는 신호를 달랑 front의 reverb로만 만들면 재미가 없는데 일단 reverb라고 제대로 붙여보는 게 어디냐 하고 있는 것이다.

사실 reverb는 long IR을 fast convolve하거나 진짜로 long convolver를 만들거나 해야 하는 것인데 raspberry pi에서 얼마나 빠르게 돌지 알 수 없는 일이다. x86에서 돌려본 경험으로는 FFT로 fast convolve해봐야 load를 별로 안 잡아먹었던 것으로 기억되는데 그거야 x86 core가 floating point를 빠르게 할 수 있도록 이미 배려가 잘 되어있던 상황이니까 그렇다 치고.

맛배기로 DTS로 나온 레전더리 앨범들을 몇 개 들어보았는데 그 특징을 살펴보면
- 대부분은 일반적인 simulated surround 사운드다. 그러니까 rear는 reverb 걸린 소리만 (100% wet) 나오고 front는 2 channel audio를 3(L-C-R)개로 쪼개놓은 것이다. 어차피 좌우로 나눠지는 것도 진짜로 single source를 좌우 트랙으로 분산시켜놓은 것도 있지만 보컬 같은 것은 stereo image를 만드는 effect로 양쪽으로 쪼개 놓은 것이 들어간다. 
- rear에 가끔씩 2 channel source에 들어간 것을 일부러 뒤로 가끔씩 빼놓기도 하고 narration 같은 것이 있으면 일부러 rear에 넣기도 한다. 내내 reverb가 진하게 걸린 소리가 나오가다 갑자기 reverb가 빠진 source가 툭 튀어나오기 때문에 청자를 놀라게 하는 효과가 있다고 본다. 
- 특징적인 것은 rear에 나오는 reverbed sound에는 center에 들어가는 것이 빠져있는 소스를 이용하는 것처럼 들린다. 그러니까 front를 꺼놓고 들어보면 rear에는 오직 보컬이 빠진 사운드만 나올 때도 있다.

전반적으로 보면 그냥 엔지니어가 심심해서 장난한 결과물을 음반화한 거라고 밖엔 생각이 안된다. 왜 이 타이밍에는 Rear L에서 코러스의 일부 성부만 나오는건가? 왜 이 타이밍에는 Real L/R에 narration이 나오는 건가 따져봐야 의미없다. 스피커가 5개나 있는데 내내 똑같은 흐름으로 소릴 내보내면 심심할 것 같으니까 그렇게 했다고 할 수 밖엔.

스튜디오에는 모든 트랙의 소스를 다 가지고 있으니까 엔지니어가 원하는 모든 조합을 전부 다 구성할 수 있지만, 어차피 이것 저것 다 귀찮고 그저 2ch source만을 이용해서 simulated surround를 하겠다면 선택의 폭은 좁아진다. 결국 다음의 구성을 나는 생각해 볼 수 있을 것 같다.

1. front로 2개의 original source를 내보내고 rear에는 비교적 high 성분이 제법 들어간 reverb를 넣은 신호를 내보낸다. 왜냐면 high가 제법 있어야 더 시원한 현장감 느낌이 난다. 이게 빠지면, 그러니까 dark한 reverb면 내가 듣기엔 온통 먹구름낀 진흙탕 필드가 떠오르는 그런 느낌의 simulated surround로 들려서 금방 무드가 다운된다. rear는 뭘하고 있나 답답해지기도 하고. high를 더 빼면 귀는 빨리 피곤해질지 모르지만 (어차피 simulated surround는 귀가 처리해야 할 소리도 많고 대개 음량을 크게 듣게 되니까 어떻게든 빨리 피곤해질 수 밖에 없다) 듣는 동안 무드가 다운되진 않는다.
2. 1의 경우에 더해서 rear로 빠지는 것은 2ch source에서 mid range의 공통 부분 (보컬이 위치하는 부분)을 뺀 것을 내보내는 것도 괜찮다. 어차피 +/-하는 것이라 계산량은 별로 증가하지 않을테니까.

이제 남은 일은 지금 BT만 굴리고 있는 라스베리파이의 audio output (PWM + LPF)에 스피커를 2개 더 연결해서 pulseaudio module을 만들어 실험하는 일만 남았다. pulaseaudio module의 interface가 얼마나 지저분할지는 봐야 알겠지만 여태의 경험상 이게 실험하기 용이한 플랫폼은 아니지 싶다만.
