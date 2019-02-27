---
title: "Chorus effect: 원리는 무엇일까?"
tags: [chorus, signal processing, guitar effect]
categories:
    - guitar
    - electronics
---

Chorus effect는 modulation effect group에 속해있다. Modulation한다는 것은 위상이라든가 진폭을 바꿔주는 것으로 특이한 효과를 얻겠다는 말이다. 

Chorus effect를 다른 말로 바꿔보면 phase modulation이라고 할 수 있다. 즉, 입력 신호의 위상을 틀어놓았다는 뜻이다. 다시 말해서 원래 입력된 신호의 흐름이 있다면 이것을 일부러 앞으로 보내버린다거나 뒤로 보낸다거나 한다는 것이다. 이것을 일정한 값으로 하면 전체적으로 신호가 일정 비율로 앞당겨지거나 지연되는 것이니 듣는 사람의 입장에서는 아무런 차이를 느낄 수 없다. 이 값을 LFO (low frequency oscillator)로 주기적으로 왔다갔다하게 만든다. LFO는 쉽게 말해서 sine wave를 만들어내는 장치라고 보면 된다. Sine wave의 frequency가 낮아서 일부러 LFO라고 부른다고 보면 된다.

즉, 다시 요약하면 LFO가 주어진 주파수와 진폭의 sine wave를 만들고, 이것을 입력으로 하여 그 진폭만큼 입력 신호를 지연 혹은 빨리 나오게 하는 것이다. 그런데 미래의 신호를 미리 나타나게 할 수는 없으니까, LFO의 최대 진폭만큼 지연시켜놓고 상대적으로 앞서게 혹은 뒷서게 만드는 것이다 라고 보면 된다.

다시 해석하면 delay의 delay time을 매우 미세하게 주기적으로 변화시킬 때 얻어지는 결과와 같다. 

결국, Chorus를 만들 때 고려해야할 파라미터는 다음과 같이 나타날 수 밖에 없다.
- speed (frequency): LFO가 만들어내는 sine wave의 주파수
- depth: LFO가 만들어내는 sine wave의 진폭 - 위상의 변화폭
- mix: Effect가 적용된 신호와 적용되지 않은 신호가 어떻게 배합되어야 하는 정도
- waveform: LFO가 만들어내는 신호의 파형이 sine wave이냐 혹은 square wave이냐 혹은 그외의 waveform이냐 

여기에 Chorus를 Stereo로 적용하게 되는 경우에는 위 요소를 각각의 채널별로 적용할 수 있고, 각각의 채널에 적용하는 LFO간의 위상차를 별도의 파라미터로 둘 수도 있고, 위의 셋을 두 채널 모두에 그대로 적용하고 두 채널간의 LFO 위상차를 별도의 파라미터로 둘 수도 있다.

디지털 세계에서 이 정도의 signal processing은 사용자가 원하는 대로 어떤 방법으로든 다 만들어낼 수 있는데, 문제는 어떤 방법으로 만들어내야 듣기에 좋은 소리를 만들 수 있는지 찾아내는 것이 문제일 것으로 본다. 

이미 legacy equipment가 되었지만 코러스 이펙트의 전설이 된 TC1210은 5개의 파라미터를 두고 있는 것으로 보여진다.
- input sensitivity: input gain
- intensity: mix
- speed
- width
- delay

이미 앞서의 설명을 이해하면 위의 parameter는 지극히 당연한 parameter일 수 있다.

이것은 일반적으로 BBD (bucket brigade device)라고 해서 아날로그 딜레이에 적용시키는 부품과 LFO로 만들어지고 digital 세계에서는 입력 신호를 버퍼에 넣어두고 이것을 읽어서 내보내는 과정에서 트릭을 쓰는 것으로 이루어진다. 디지털 세계에서 이것을 구현하는 방법은 매우 간단한데, 문제는 과거의 유명한 아날로그 딜레이를 디지털로 구현하는 것에 아날로그 세계의 불완전한 기능을 모델링해야 한다는 것인데, 사실 일부러 이렇게 구현해야 할 필요는 없다고 판단된다.

요약하면,
- 코러스는 딜레이를 응용한 이펙트이며 modulation effect/phase modulated effect이다.
- 아날로그 코러스는 BBD + LFO로 구성된다.
- 디지털 코러스는 간단한 버퍼와 이것을 읽어오는 과정에서 간단한 알고리즘 (waveform generator)을 적용하는 것으로 구현된다.
- 디지털로 구현된 코러스가 원음의 파괴가 최소한이 될 수 있고 적용할 수 있는 파라미터의 폭과 알고리즘 선택의 다양성을 가지고 있다고 할 수 있다.


