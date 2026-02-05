---
title: "신디사이저에 관한 짧은 생각.."
tags: [synthesizer, music]
layout: post
author: "Keith"
---

개인적으로 signal processing이란 학문을 전공했다고 봐도 무방하다. 전기전자공학을 하는 사람이면 기본적으로 system (엄밀히 말해서는 system model? 뭐 그런 거다)을 배우고 여기에 관련된 수학을 좀 다루면 그걸 continuous signal에서 discrete signal로 바꾸어 알아보고 그렇게 FFT를 배우고 digital filter에 대해서 배운다. 그래서 대개 filter design을 어떻게 하는지를 끝으로 한 과정이 끝나는 식인데, 나는 그 외에도 communication theory, statstical signal processing등의 과목을 여러 해 더 했기 때문에 그렇다고 할 수 있다.

대체로 이 정도까지 했다면 synthesize에서 기본적으로 음을 생성하는 원리라든가 그것들의 주파수 특성 따위는 모두 다 이해할 수 있다. 더구나 신디사이저에 붙어있는 다양한 parameter라든가 knob들이 정확히 무엇을 뜻하고 있는지도 잘 이해할 수 있다. 그런데 문제는 이것만 알아서는 좋은 소리를 만들어내기 어렵다는 거다. 소위 '좋은 소리'라고 들리는 소리를 일반적인 신디사이저를 이용해서 만들어내는 것 또한 어렵다.

예전을 돌이켜보면 유명한 신디사이저들이 있었고 그 각각이 독자적인 방식으로 음을 발생한다는 것 까지만 알았지 내용을 들여다 볼 생각은 한적이 없다. 그냥 그 악기가 가지고 있는 기본 패치가 훌륭하면 됐지 더 나이가서 뭘한다는 게 시간 소모라고 생각했으니까.

사실 어떤 신디사이저 혹은 건반이 붙어있지 않은 모듈이 나오면 그것의 특징적인 소리를 부각하는 몇 가지 데모곡을 듣는 정도가 전부다. 나머지는 그 악기에 들어있는 GM patch들이 이쁜 소리를 가지고 있느냐. 혹은 GM을 지원하지 않는다면 공연에 들고 나가서 쓸 수 있는 소리가 얼마나 있는가, 혹은 잘 나가는 옛날 팝송들을 연주할 때 좋은 소리들이 있는가를 알아보는 정도?

뭔가 이걸 많이 파면 신비한 도를 발견하게 되고 그것의 원리를 깨닫고 나면 모든 신디사이저의 프로그래밍을 아무 문제 없이 할 수 있게 되는, 그런 능력을 갖게 되는 것 아닐까 했던 적도 있다.

그런데 지금 내가 느끼는 것은 이렇다.

1. 어차피 신디사이저라는 게 정형화된 포멧이란 게 없어서 다들 제 각각이다. 그만큼 그 신디사이저들이 개성을 갖고 있게 되는 거다. 그래서 이 세상에는 정말로 엄청나게 다양한 신디사이저들이 있다.
1. 신디사이저를 프로그램 한다는 게 별로 대단할 게 없다. 기왕에 시간을 투자할 거라면 별 다른 노력(악기 혹은 소프트웨어 구입/설치)없이도 쓸 수 있는 것들이어야 한다. 아니면 내가 쓰는 악기/소프트웨어가 늘 내 곁에 있지 않는 경우에 그 경험과 지식은 무의미해질 수 있다.

신디사이저의 대중화에 공헌을 한 몇 개의 신디사이저를 살펴보면 공통적으로 다음을 발견할 수 있다.

### Osillator: LFO 또는 VCO 또는 NCO

소위 발진기라고 하는 것인데, 음을 내기 위한 기본을 만들어낸다. 이 때 신디사이저 종류에 따라서 pure sine wave를 만들지 아니면 saw wave 혹은 square, noise 또는 소위 wave table이라고 하는 정해진 패턴을 주기적으로 플레이할지 정할 수 있다. 여기에 detune을 할 수 있게 한다든가 할 수 있다. Vintage한 synthesizer라고 하더라도 음의 기본 (timbre/timber)를 만들어 내는데 최소 2개의 LFO는 두고 있다. 이들 LFO를 사용자의 취향에 따라서 적당히 섞을 수 (mixer) 있다.

### Mixer

말 그대로 여러 개의 음 발생기 (Oscillator 혹은 sound generator? 이름 붙이기 나름이다)에서 나온 기본 음색들을 섞을 수 있게 한다. 이 때 synthesize에 따라서 여러 가지 옵션을 붙일 수 있다. 단순히 음량 조절 말고도 시간차(delay) 혹은 phase의 차이를 두게 할 수 있다. 

### Filter

말 그대로 filter다. Vintage synthesizer의 경우에는 대개 고역을 깎아내는 low pass filter (LPF, LP)만을 가지고 있는 게 일반적인데 그외에도 BP (Bandpass), HP (Highpass) 말고도 사용자가 직접 GUI로 filter를 디자인할 수도 있고 graphic EQ처럼 할 수도 있고 filter의 parameter (cut-off, resonance)를 LFO로 컨트롤 하게 한다든가 할 수 있는 것이 일반적이 되었다. 

사실상 신디사이저라는 것은 수많은 LFO(혹은 wave generator)와 mixer/filter의 조합이 일반적이다. 

### ADSR

ADSR이라는 것은 Attach, Decay, Sustain, Release의 약칭이다. 어떤 음이 발생해서 초기 패턴(attack/decay)을 보이고 그 음이 지속되는 길이는 어느 정도이고 음의 발생이 끝난 후에 여운은 얼마나 남는지 (release)에 대한 것을 나타낸다. 타악기라고 하면 attach과 decay/sustain/release가 상당히 짧고 반대로 패드류의 음색은 attack이 꽤 길고 sustain/release가 매우 길다. 이러한 패턴으로 synthesize는 발생된 음을 증폭하기도 하고 이 패턴을 filter에 걸어서 주파수 특성을 시간에 따라 변화시키기도 한다.

### FM (frequency modulation)

FM synthesizer라고 하는 말이 꽤 흔한 데, 그것은 FM 방식으로 음을 발생시키는 신디사이저들이 꽤나 성공했기 때문이라고 생각한다. 

FM을 간단히 이야기 하자면, 어떤 기본 음색을 발생시키고 여기에 pitch-shifter를 걸어주는데, 이 때 pitch-shifter의 입력을 새로운 LFO의 출력으로 만들어놨다 라고 이해하면 편할 것 같다. 즉, 기본 음색 (carrier)가 있고 이것의 주파수를 다른 wave를 통해서 위 아래로 진동시키면 그것이 FM sound가 된다. 전형적인 것인 Rhodes EP라고 하는 음색인데 이것은 원조격인 Rhodes의 EP로도 인기를 끌었지만 DX7이라고 하는 digital synthesizer에서 본격화되어 사실상 80년대 대중 음악에서의 거의 모든 Electric piano sound의 근간이 되었다. 지금은 음의 발생 패턴이 하나의 공식처럼 되어서 이를테면 발생된 소리가 금속성을 갖게 만드느냐 혹은 유리와 같은 느낌을 만들어내느냐 등등을 적절히 믹스할 수도 있게 되어있다. 

#### 그외에 effect들

distortion/overdrive, delay, chorus/flanger/phaser 같은 것들은 synthesizer에서 일반적인 effect가 되어서 마음대로 조합이 가능하다. 


이제 슬슬 요약해보면,

1. synthesize를 위한 기본적인 term과 그 용도/원리를 잘 알아두면 원하는 음색을 만들어내는데 시간을 줄일 수 있지만, 완벽(?)을 추구하자면 한도 끝도 없고 들을 때 마다 소리가 다르게 들리는 경우를 생각하면 쉽지 않은 취미다.
1. synthesizer programming에 왕도가 없다. 자신이 애용하는 synth를 몇 대 정해서 그것만 죽도록 판다. logic에 있는 대 여섯개의 synthesizer는 쓰면 쓸 수록 참 좋다는 느낌을 받았다. 그 중에서 ES 2가 참 맘에 든다.
1. 그래도 이만한 재밌는 취미가 없다. 고작 소프트웨어 악기 몇 개로 80년대와 2020년대를 맘껏 넘나들 수 있다. 
