---
layout: post
title: "Concurrent feedback vs. Delayed feedback?"
author: "Keith"
---

1. 들어가며


아날로그 회로에서 feedback을 하는 경우에는 이미 여러 번 얘기했다시피 빛의 속도로 전파되기 때문에 우리가 다루는 음성 신호를 기준으로 보면 매우 빠른 시간에 수렴이 이루어진다. 즉, 실제로 회로에 신호가 전파해나가는 시간은 그 파장이 엄청나게 크고 그 속도도 엄청나게 빠르기 때문에 회로를 아무리 크게 만든다고 하더라도 순간적으로 전파된다. 따라서, feedback을 하는 과정에서 벌어지는 어떠한 변화도 단숨에 수렴해버리게 된다. 


반대로 디지털 세계에서는 엄청나게 oversampling을 하지 않는 이상 이런 일은 벌어지지 않고, 실제로 feedback이 일어났을 때의 수렴결과를 이용하든지 아니면 1 sample 또는 oversampling했다면 1/N sample 정도 밀리게 되는 것은 감수해야 한다.


간단하게 생각해 보면, 아날로그 회로에서는 입력으로 feedback 되는 출력의 위상 변화가 feedback loop에서 만들어낸 것 외에는 없을 것이다. 따라서, negative feedback을 하게 되면 회로에서 설계된 양만큼 위상차로 나타나서 증가 혹은 감소되어 나타나는 게 맞을 것이다. 반대로 디지털에서 1sample 밀리게 되면 추가적인 위상차를 극복할 수 없으니 그 오차 때문에 주파수가 커질 수록 원래 설계 대비 오차가 심하게 발생할 것이다. 따라서, 오버샘플링을 잔뜩 해서 샘플간 위상차를 줄이든가, 아니면 feedback gain을 작게 해서 위상차에 의한 오차가 미미하게 만들어버리면 되지 않을까??


일단 잘 모르겠으니 이 둘 간엔 어떤 차이가 있을까 생각해보기로 한다.




2. 간단한 계산


간단한 모델을 만들어보기로 하자.


1) Concurrent feedback


입력을 x라고 하고 출력을 y라고 할 때, 다음과 같이 쓸 수 있다.


y = A x


(A를 feedforward gain이라 생각한다.)


출력의 일부가 입력으로 다시 feedback된다고 하면 수식은 다음과 같이 세워진다.


y = A (x - B y)


이때 B는 feedback gain으로 보자.


결국, 이 feedback loop의 수렴결과는


y = A/(1+B) x


가 된다. Feedback gain에 1을 더한 값에 loop gain이 반비례하게 된다. 


이것을 주파수 측면에서 생각하면, feedback filter의 gain이 커지면 loop gain은 그것에 1을 더한 값만큼 작아진다고 보면 된다. 즉 feedback filter에서 부각되는 주파수 성분은 loop gain으로 볼 때는 감소하는 경향을 갖는다.


2) Delayed feedback


만일 feedback하는 성분이 1 sample 밀려있는 신호라고 가정해서 식을 풀어본다. Z-transform으로 다음과 같이 쉽게 풀린다.


y = A (x - B z^{-1} y)


즉 loop gain은 A/(1+Bz^{-1})이 된다. z를 주파수에 대해 해석하기 위하여 e^{jw}로 치환하면 금방 계산된다. 분모의 항이 주파수에 따라 값이 증가하는 모양새를 가지고 있기 때문에 high가 강조되는 결과를 초래한다. 결국, oversampling을 하면 실제 신호의 주파수 대역은 전체 대역의 일부가 되므로 영향을 덜 받게 되고, sample rate이 낮아질 수록 high가 강조되는 결과를 얻게 되는 것이다. 만일 이것이 delay가 없다고 하면 입력과 출력의 위상이 같아지므로 전대역에 걸쳐 고른 응답을 나타내게 될 것이다.


3. 응용


1) feedback loop가 없을때


feed-forward gain이 그대로 나타나며 feedback에 의한 gain control이 없으므로 사실상 최대의 gain을 얻게 된다. 


2) feedback loop의 주파수 응답이 매우 낮을 때


특정대역에 대해서 feedback loop의 주파수 응답이 매우 나쁘다고 가정하면, 이것은 loop gain의 증가를 가져오고 (feedback에 의한 gain의 감소가 없어지고) 반대로 주파수 응답이 좋다면 loop gain의 감소를 초래한다. 그러나, 수식에서 보다시피


- feedback loop의 feedforward gain에 비해 클 때 loop gain에 미치는 영향은 feedback loop gain의 역수가 될만큼 dominant하다 볼 수 있음.
- feedback loop의 응답이 좋지 않을 때엔 최대 feed-forward gain만큼의 이득을 얻게 되므로 추가적인 boost를 통해서 완벽한 주파수응답을 얻을 수는 없다. 


따라서, feedback loop의 주파수 특성이 중간음역대에 dip이 있는 경우라면, 전체 출력은 그 중간 음역대를 덜 줄여주는 정도에 불과하다. 그것도 feedback gain이 제법 커서 다른 음역대는 loop gain이 feedback gain에 비해 제법 감소했다고 할 때 그렇단 얘기다. 


4. 결론


아날로그 회로에서처럼 동시에 feedback이 이루어지는 경우를 디지털 세계에서 만들기는 쉽지 않다. 선형 부품으로 이루어진 네트워크라면 그대로 해석해서 수렴된 결과를 가져다 쓰면 되지만, 전체 loop가 비선형 회로로 되어있을 때는 풀기가 쉽지 않은 것이다. 이 때에 모든 비선형 소자의 특성을 그대로 반영하겠다면 별 수 없이 oversampling을 해주어야 한다. 지금 계산해본 대략적인 모델에서는 feedback gain이 그다지 크지 않은 경우라면 전반적으로 loop gain에 미치는 영향이 크지 않은 것으로 해석된다. 그러나 feedback gain이 feedforward gain에 육박하는 정도가 되면, 즉 출력의 대부분이 입력으로 다시 feedback되는 경우에는 출력과 입력의 위상이 얼마나 비슷한가가 중요한 문제가 되기 때문에, delayed feedback의 경우 그러한 위상차 때문에 주파수가 증가할 수록 오차가 늘어나게 될 것이다. 


그러나, 일반적인 경우에는 feedback gain은 그다지 크지 않으므로 sample rate을 증가시키지 않더라도 (아날로그 회로의 주파수 응답에 비해서) 전반적으로 큰 차이를 보이지 않을 것으로 보여진다. 그러나, feedback loop가 특정 주파수 영역에 대해 resonant한 성질을 가지고 있고 그 주파수가 높은데다 feedback ratio가 상당히 크다면 digital filter를 발산하게 할 수 있다. 이런 경우에 oversampling은 불가피하다.




