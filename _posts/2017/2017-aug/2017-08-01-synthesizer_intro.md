---
title: "Learning a Synthesizer: Introduction"
categories: 
    - music
    - learning
---

신디사이저라고 하면 흔히 생각하듯 VCO(LFO)와 VCA 같은 것들의 복잡한 조합으로 이루어진 악기라고 생각한다. 그래서 그 원리를 별로 알고 싶어하진 않지만 (머리 아플테니) 신디사이저 프로그래밍을 잘하면 멋진 음악을 할 수 있을 거란 생각은 한다. 그런데 막상 신디사이저들을 들여다보면 모든 게 너무 쉽지 않다. 지금 나와있는 수많은 신디사이저 소프트웨어 악기들을 보면 단순화시키고 간단해진 구성의 UI를 하고 있어도 여전히 어렵기는 마찬가지다. 

개인이 신디사이저를 마련하기엔 가격이 꽤 비싼 편이었던 시절엔 모듈형의 신디사이져라든가 그보다도 더 단순한 구성의 사운드 모듈 같은 것들이 나름 유행했다. 사운드 모듈 안에 거의 모든 팝음악의 소리들이 다 들어있다고 생각해서 혼자서 밴드 음악을 카피해보기도 하고 작곡이라 부르긴 뭐하지만 그런 일들도 했다. 어쨌든 이것들도 신디사이저인지 아닌지 잘은 모르겠지만 비슷한 것이 아닌가 했었던 것 같다. 실제로 신디사이저를 구입하는 사람들도 있었지만 역시나 기본으로 들어있는 패치에 의존하지 책을 제대로 펴놓고 신다사이저 프로그래밍에 대해서 공부하는 사람들은 보기 어려웠다.

밴드 소속이고 어떤 유명한 곡을 커버해야 하는 경우에도 신디사이저 자체의 프리셋을 이용해서 가장 근사한 소릴 내려고만 했지, 각각의 패치를 편집해서 원하는 소리를 내려고 하던 이는 내 평생 본적이 없다. 잘은 모르되 각각의 신디사이저마다 특색이 있다고 해서 KORG, YAMAHA, ROLAND의 유명 신디사이저들을 여러 대 사서 건반 랙에 올려두고 공연 할 때 들고 나가던 게 유행이 되긴 했던 것 같다. 손은 단 두개 뿐이지만 서로 다른 건반을 누르고 있으면 무슨 이유인지 정말 근사한 음악을 하고 있는 것 같아보이니까 말이다. 물론 라이브시에는 하나의 신디에 하나의 패치만을 올려놓을 수 있으니까 동시에 여러 가지 소리를 내려면 불가피한 일이지만, 하나의 손으로 아무리 음을 많이 짚어봐야 4개 정도밖엔 안되니까 (왜 다섯개가 아닌지는 알아서들 생각하시고) 역시나 한계가 있는데, 그래서 더 풍성한 소리를 내려는 밴드는 건반 주자만 두 명을 데리고 있는 경우도 있다. 

말이 좀 샜는데, 신디사이저 프로그래밍이라고 해서 신디사이저의 기초적인 요소들을 조합해서 원하는 소릴 만들어내는 일을 알아두면 좋을 것 같단 생각을 많이 하게 된다. 요새는 기능이 엄청나게 막강한 신디사이저도 용량이 그리 크지 않은 컴퓨터 소프트웨어로 보급이 되고 있는 세상이라 그만큼 다양한 시도를 해볼 방법도 많고 예전에 크게 히트했던 신디사이저도 모두 디지털로 모델링되어 응용 프로그램으로 나오고 있는 시절이니 뭐든지 할 수 있는 시절이 되었구나 싶지만 문제는 아무리 좋다고 하더라도 사용할 줄 모르면 무용지물이란 것이다.

구체적으로 다음에 대해서 알아보기로 한다.
- 신디사이저의 구성 요소
- 소리의 기본 요소
- wave 별 소리 특성
- arpegiator
- 신디사이저 프로그래밍

어떤 정형된 틀이 있는 신디사이저가 아닌 구체적인 웨이브와 간단한 명령을 이용하여 신디사이저를 프로그래밍하는 방법을 생각하려 한다. 