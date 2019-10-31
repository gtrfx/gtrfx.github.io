---
layout: post
title: "Learning a Synthesizer: Example #1"
categories:
    - learning
    - music
---

## 개요

예제 1은 80년대에 나온 비교적 간단한 신디사이저 하나로 잡아봤다. 그림을 마음대로 도용해도 되지 싶다. 이미 철간 물건이고 소프트웨어로 모델링된지 오래다. 물론 system rom이며 system exclusive까지 완벽 호환되는 레벨이다. 

### 기본 요소

아래 그림은 이미 앞서 얘기했던 wave player에 해당하는 가장 기초적인 요소가 되겠다. 기본이 되는 음의 주파수 정보가 들어가고 modulation data라고 해서 frequency modulation을 위한 추가적인 주파수 값이 들어간다. 쉽게 말해서 pitch freq.는 하나의 음에 대해서 고정이지만, modulation data를 바꿔줌으로써 음 높낮이를 변화 시킬 수 있고 (pitch-bend) 또 빠른 주기의 다른 sine-wave를 이용하면 FM(frequency modulation)이 되는 것이다.

![image](/assets/images/synthesizer/element.png)

### FM

아래의 그림은 위 요소 두개를 직렬 연결한 것이다. 이것이야 말로 FM synthesizer를 설명하는 가장 간단한 그림이 될 것 같다. 여기서는 OP(operator?)에 해당하는 요소가 위애 설명한 가장 기본적인 요소를 의미한다.

따라서, 이미 전술한 구성 요소 중에 오직 wave player만을 직렬 연결한 구성이다.

![image](/assets/images/synthesizer/fm_synth.png)

### Algorithm

여기서 구조를 조금 더 복잡하게 만들면 다음과 같은 구조가 나오게 된다. 이 신디사이저에서는 이것을 알고리즘 1로 명명한 것이다.

![image](/assets/images/synthesizer/algorithm.png)

그림에서 보는 바와 같이 FM된 신호 둘을 서로 배합하는 모양새의 알고리즘이다. 아마도 수많은 OP들의 조합을 통해서 얻어진 지적산물일 수 있을텐데 feed forward한 흐름도 있고 feeb-back을 허용해서 loop의 형태를 갖기도 한다. 

이 신디사이저에서는 여러가지 알고리즘들을 지원하는데, 그것들은 모두 OP를 어떻게 서로 routing하느냐에 따른 구분이다.

따라서, 알고리즘이라는 것은 어떤 기본 요소들을 어디에서 어디로 연결하느냐를 의미하는 것이다. 이러한 조합은 최대 몇 개의 OP를 사용할 수 있느냐에 따라서 결정되는 값이지만 그 가지수가 너무도 많아서, 실제의 synthesizer에서는 가지수를 한정해놓았다. 

만일 이것을 몇 가지의 synthesizer 기본 요소를 정의하고 그것을 어떻게 rounting하는지 여기에 관련된 정보만을 가지고 운용하면 매번 특정 알고리즘을 사용하는 특정 synthesizer를 불러내어 어렵게 프로그래밍하지 않아도 된다.

### Polyphony

wave player (혹은 OSC 혹은 VCO 또는 LFO)가 만들어내는 음은 기본적으로 하나다. sample을 읽어올 수 있는 것을 감안하면 하나의 wave table로도 여러 개의 음을 발생시킬 수 있지만, 그렇지 않다고 보면 기본 음은 하나다, 즉 monophony다. 다시 말해 화음을 낼 수가 없다.

위에 설명된 트리들은 모두 하나의 음에 대해서 적용하는 것이라 polyphony를 허용한단 말은 위의 트리들을 N번 실행되거나 N배 개수만큼 있어서 각각의 출력들이 모두 더해져야 한다는 의미로 해석해 볼 수 있다. 

따라서, 아마도 당시에 신디사이저를 설계할 때에는 이 OP의 총개수를 가지고 결정했거나 지원할 수 있는 polyphony의 최대값을 가지고 응용할 수 있는 algorithm 수에 따라서 만들었을 것이 확실하다. 

사고의 틀을 제한할 이유가 없는 것이, 당시의 synthesizer들은 S/W 구현이 어려웠기에 모두 ASIC으로 만들다보니 구조가 제한 되어 있었으니 이러한 것이고 지금처럼 프로세서가 발달된 상황에서는 이것과 꼭 같은 방법으로 자원의 응용 가지수를 제한해서 설계할 이유가 없다. 

즉, 하나의 wave generator가 polyphony를 지원하게 할 수도 있고 같은 모양의 알고리즘은 N개의 음에 대해서 처리하게 하고 그 결과를 합산해서 가져다 쓸 수도 있다. 

### Envelope Control

Envelope control에 여러 가지 요소들이 적용됨을 확인할 수 있을 것이다. 
ADSR의 패턴이 악기들마다 살짝 다르고 각각은 signal level, duration이 연관된다.

즉, ADSR에서 attack이 2개의 phase로 되어서 attack1/attack2가 될 수도 있고, decay가 decay1, decay2가 될 수도 있다. 3개 이상이 되는 것은 무의미하므로 최대 2개 까지 받아주는 것으로 하면 큰 무리는 없을 것 같다.

따라서, 매 순간 signal level은 (target_signal_level-initial_signal_level)/duration의 비율로 증가하거나 감소하게 될 것이다. 

또 이 attack과 decay의 값은 velocity에도 영향을 받을 것으로 보여지는데, 이것은 단순한 방법으로 결정되는 것이 아니라 신디사이저들마다 특정 velocity에 대해서 반응하는 정도가 다 다를 것으로 보여진다. 

어쨌든, 음의 발현 구간을 특별히 ADSR로 구분할 이유가 없이 4개에서 최대 6개 정도로 나누어놓고 구간의 길이와 기울기로 구분하면 되는 문제이다. 즉 level 0에서 시작해서 level 0이 되면 wave generation을 종료하는 것으로 구성하면 된다. 
