---
title: "다이오드를 어떻게 다룰 것인가?..."
tags: [audvans]
layout: post
author: "Keith"
---

이미 다이오드 클리퍼에 대해서 한번 적어본 적이 있던 것 같다. 이 녀석의 특징이 특정 볼티지 이상의 전압이 걸리면 사실상 저항이 급격히 작아진다는 것. 반대방향은 전류가 흐르지 않기 때문에 전압이 다 걸린다. 대개 다이오드 클리퍼는 방향이 다른 다이오드 두 개를 병렬로 묶어놓기 때문에 역방향은 생각하지 않는다. 결국 +/- 양쪽으로 특정 전압 이상이 걸리게 되면 wire처럼 동작한다고 여겨지는 것이다.

문제는 실제의 다이오드는 그렇지가 않고 전압이 올라가면 아주 조금씩 흘릴 수 있는 전류의 양이 늘어나다가 특정 볼티지에 가까와지면 급격히 그 전류의 양이 증가한다는 것이다. 이게 전압에 정비례 하는 것이 아니니 '비선형'이란 얘길 하는 것이다. 일반적으로 exponential function으로 모델링한다. 그러니까 전류가 특정 전압을 넘어서면 기하급수적으로(=exponentially) 증가한다는 것이지. 

이미 진공관에서도 그랬듯이 다이오드도 전류와 전압의 관계를 통해서 방정식을 풀어주어야 된다. 왜 방정식을 푸냐고? 모르는 값이 있기 때문이다. 이를테면 저항과 다이오드가 연결된 경우를 예로 들면, 여기에 특정 전압을 인가하게 되면 우린 전체적인 전압이 얼마가 걸릴 것이다 까지만 알지 저항과 다이오드를 통해서 얼마만큼의 전류가 흐를지 바로 알 수 없다. 단순히 다이오드에 0.7v 가 걸릴테니까 (나머지_전압/저항값) 하면 전류의 양이 구해질 것 같지만, 이것은 대략 그러하다는 것이고 실제로 다이오드 모델에 따라 최대한 정확하게 계산하려면 일종의 점근법을 이용하여 근사해야 한다.

쉬운 접근 방법은 뭐 이를테면 0.7볼트로 시작해서 전류량을 계산하고, 그 전류량을 가지고 다이오드에 걸릴 전압을 역산하면 다시 다이오드에 걸리는 전압을 기준으로 저항을 통해 흐르는 전류량을 계산하고 다시 전압을 역산하고 하는 과정을 계속 반복하는 것이다. 일반적으로 Newton Raphson 방식으로 근사하면 몇반만 하면 곧바로 참값에 매우 근접한 값을 얻을 수 있다. 말이 참값이지 지수함수로 표현되는 다이오드 모델을 사용할 때의 값일 뿐이다. 실제의 다이오드는 이와 또 다르지만, 여기까지만 하는 거다.

어쨌든 이 과정을 통해서 우리는 다이오드를 통해서 흐를 수 있는 전류량과 전압의 관계를 얻을 수 있다. 이걸 이용하면 나머지 회로 소자로 흐르게 될 전류량과 전압을 계산할 수 있어서 그걸로 드라이브 페달의 시뮬레이션을 할 수 있다. 말로 하는 것은 늘 쉽다. 그래도 컴퓨터 언어로 기술하면 매우 정확하게 (여기에도 오차가 있긴 하지만 전자부품의 오차보단 엄청나게 작다) 묘사할 수 있고 실시간으로 재현할 수 있다. 그게 오디오 플러그인을 만드는 재미다.

비슷한 소리를 내는 게 아니라 실제의 전기회로를 컴퓨터로 emulation을 하는 것이다. emulation이 mimicking/simulating이런 말들과 비슷하게 들리고도 하고 그 말의 어감이 실물을 흉내내는 것이란 느낌이 있어서 진짜로 따로 있는데 가짜인 것이 진짜인 것 행세를 하는 것처럼 들릴 수 있는데, 그런 뭔가 저급한 느낌의 결과물을 내려고 이런 일을 하는 게 아니다. 컴퓨터(소형 마이크로프로세서도 포함이다)에 실물을 옮겨오는 것이다. 

인간의 지능을 월등히 압도하는 존재를 컴퓨터로 불러와서 매일의 생활을 할 수 있는데 고작 10개 이내의 진공관 증폭단을 못 불러온다는 게 말이 되는가? 인간의 부족함도 잘도 재현해 내듯이 전기 부품의 성질 (원래 물성이 그렇게 생긴 것이지 불완전함이 아니다)도 쉽게 재현해 낼 수 있다. 

우리가 원하는 것은 실물이 만들어내는 소리이지 실물의 질감 (진공관의 뜨끈한 느낌, 엄청나게 큰 덩치, 무게의 실물)이 아니다. 내가 원할 때 스위치를 켜서 컴퓨터에 실물을 등장시켰다가 그만하고 싶으면 사라지게 할 수 있어야 한다. 집안 한 구석에서 먼지만 쌓고 있다가 어쩌다 스위치를 켜면 온동네가 떠나갈 음량의 소리를 내서 민폐를 끼치는 물건이 아니라. 엄청난 유휴전력 (class AB라도 전력 소비가 꽤 된다 거기에 히터를 데우는데 들어가는 전력도 엄청나다)을 들여야만 되는 게 아니다. 