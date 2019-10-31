---
layout: post
title: "Fast convolution with FFT"
categories:
    - project
---

FFT로 컨볼루션을 하는 방법은 잘 알려져있다. 그러나 실제로 real-time signal processing을 할 때 어떻게 적용해야 하는지에 대해서는 별로 이야기 하지 않는다. 그냥 원리적인 관점에서 time-domain에서 convolution이 frequency domain에서 multiplication으로 바뀔 수 있다고 얘기할 뿐이다.

만약에 이 원리적인 이야기를 바탕으로 실제로 컨볼루션을 한다고 치자. 어떻게 해야할 것인가? 내가 받아들이는 신호는 stream으로 계속해서 밀려들어오고 있고, 일반적으로 알고있는 discrete time convolution이라는 것은 FIR filter밖에 아는 게 없고, FFT를 쓰면 빨리 할 수 있다고 하는데, 어떻게 해야되나? stream을 전부 다 받아와서 FFT를 때릴 수도 없고, signal sample block을 받을 때마다 계속해서 convolution해야 되는데 말이다.

또 경우가 다양해서 내가 받아온 sample block의 길이보다 내가 convolution해야 할 어떤 signal의 길이가 더 길다고 하면 (IR reverb 같은 경우) 이거 어떻게 해야되나?? 똑같은 길이의 신호 샘플을 다 받을 때까지 기다리고 있어야 되나? 이거 언제 다 기다리란 말인가??

그래서 작은 팁을 생각해내게 된다. 어떻게 하냐고? convolution은 linear operation이다. linear operation을 할 때의 장점(?)은 뭔가? 계산을 나눠서 해놓고 이어붙이기 할 수 있다는 것이다. 중첩의 원리? 라고 해서 가르치는 모양인데, 어쨌든 linear function은 f(x+y+z) = f(x)+f(y)+f(z)가 된단 말이다. 긴구간의 convolution을 못하면 작은 구간으로 해놓은 것을 중첩시킬 수 있단 얘기다. 이것은 큰 장점을 가진다. 이를테면 processor core가 여러 개인데 중첩의 원리를 적용 할 수 있다면 core로 연산을 다 분산시켜서 처리한 뒤에 합산하도록 할 수 있다. 실제로 audio signal의 convolution 하나 빨리 하자고 parallel processing을 하는지는 모르겠지만, image의 경우에는 linear filter를 적용할 때 core N개로 계산 구간을 쪼개놓고 중첩의 원리를 적용하면 처리시간이 엄청나게 줄어든다. (그래서 CUDA도 있고, NVIDIA 주식이 뒤늦게 미친 듯이 올랐고..인가?)

그러면 어떻게 적용시키느냐, A convoution B의 경우라고 할 때

- A가 B보다 훨씬 길다면, 또 B의 길이를 L이라고 하면,
    2L 길이의 FFT를 한다. 대신 앞에 L 구간에 B를 채우고, 뒤를 zero로 비워놓는다. 그렇게 해서 A의 첫번째 구간(L sized)과 convolution을 한다. 나온 결과가 2L개의 샘플이 될텐데, 다시 A의 두번째 구간에 대해서 convolution을 하고 앞서나온 결과의 후반 부 L개 샘플과 새로 나온 결과의 전반부 L개 샘플을 중첩(+)시킨다. 그런식으로 A의 모든 구간에 대해서 컨볼루션을 해나간다.
- 반대의 경우: 위와 반대로 하면 된다. 

계산을 해보나마나, 분명히 이런 생각을 할 것이다.

1) 아무리 FFT로 하더라도 한번에 받아오는 샘플의 크기가 커야 이득이 있을 것 같다: 맞다. 그래서 audio signal processing을 할 때 buffer의 크기가 큰 것이 유리하다. 대개 일반적인 응용범위에서는 128개에서 512개 정도 보고 있는데, 512개라면 latency는 좀 있지만 계산 효율은 훨씬 더 좋아진다. IR reverb같이 계산량이 크면 그 이득은 훨씬 더 커진다. 
2) Real number의 time-sequence에 대한 것이니까 FFT 과정의 연산량도 줄일 수 있지 않을까?: 맞다. 그런데 FFT를 내가 자체적으로 만들어도 그 효율은 fftw3에 비하면 특별히 엄청나게 최적화하지 않는 이상 당해낼 수가 없다. 내가 해봐서 안다. fftw3를 이길 수 있는 조건이 생각보다 그리 많지 않았다. 고생하지 말고 그냥 fftw3를 가져다 써라. 

여기서 real number signal에 대한 FFT에 대해서 잠깐 집고 넘어가자.
- real number signal을 FFT할 때는 imaginary number를 읽어오거나 계산할 일이 없어서 계산량이 크게 줄어든다. 그러나 이 계산 과정을 customizing하지 않는 이상 피해갈 수는 없다.
- real number signal의 FFT 결과는 0을 중심으로 대칭된 결과를 얻는데, 이게 conjugate 관계에 있는 complex number 쌍이 되므로 역시나 이 과정에서 (real number signal을 변환한 패턴과) convolution을 하고 IFFT로 되돌리는 과정에서의 연산량도 크게 줄어들게 된다.

분명히 FFT convolution 과정을 real number에 대한 것으로 한정하여 계산하게 되면 연산속도 및 memory usage 및 access가 줄게 되므로 큰 이득이 있다. 괜히 고생하지 말자. FFTW3에서 이것을 그냥 놔둘리 없다. 이를 위한 function도 아울러 제공된다. 혼자 똑똑한 척하면 머리와 몸이 다 같이 고생하게 된다.

예제를 하나 정도 잡아서 해결하는 방법을 보여줘야 도움이 될 것이라 생각해서 하나만 잡아보자.

예를 들어 내가 256 sample짜리 time domain IR을 가지고 있다고 하고 그것을 buffer size가 256인 stream에 적용한다고 하면, 위에서 얘기한 대로 따지고 보면 두 개의 size가 같으니까 그냥 256 FFT에 하면 되지 않겠느냐라는 말을 할 것이다. 

256 샘플에 불과한 time sequence이지만 실제로 주파수 영역에 가져다놓고 처리하려고 보면 zero를 padding해서 512개로 만들어놓고 여기서 실수 응답이므로 256+1개의 복소수 주파수 응답을 얻게 된다. 즉 512 FFT를 쓴다. 물론 실수 - 허수 변환이 되는 FFT가 된다. 여기에 맞춰서 동작시키려면,

즉,

1) 256개 샘플을 입력 버퍼에서 읽어오고 256개의 zero를 붙인다. 
2) 512 point FFT로 frequency domain sequence로 바꾸면 256+1개의 유의미한 결과를 얻음
3) 256+1개의 frequency domain response를 곱하여 FFT convolution을 한다. 
3) 512 point IFFT하면 256개의 유의미한 결과와 256개의 tail을 얻게 된다. 
4) 이전에 처리된 샘플 블록의 후반부 256개와 3)의 전반부 결과를 이어붙여서 내보내고, 후반부 256개는 다음번 계산을 위하여 보관한다. 

여기서 연산수를 비교해보도록 하자.

convolution을 생각하고 real number를 다룬다고 보면, N개 coefficient로 M개 data sample에 대해서 처리한다고 보면 MN개의 multiplication+add가 필요하다. N point FFT는 대개 log2 (N)에 비례하는 연산을 한다고 하는데, 이것은 어떻게 구현했느냐에 따라 차이가 생기는데,
데이터 구간을 절반씩 나눠서 overlap까지 해야 하고 하다보면 M과 N이 매우 크지 않고서는 큰이득을 보기 어렵다. 다만 FFT의 경우 optimize가 잘된 라이브러리를 가져다 쓰면서 생기는 약간의 이득은 있다고 본다. 

공학 문제는 늘 이렇다. 조건에 맞춰서 문제를 풀어줘야 한다. 고정된 해답이 없다. 제작비를 줄여야 된다고 하면 거기에 맞춰서 문제를 풀어야 되고, (아무리 많은 돈이 들더라도) 성능을 최대한 끌어 올려야 된다고 하면 거기에 맞춰서 문제를 푼다. 정말 공학 문제를 풀 때의 문제가 되는 것은 국어문제도 같이 풀어야 할 경우다. 성능을 최대로 끌어올리라는 것인지 제작비를 최소로 해야하는 것인지 이도 저도 아닌 요구를 할 때, 어떻게 해석해야 좋을지 모르는 일이 발생하기 때문이다.

분명히 애매모호하게 이야기해서 나중에 혹시라도 책임질 일을 만들고 싶지 않은, 아니 본인이 결정해야 할 내용을 실무자에게 떠넘김으로서 면피하려는 치졸한 행동임을 이해해야 한다. 이 꼬라지 보기 싫으면 실무자가 되지 않든가. 그렇다 이런 문제를 만나기 싫으면 공학은 배우지 않는 것이 좋다.