---
title: "Speaker Simulation.."
---
# Speaker Simulation..

Axetrak이 요새 한창 인기다..

이미 이 물건의 대박 조짐으로 나도 한 대 만들어볼까 했었으나..

역시 공간 활용문제로..아직은..때가 아닌듯..

아쉬운 김에..axetrak 홈페이지에 올라온 샘플과 내 프리앰프 출력을 이용해서..

흉내내기 꽁수를 잠시 써봤다..

MATLAB이 FFT하는데 도움을 주었다..

함 들어보실까나..?

아래는 Axetrak의 Peavey Triple X 샘플..

<audio src="/assets/images/5c4d59b29172b9ff93223584b325f374.mp3" controls preload></audio>

아래는 프리앰프 출력 샘플..
<audio src="/assets/images/371b15b0a4aaf6d5dd8d7426814e04ae.mp3" controls preload></audio>

아래는 흉내내기 꽁수의 결과..
<audio src="/assets/images/0374f3eba31975e306b4ffb9c6b360b9.mp3" controls preload></audio>



소리를 들어보면 알겠지만, 기본적으로 CD 같은데서 들을 수 있는 레코딩과 달리 저음이 상당히 크게 들려서 상대적으로 고음이 매우 빈약하게 들린다. 이것을 흉내낸 버젼 역시 저음이 크게 들리는데, 원래 흉내내고자 했던 target보다도 저음이 더 크게 벙벙대고 상대적으로 중음역과 고음역대가 더 약하게 들려서 더 멍멍하게 들린다.

이는 응답특성을 추정하는 과정에서 size가 작은 FFT를 이용했기 때문이다. FFT는 주파수를 linear scale에서 등간격으로 분석하게 되므로, 일반적으로 오디오 신호를 주파수에서 분석하는 방법에서는 주파수축을 log scale로 관찰하는 것과 다르다. 다시 말하자면, 여기서 주파수 응답을 분석하는 과정에서는 저음역에 대해서는 상대적으로 낮은 분해능으로, 고음역에 대해서는 높은 분해능으로 분석하게 되어서 저음에 대한 응답 특성을 추정하는데 상대적으로 오차가 많다는 얘기다. 따라서, 중요한 중간음역대와 고음역대가 작게 들린다.


