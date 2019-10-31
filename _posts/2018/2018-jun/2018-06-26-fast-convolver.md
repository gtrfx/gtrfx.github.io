---
layout: post
title: "Fast Convolver"
tags: [FFT, convolution, audio, signalprocessing]
categories:
    - computer
---

Convolution 연산은 실제로 많은 연산량 (곱하기+더하기)이 필요한 연산으로 알고 있다. 실제로 FIR filter와 같은 것이 digital 영역에서 convolution을 실현한 것인데, 실용적으로 사용되는 FIR filter의 경우에는 convolution 연산을 수행하는 filter의 길이를 최대한 (계산량 때문에) 짧게 디자인한다. 얻고 싶은 필터 성능을 만족하는 정도에서 최대한 짧은 것을 선택한다. 그래야 계산량도 작고 응답특성 (주로 delay)도 좋아지기 때문이다. 물론 짧으면 다른 단점이 생길 수 밖에 없지만 (주파수에 따라 세밀하게 제어할 수 있는 정도가).

그런데 IR이라고 해서 impulse response를 곧바로 적용해서 쓸 수 있는 이펙트들이 제법있다. 이 때 IR들은 길이가 꽤 길어서 수 ms에서 수 second에 이르는 경우도 있다. 대략 샘플 수로만 봐도 수천개에서 수만개, 수십만개 짜리가 되는 것이다. 이것들을 실시간으로 convolution해야 한다. 

이 과정은 일반적은 convolution 연산, 즉 multiply-and-add를 사용해서 하면 효과적으로 해낼 수가 없다. convolution과정을 Fourier transform으로 변환하면 곱셈으로 바뀌는 성질을 이용해서 FFT(fast Fourier transform)를 이용해서 구현하게 된다. (학교에서 FFT를 가르치는 이유는 특별한 것이 없고 FFT는 현대 사회에서 특히나 EE 전공자들에게는 +/-나 마찬가지로 흔하게 쓰이기 때문이 아닐까 한다.)

어떻게 구현하느냐? 

일반적인 상황에서는 convolution을 하려는 어떤 filter의 response가 입력에 비해서 대단히 짧다. 실시간으로 처리해야 하는 경우에는 무한대의 길이를 갖는 input stream에서 한 샘플씩 받아서 convolution을 할 수도 있고, N개 단위 샘플 블록으로 받아서 처리하게 되기도 한다. 이 경우에는 convolution해야 할 샘플의 길이가 짧으니 있는 그대로 convolution하게 된다.

그런데 만일 convolution하려는 filter의 크기가 커지면 그것을 FFT한 결과를 입력 샘플 블록을 FFT한 결과와 1:1로 곱한 뒤에 다시 IFFT하는 과정을 통해서 convolution을 계산하게 된다. 어느 정도 길이가 되어야 FFT를 하는 것이 유리한지 아닌지는 구현방법이나 경우에 따라서 다 다르기 때문이 테스트해보아야 알 수 있지만, filter의 길이가 수천개 샘플에 이른다 하면 사실 더 고민할 게 없다. FIR filter의 경우도 대개 수십개 샘플 정도가 되도 길다고 보고 있으니까 수천개 샘플에 대해서 convolution해야 한다면 더 생각할 게 없다. FFT/IFFT 왔다갔다 하더라도 그게 더 이득이 될만큼 FFT의 속도가 빠르다는 이야기도 될 듯하다. (~~만일 FFT라는 게 나올 수 없게 연산 상의 규칙성을 통해 축약이 불가능했다면 전자공학 분야의 발달은 매우 더뎌지지 않았을까 하는 생각도 하게 된다.~~)

이 때는 convolution을 해야하는 입력의 블록단위가 필터의 길이보다 많이 짧다. 이때는 거꾸로 생각해서 입력 신호 블록이 거대한 filter response에 convolution되는 것으로 생각한다. 그런데 FFT라고 해서 막연히 큰 point수의 FFT를 한다고 해서 성능이 좋아진다고 볼 수 없다. 그만큼 큰 블록을 처리해야 하기 때문에 latency가 증가하기 때문이다. 

따라서 N개 샘플 블록을 받아서 처리해야 한다면 L(>> N)개 샘플 길이를 갖는 filter response를 처리할 때 L point FFT를 하는 것이 좋지 않단 얘기다. N개씩 받아서 L개가 될 때까지 기다려야 하기 때문이다. 

이것을 구현할 때는 overlap-add의 방법을 사용한다. 우리가 적용하는 연산과정이 모두 linear하기 때문에 가능한 것이다. 이게 무슨 말이냐면 N개 샘플을 받았다고 하면 가장 가까운 size의 FFT의 2배가 되는 size의 FFT (이를테면 2N)를 통해서 fast convolution을 한다. 절반의 입력은 0을 채운다. 그러면 출력의 절반은 filter의 tail로 채워질텐데 이 부분은 다음번 출력의 절반과 더해서 최종결과를 얻는 방법이다. 

즉 N개 샘플블록을 받아서 L개 샘플로 구성된 impulse response와 convolution을 한다고 보면, L개 샘플로 구성된 impulse response는 L-1개의 tail이 있다는 말이므로, 최소 2L point FFT를 해야 한다. 따라서,

1. L개 샘플로 구성된 impulse response를 2L point FFT로 변환해서 보관한다.
1. 입력 N(<<<L)개 샘플을 하나의 블록으로 받아서 받아서 2L point FFT를 한다. 
1. 위 결과를 곱한 후 IFFT한다. 그래서 얻어진 2L개 샘플에서 N개를 내보내고 2L-N개는 보관한다.
1. 2번 과정을 되풀이하고 앞서 보관한 2L-N개 샘플과 다음 과정에서 얻어진 2L개중 앞부분의 2L-N개를 더하고 가장 앞부분 N개를 내보낸다. 나머지 2L-2N 개는 보관하고 이 과정을 총 L/N개 블록동안 계속해서 되풀이 한다. 

결국 N개 샘플로 구성된 블록을 받아야 되는 조건이라면 1 x 2L point FFT (IR의 frequency response)와 매 N개 샘플 입력시 2L point FFT/IFFT를 반복한다. 

이 과정에서 수행시간을 단축시키려면 N개 샘플 입력에 대한 2L point FFT에서 0이 입력되는 부분을 과감히 잘라내는 것인데, 이것은 변형된 FFT가 되는 셈이다. 