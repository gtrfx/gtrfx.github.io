---
layout: post
image: /assets/images/678e656d06511ab2140c8df091220be1.png
title: "Accurate Plate Follower C Mode (2)"
author: "Keith"
---


지난 포스팅에서는 C가 없고 R만 달라붙는 경우에 대한 모델링에 대해서 얘기했는데, 이번에는 C가 달라붙는 경우도 생각해 보기로 한다.




R만 있을 땐 현재의 상태가 과거의 상태와 아무런 연관이 없다. 전원이 인가되면 빛의 속도로 전류가 흘러들어 어떤 상태로 안착되어 각각의 node voltage와 branch current를 나타내게 되고, 전원이 해제되면 빛의 속도로 전류가 빠져나가 모든 branch의 current가 0이 된다. 




반면 C가 달라붙게 되면 R만 있는 경우와 달리 회로가 과거 상황을 기억하는 능력을 갖게 되어 이전 상황과 현재 상황의 연관성을 갖는 성질을 갖는다. 즉, 전원이 인가되면 C가 충전됨에 따라 bias voltage가 시간에 따라 변화한다. 바로 직전에 C가 얼마나 충정되었는지, 또 지금 C에 얼마만큼의 전류가 흘러들어가는 지에 따라 회로 동작은 시시각각 달라진다. 아날라고 회로의 동작을 디지털로 가져간다 함은 실제로 무한히 잘게 쪼개지는 아날로그 세계의 시간에서, 정해진 크기 만큼의 시간으로 크게 쪼개서 그때의 snap-shot을 찍어가는 것과 같다고 볼 수 있다. 




이는 1초에 24장 혹은 30장의 그림을 찍어서 눈으로 보이는 아날로그 세상을 저장하고 재생하는 과정과도 비슷하다. 즉, 귀가 어설픔을 눈치챌 수 없는 주기 (1/44.1k)로 회로의 snap-shot을 찍듯 C의 전압에 따라 변화하는 회로 상태를 시뮬레이션해내는 것이다.




아래 그림을 보면 plate follower에 C가 달라붙는 경우를 나타낸 것이다. 여기서 실제로 입력단과 출력단에 C가 붙는 경우를 뺐다. 그럼에도 불구하고 4개의 cap이 있다. 여기서 생략한 하나의 cap (Cpc, parasitic cap)을 더 추가하면 5개의 cap이 되는데, 이 회로를 분석하려면 5개의 state variable이 생겨나는 것이다. 다시 말하자면 5원 비선형 연립방정식을 풀어야 된다는 얘기다. closed form solution이 없으니 수치해석적인 방법으로. 그것도 1개의 증폭단인데. 









![image](/assets/images/678e656d06511ab2140c8df091220be1.png)Plate Follower with several caps







여기서 일단 타협에 들어가서 비교적 영향이 작은 parasitic cap은 다 떼 버리고, 기타 앰프에서 흔히 보여지는 몇 가지 패턴에 대해서만 별도의 식을 세워서 접근하는 것이 가장 빠르다고 보여진다. 패턴별로 모델링을 해보도록 하자.




0) Parasitic cap




Parasitic cap중에서 가장 큰 영향을 주는 것은 Cpg로 Plate와 grid간에 기생하는 capacitance인데, 매우 중요한 역할을 한다. R만 달라붙어있는 plate follower라고 하더라도, 실제로는 memory를 가지고 있는 time-variant한 circuit이 되고, 이것이 회로 동작을 느리게 만들어 일종의 high-cut filter가 되게 한다. 이것은 default cap으로서 나머지 패턴 모두에 기본으로 적용이 된다고 볼 수 있다.




식을 세워보면 착하게도 R만 붙어있는 지난 번 수식에 grid와 plate voltage의 time-derivative가 추가된 다음의 형태가 된다.











수식을 척 보면 전압의 시간 변화가 빨라지면 거기에 대한 상대적인 저항이 생기는 수식으로 보여진다. Sine wave를 넣고 이 때의 출력을 측정하여 그래프를 그려보면 다음과 같다. Cpg는 대부분 2.4 pF 정도로 놓는데 여기서도 그렇게 넣어보았다.

![image](/assets/images/ee19986f648f307b8fba50a94c017787.png)






이미 Miller effect에서 익히 알아온 것과 같이 parasitic cap의 high-cut 효과는 증폭률에 영향 받는 것으로 되어있는데, 사실 위의 수식을 보면 C와 Rg, Rp에 영향을 받는다고 보는 것이 더 정확하지 않을까 한다. 어쨌든 3가지 경우에 대해서 실험한 것을 보면 Rp가 클 수록, Rg가 클 수록 입력 신호 변화에 더 민감하게 반응한다 (회로 입장에서는 더 반응이 느려진다) 볼 수 있다. 그것은 실제로 parasitic cap으로 흐르는 전류량이 줄어들어 충방전이 느리게 되기 때문이라 이해해도 될 것 같다.




1) cathode cap




AC에 대한 gain을 증가시키는 대표적인 방법으로 parasitic cap이 있는 경우에 대해 역시나 cathode voltage의 변화에 저항하는 성분 하나를 더 추가하여 수식을 아래와 같이 쓸 수 있다. 기존의 방법과 달리 이 방법은 state variable을 Vgk, Vpk에 맞추고 있음을 이해하시라. 내가 보기에는 이 수식이 기존의 다른 ODE 수식들 보다 더 간편하게 느껴진다.


















cathode cap이 붙지 않는 경우, cathode voltage가 grid voltage증가와 같은 방향으로 증가하기 때문에 실제로 증폭에 이바지하는 전압 grid-cathode voltage의 증가가 실제로 커지지 않게 된다. 그런데, cathode cap이 붙고 입력 신호가 충분히 높은 주파수의 교류가 되면 cathode voltage의 변화는 줄게 되므로 실질적으로 grid-cathode voltage가 증가하게 된다. 결국 입력신호 전압의 변화가 plate current 변화에 미치는 정도가 커지게 되므로 증폭률 증가에 기여하게 되는 것이다. 




아래 그림은 Cathode cap을 붙여놓고 시뮬레이션한 결과이다. Sine wave의 frequency를 바꿔가며 증폭률을 확인한 것이다. 이론적인 회로 분석 결과와 거의 같은 결과를 얻는 것을 확인할 수 있다. 단, 여기서는 Cpg를 계산에 넣지 않았다. (그래서 고음 응답이 좋게 나타난다).C cap과 Rk간 관계는 어느 주파수부터 증폭률이 개선되는지를 결정한다. 좀 벗어난 이야기지만 펜더 트위드의 프리앰프는 Ck=25uF로서 기타가 커버하는 모든 영역에서의 증폭률을 최대한 (cap 없을 때 대비 거의 6dB)끌어올리고 있고, 하이게인 프리앰프의 경우 초단에서 저음이 많이 증폭되면 찌그러진 신호의 결과가 너무 푹 퍼져버리는 단점을 개선하고자 Cathode cap을 1 uF정도로 놓기도 하고, 저음 찌그러짐을 싫어하는 경우는 (Marshall JCM800) 더 작은 값의 cathode cap을 쓰고, 그 결과도 HPF로 더 저음을 깎아내기도 한다.






![image](/assets/images/8ae18ebab42aa1ddba14657e2348941d.png)










2) Plate Cap




Plate cap의 역할은 high cut을 하는 것인데, Simulation model에서도 아주 잘 나타나고 있다. Plate cap과 plate resistor값의 관계가 high cut이 일어나는 주파수를 결정한다. 대부분의 하이게인 프리앰프의 3혹은 4번째 단의 플레이트 저항에 cap이 붙는 것은 이렇게 high cut을 통해 발진을 막기 위함인 것이다. 증폭률이 매우 높아서 3-4번째 증폭단에 이르게 되면 전반적으로 신호가 엄청나게 커지게 되는데, 저음의 벙벙거림을 막기 위해 1-2단에서 저음을 많이 깎아내다보면 3-4단에서 고음이 매우 커지게 되는데, 이 때문에 전류를 많이 끌어쓰게 되면 이게 다시 초단 전압에 영향을 미치고, 그게 다시 증폭되고 하다보면 발진이 발생하게 된다.



![image](/assets/images/9df8258701147e14847eb76d18917cd6.png)




이로서 C로 plate follower를 시뮬레이션하는 class를 간단히 꾸며보고 그것을 통해 일반적인 몇 가지 케이스를 테스트해보았다.








