---
layout: post
title: "Triode modeling"
---


그동안 triode amplifier stage를 모델링하다가 간과한 부분이 여러가지로 발견 되었다. 가장 큰 것은 이것이 small signal model에 기준해있었다는 것이고, 과도한 입력이 들어올 때에 대한 model이 반영되었긴 했으나 그게 실제의 tube와는 거리가 있었다는 것이다.




기본적인 생각은 tube model을 실 구현에 적용함에 있어서 불필요한 노동을 최소화하려면 다음을 생각해 봐야 한다는 것이다.




1) 지금 시장에서 잘 나가고 있는 Axe Fx라고 하더라도 이게 완벽한 tube model을 썼을리가 없다는 것이고

2) 완벽한 tube model이란 게 이세상에 없고, 다소 부실한 모델도 비선형 연산, 또 dynamic한 시뮬레이션에 들어가는 연산을 최고급 DSP라도 당해내기 만만치 않고

3) 그것들을 만드는 사람들이 그 정도로 뛰어난 지식의 소유자가 아니다.




라는 것이다. 즉, 사람이 이것이 실제의 앰프와 비슷한 소리다 아니다를 판단하는 수준의 모델링이 대체 어디까지인가 확인해야 불필요한 노동을 줄일 수 있다는 것이다. 어차피 완벽하지 않은 모델을 가지고 dynamic한 시뮬레이션 (전류와 전압을 모두 넣어서 계속해서 미방을 풀어내는)을 한다는 것은 불필요한 노동이다. 중요한 특색 몇 가지를 잘 살려서 모델링하면 그것은 타협이라고 보기 보단 똑똑하게 일한 것이 된다. 




1차로 적용한 모델에서는 small signal model에 근거해서 증폭률을 기준으로 해서 cut-off voltage를 미리 예측해서 clipping하고 grid limiting current 현상을 어설프게 넣어놓은 것인데, 단순한 클리퍼 + 필터 조합에 비해 그리 큰 차이가 없었다. 더 웃긴 것은 일단 게인이 올라가면 앰프의 구별 없이 특성이 죄다 비슷비슷했단 것이다.




다시 말해 대부분의 특성은 다 흉내를 냈지만, miller effect에 의한 miller capacitance에 대해서 반영이 되지 않았다는 차이가 있다. 즉 miller cap에 의해서 LPF가 형성되는데, 이게 반영이 되지 않아서 어떤 앰프로 뭉개거나 harmonic의 배합이 거의 같아지게 되니 특색이 다 날아가게 된 것이다. 더구나 high order harmonic이 죽지 않고 살아서 다음 단에서 또 찌그러지고 하다보니 high order harmonic이 계속해서 늘어가다보니 소리가 지저분해지는 것이다.




이것은 내가 parasitic cap의 크기가 워낙 작으니 무시한 것에 기인한다. miller effect에 의해서 parasitic cap은 증폭률만큼 큰 값이 되고 이게 입력 저항과 적절히 조합되면 cut-off freq가 작아져서 확실히 그 효과가 나타난다. 어쨋거나 이것을 반영하게 되면, tube model은 다음과 같아진다.




input clipper -> LPF (miller effect) -> amplify -> cut-off clipper -> load(or cathode) RC filter 




2차로 사용할 모델은 결국 miller effect에 의한 LPF가 추가된 모델이 된다.

---------

일단 이 모델은 실패다. small signal model이 증폭단이 안정되어있는 상태를 가정한 모델이라 입력이 과도해서 디스토션이 일어나는 상황에서는 잘 들어맞지 않는다. 단지 입출력 임피던스를 계산해서 filter의 bandwidth만 결정해준 꼴인데, 생각보다 좋은 결과가 나오질 않는다. 결국 상태방정식을 세워서 문제를 푸는 식으로 가져가야 가장 정확한 답이 나올 것인지. 





