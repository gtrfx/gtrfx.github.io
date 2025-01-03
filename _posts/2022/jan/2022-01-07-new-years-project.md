---
title: "올해의 프로젝트 #1: 야매 simulated surround system"
tags: [project]
layout: post
author: "Keith"
---

갑자기 떠오른 것인데 simulated surround system을 만들어보려고 한다. 뭘로? Raspberry pi로. 이걸로 실시간 audio signal processing 가능하다. load가 많이 걸리냐고? 별로 그렇지 않을 것으로 예상한다.

내가 기타 이펙트를 하나 만들어봤던 적이 있는데 (Jack이라는 소프트웨어 인터페이스를 썼다) 생각보다 별 다른 큰 어려움없이 실시간 처리가 가능했다. 여기서 실시간 처리라고 함은 audio input으로 받은 것을 처리해서 다시 audio output으로 내보내는데 어차피 사운드 카드에서 latency를 먹고 내부처리에서 먹고 하더라도 뭐 큰 불편이 없었다는 얘기다. 물론 이펙트가 다양하게 붙으면 분명히 문제가 생길 것이다. 내가 테스트해본 것은 amp simulator와 speaker IR을 적용한 것이다 (FFT fast convolution).

누군가가 multichannel bluray audio가 그렇게 좋았다며 극찬을 하는데, 사실 이것은 엔지니어가 레코드사에서 가지고 있던 multi channel source를 가져다가 가상 3D 공간에 패닝해놓은 것을 믹스다운 한 거라고 본다. 적당히 EQ 만져주고 컴프레서 써주고, 그것도 뭐하다 싶으면 공간계 이펙트 좀 썼겠지.

그런데 이런 오디오 소스가 흔하냐고 하면 그렇지도 않고 꼭 이걸로만 들어야 되냐하면 그렇지도 않다. 집에서 2 channel source로 가상 서라운드 시스템 (스피커 4개가 편리하다고 본다 나는)을 꾸리는 것도 그다지 나쁜 아이디어가 아니라고 본다.

어차피 우퍼가 좋은 프론트 스피커가 있으면 그만이고 어차피 전면 좌우 스피커가 동일한 위상으로 소리를 잘 내주면 구태여 center speaker가 필요하지도 않고 결국 simulation해야 되는 것은 뒤에서 들려오는 소리다.

어떻게 만드냐고? 그러니까 가상공간을 가정하는 거다. 어떤 방에 들어와있는데 그 방의 뒷 벽에 반사된 소리를 흉내내는 것이다. 그렇다. 전면부 신호에 reverb를 걸어서 뒷쪽에서 내주면 된다. 당연히 뒷벽에 맞아서 튀어 되돌아오는 소리니까 충분한 딜레이가 걸려있어야 되고 그것은 방의 크기에 따라 결정되는 것이고 reverb로 쓰는 IR 또한 방의 크기 등등에 따라 결정하면 되는데, 어차피 야매로 만드는 것이면 누군가 잘 만들어놓은 IR을 가져다가 써보고 괜찮다 싶으면 그걸 쓰면 되는 거다.

문제는 그렇게 하면 정말 괜찮은 소리가 날 수 있는지 아닌지 테스트해보지 않았으니 실험적인 시스템을 꾸려야 되고 그것을 DAW를 이용해서 테스트해보는 과정이 필요하겠지. 요새 DAW는 너무 빠르고 좋고 멀티채널도 잘 지원하고 있으니까 이 부분에서 어려움은 없다. 다만 내가 가지고 있는 오디오 인터페이스가 딱 2 channel짜리라서 창고에 쳐박혀있는 골동품을 하나 꺼내와서 테스트해야 한다는 것인데 그거야 다 프로젝트를 하는 즐거움 아닐까?

이런 가상 서라운드에는 무슨 HRTF니 이런 것도 적용할 필요가 없다. 헤드폰을 쓰고 3D 가상 음향을 만들어내야 하는 것이 아니니까.

그런데 생각해보자. 2ch 소스를 좋은 방에서 듣고 있는데 (그러니까 뒷벽을 반사하고 나오는 잔향이 있는) 구태여 그것을 simulate하려고 한다는 게 좀 황당하지 않나? 그런데 오디오 바보들은 매우 좋아한다. 단순히 자기가 듣던 소리와는 좀 색다른 소리가 나니까 재밌다고 생각하는 거라고 본다. 맨날 듣던 음악도 이렇게 들으면 더 좋게 들리는 것 같고. 이 사람들이 모순되는 게 참 많은 것이 hifi를 추구한다고 하지만 이렇게 가공된 (hifi와는 거리가 먼) 소리를 또 좋아한다는 것이다.

서라운드 사운드는 일종의 간섭신호를 뒷쪽에 또 과장된 저음 간섭을 계속 넣어주는 그런 거다. 이게 무슨 hifi인가. 

본론으로 다시 돌아와서 얘기를 하자면, 사운드처리를 위해서 별도의 하드웨어를 두는 것도 말이 안되고 그렇다고 닭 잡자고 소잡는 칼을 쓸 수도 없다. 결국에 결론은 raspberry pi인데 이 아이는 가용할 수 있는 자원이란 게 PWM 출력을 LPF한 오디오 출력과 bluetooth 출력을 가지고 있어서 만일 뭔가 해보겠다고 하면 front speaker set에 PWM 출력을 물리고 read speaker set에 BT 출력을 물려야 된다. 

문제는 BT로 가는 latency가 상당해서 아무런 잔향 효과를 걸지 않았다고 하더라도 정말 청각 시스템에 문제가 있지 않은 이상 이 둘의 소리가 별개의 소리로 들리게 될 여지가 충분하다. 무슨 말이냐면 delay가 어느 이내로 들어오게 되면 대충 이것이 방 혹은 큰 홀의 벽에 반사되어 돌아오는 소리라고 인식할 가능성이 있는데, 그게 너무 길어버리면 부자연스럽게 들려버리는 것인데 BT가 딱 그런 경우라는 것이다. 생각보다 sync가 많이 어긋난다. 게다가 이 경우는 BT로 인한 latency + reverb처리 때문에 생긴 latency가 곂쳐지게 되니까 사실상 reverb 처리를 best effort로 하더라도 뭔가 큰 홀에서 생기는 잔향 같은 느낌이 들 것 같다고나 할까? 기본적으로 마음에 안드는 구성인데 그렇다고 BT를 2개 물려서 front와 rear를 각각 구동시킬 수도 없기 때문에 생각할 수 있는 해법은 front 출력에도 강제로 delay를 걸어버리는 것이다. 어차피 circular buffer에 데이터를 가져다 쌓아놓고 읽어내는 위치만 바꿔서 쓰면 되는 것이니까 전혀 어려울 것이 없다만.

그러니까, BT로 나가는 것은 원래 delay가 잔뜩 걸려있으니까 그것을 rear speaker 용 path에 두고 front speaker에 걸리는 delay를 조정하는 것만으로도 나름 reverb가 작은 가상 공간의 오디오 사운드를 만들어낼 수 있다.

간단하게 다음을 실험해봤다.

Mac에 직접 물린 audio interface를 front speaker path라고 두고 BT로 물린 2개의 스피커를 rear speaker path로 놓으면 대략적으로 100ms 이상의 latency를 먹고 들어가게 된다. 대략 10-20ms 정도의 delay가 걸리게 되면 사람들은 여기서 어떤 공간감(그러니까 원래 소리 + 잔향 (peak))을 느끼게 되니까 front speaker path에 delay를 대략 250ms 보다 작게 놓아주면 단순히 같은 신호를 wire/BT로 나눠 주는 것 보다 덜 어색한 소리를 얻을 수 있다. 물론 이렇게만 하면 뒤에서 들려오는 소리가 너무 단조롭기 (그러니까 앞에서 들리는 소리와 correlation이 사실상 1인 재미없는 소리) 때문에 rear에서 들려오는 소리에 적당히 reverb를 걸어주고 (사실상 mix를 100%에 가깝게 가져가야 뭔가 듣기 괜찮은(?) 소리가 난다) 들어보면 나름 쓸만한 소리가 난다.

어차피 이 값들은 정상적으로 이 시스템이 작동한다고 하면 바꿔넣을 수 있는 값들로 설정하면 된다. 즉, reverb의 성질이라든가 front speaker path에 걸어놓은 delay의 양이라든가 (그러니까 실제 두 path간 시간차는 BT delay - front delay가 되는 거다) 필요에 따라 변경하게 두면 된다.

대충 실험할 때 스튜디오 녹음된 음원보단 라이브 음원이 훨씬 더 실감(?)나는 경험을 할 수 있었다. 어차피 스피커는 남아돌고 값싼 class D 앰프는 쉽게 구할 수 있으니까 서라운드라고 하더라도 별 다른 사치(?)와 낭비가 아니다. 다만 스피커 2개가 아닌 4개가 울려대면 사실상 좋은 청취환경이 마련된 상황이 아니라면 이웃에게 욕을 들어먹기 딱 좋은 상황이지만.

대충 요약하면...
- 심심 프로젝트의 목표는 stereo source를 야매로 강제 서라운드로 만드는 것이다.
- 일단 front는 direct path로 rear는 BT를 이용한 link를 쓰면 quadrophonic simulated surround가 가능하다.
- BT의 delay를 고려해서 direct path에 simple delay를 걸어준다.
- rear는 대충 reverb를 걸어주는데 어차피 방안에서 먹는 잔향이 있으므로 너무 복잡하고 꼬리가 긴 reverb보단 그냥 room delay가 깔끔하고 좋게 들린다.
- 기왕이 rear를 imaing effect를 걸어서 좌우 분리도를 올려주면 더 재미있는 소리가 난다.

일단 이렇게 해서 좀 듣다보면 그냥 일반 스테레오 시스템은 심심해서 듣는 재미가 떨어짐을 느낀다. 그만큼 귀는 다채로운 source로부터 얻는 소리를 좋아하는 것 같다.

이것을 어떻게 raspberry pi에 드라이버의 형태로 우겨넣느냐를 이제 부터 생각해봐야 할 것 같다.
