---
layout: post
title: "Fractal Audio - Axe Fx"
---

Guitar와 관련된 signal processor로 line6의 제품들이 한동안 인기를 끌었던 것 같은데, 그렇다고 해서 그 제품들이 어떤 'ultimate treasure box of tones'라고 보기엔 미달한 점도 많았고 버전업이 되더라도 사실 거기서 거기였다는 평가도 많고 나 또한 그렇게 생각해왔다. 이번에 나온 HD는 엔지니어들이 이런 저런 앰프의 시뮬레이트를 하다가 가장 그럴싸한 것들만 뽑아서 만들었는지 인기도가 높은 앰프 순으로 뽑았다기 보단 그저 구색갖추는 수준에서 골라진 16개 앰프 모델로 구성이 되어있다. 
본론으로 돌아와서 그 ultimate realistic guitar amplifier+cabinet simulator + multiple effects의 최고봉은 Fractal Audio의 Axe-Fx가 자리잡고 있다. 수많은 stomp box와 guitar amplifier model를 매우 정교하게 simulate하고 있는데, 그 면면을 잘 살펴보면 회로도가 대개 일반적으로 알려진 것들이 대부분이다. 다시 말해 회로를 근간으로 simulate한 것으로 보인다. 하나의 triode amplifier stage를 saturator와 filter로 구성하여 simulate하지 않고서 그렇게 정교하게 simulate하긴 쉽지 않을 것 같다. (회로를 근간으로 하지 않고 단순한 모델로 simualtor를 구성한 좋은 예가 line6의 simulator으로 보인다)
![image](/assets/images/12a7b59f6fff66130257524a1433f400.gif)TS201 아키텍쳐의 개략적인 블록다이어그램


Axe-Fx는 Analog Devices의 TigherSHARC TS203을 사용해서 만들어졌다고 하는데 (http://bit.ly/8ZAjNN) 개인적으로 이 DSP는 과거에 사용해본 적이 있기에 그 뛰어난 성능을 잘 알고 있다. 이와 비견이 되는 TI의 DSP에 비해 대용량의 내장 DRAM memory, 간편한 instruction, 편리한 개발 환경 (하지만 C 언어를 쓸 때 그 최적화 정도는 TI의 compiler에 비해서는 낮다고 알려져있다) 등등의 장점을 가지고 있다. 아마도 대개의 증폭기 모델은 최대한 간략화시켜 assembly로 구현했을 가능성이 높고 이를 별도의 microprocessor가 LCD display와 함께 control할 것으로 보여진다. 다시말해 TS203은 완전히 signal processing engine만으로 동작한다고 봐야할 것이다. assembly로 구현하게 되는 경우에 실제 가용 MIPS가 엄청날 것이므로 (음성 신호를 처리하기에는) 다양한 effect chain의 구성이 가능하고 풍부한 내장 메모리 덕택에 tail이 긴 reverb며 cab. simulation이 가능할 것이다.
TigerSHARC series는 음성 신호에 비해 sample rate이 수십 배나 높은 이동통신 신호를 처리할 수 있는 수준이므로 (이를 이용해서 기지국이 만들어질 정도니까) 비교적 부하가 높은 effect라도 다양한 effect chain을 구성하여 구현하는 것이 가능할 것이다.



