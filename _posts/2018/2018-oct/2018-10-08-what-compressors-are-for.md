---
layout: post
title: "컴프레서는 뭐하는 물건인가?"
tags: [compressor, dynamic effect]
author: "Keith"
---

## 들어가며

컴프레서는 흔히 쓰이는 이펙트이지만 정확히 무슨 일을 하고 있는지 이해하긴 쉽지 않다. 그런 의미에서 한번 자세히 알아보고 가야한다 싶다. 내 입장에서는 정리가 필요할 것 같기도 하고 말이다.

## 컴프레서의 개요

컴프레서는 다이내믹 이펙트라고 한다. 그러니까 입력 신호의 동적인 성질을 변화시키는 이펙트라는 뜻이다. dynamic(동적이다)라는 말은 음의 크기/파워(크기^2)의 움직임을 의미하고 그것을 변화시키는데 의미가 있다.

일반적으로 컴프레서의 용도는 다음과 같다.
- 작은 소리는 크게 만들어주고, 갑자기 튀는 소리는 너무 크지 않게 해준다.
- 서스테인이 짧은 소리는 서스테인을 길게 만들어준다.

간략하게 말하자면, 동적인 요소가 너무 큰 소리의 동적요소를 압축(compress) 해준다는 말이다. 다르게 해석하면 다이내믹 레인지를 줄여주는 것이다. 

이를테면 다음과 같은 경우에 사용한다고 볼 수 있다.
- 베이스 트랙을 녹음하는데, 나의 연주력이 그다지 안정적이지 않아서 소리의 크기가 일정하지 못한데, 결과물은 음량이 안정적으로 일정했으면 한다고 할 때 컴프레서를 쓸 수 있다. 
- 기타로 커팅 (스트로크)을 녹음했더니 스트로크시 힘의 차이에 의한 진폭 차이가 너무 심해서 peak가 나지 않게 믹스했더니 작은 소리들이 너무 묻혀버린다고 할 때, peak 부분의 진폭은 자연스럽게 감소시키면서 상대적으로 작은 소리들은 부각시켜서 전체적으로 진폭을 특정 범위 내에 유지되게 하고 싶을 때 컴프레서를 쓸 수 있다.
- 드럼 트랙을 녹음했더니 각 파트의 음량 차이가 너무 심해서 어떤 것들은 거의 들리지 않았다. 그래서 적당히 compress했더니 작은 소리들이 또렷하게 잘 들리게 되었다.

여기서 두번째와 세번째 경우는 비슷한 용도라고 볼 수 있고 3가지 다 모두 같은 경우라고 볼 수 있다. 그러니까 가장 중요한 기능은 너무 크게 솟아오르는 부분을 적당히 눌러줘서 (compress) 전체적으로 진폭의 큰 변화가 없도록 만들어주는 것이다. 

상대적으로 작아진 소리를 크게 만들어주는 역할도 할 수 있어서 결과적으로 음의 서스테인이 길어진 것처럼 만들어줄 수 있다. 그런 의미 때문에 compressor/sustainer라고도 한다. 

## 컴프레서의 파라미터

컴프레서의 파라미터들은 대개 다음과 같다.

0) threshold

이것은 해당 진폭을 넘어서는 신호에 대해서는 컴프레스를 하겠다는 것을 의미한다. 따라서 threshold를 낮추면 낮출 수록 크기가 낮은 신호들까지 진폭을 눌러주겠다는 것을 의미한다. 반대로 높이면 진폭이 큰 신호도 컴프레스하지 않겠다는 것을 의미한다. 다시 말해서 낮으면 낮을 수록 심하게 압축한다고 이해하면 된다.

1) compress-ratio

진폭을 압축할 때 압축 비를 의미한다. 대개 이것을 그래프의 기울기로 표현한다. 1:1일 때는 압축하지 않는 것을 의미한다. 즉 입력과 출력의 진폭이 같다는 뜻이다. 출력이 더 큰 진폭이 되게 하는 경우를 expender라고 하는데, compressor는 출력이 작은 진폭이 되게 한다. 즉, threshold를 넘는 진폭의 신호에 대해서는 비율을 낮춰서 (저단 기어를 써서) 일부러 출력의 진폭을 낮추겠다는 뜻이다. 이 값이 크면 클수록 진폭의 변화를 더 심하게 누르겠다는 뜻이다. 이 값이 무한대가 되면 사실상 찌그러뜨리겠다 - distortion과 같아진다. 결국 디스토션을 일으키는 것은 극한적인 컴프레서/하드 리미터라고 이해하면 된다.

2) attack: time

어택이란 악기를 쳤을 때 그 신호의 진폭이 처음 강하게 솟아오르는 부분을 말한다. 컴프레서의 attack이란 파라미터는 일종의 타임 윈도우에 해당한다. 그러니까 이 타임 윈도우의 길이를 갖는 큰 진폭의 신호는 컴프레서를 피해가게 된다는 말이다. 

그러니까 threshold를 넘는 신호가 들어오더라도 이 타임 윈도우 안에 있는 신호는 컴프레스를 덜하고 내보낸다는 것이다. 컴프레서가 무조건 threshold를 넘는 신호를 눌러대면 그 출력은 다이내믹을 완전히 잃어버린 신호가 되는 것을 줄여주는 기능이다. 이것보다 큰 소리가 더 오래 지속되면 그 다음부터는 컴프레서가 주어진 컴프레스 비율만큼 진폭을 줄여버린다.

3) release: time

입력 신호가 threshold 아래로 떨어지더라도 해당 time window만큼 컴프레스를 지속한다는 것이다. 다르게 해석하면 이 타임 윈도우 내에서 threshold를 넘어가는 신호가 다시 발생하게 되면 계속 같은 비율로 컴프레스하게 되고, 그렇지 않으면 컴프레스하지 않는 (1:1 비율로 내보내게 되는)다는 말이다.

4) (make up) gain

위에 설명한 대로 컴프레서를 걸어주면 출력의 진폭은 줄어들게 된다. threshold가 낮을 수록 compress ratio가 클 수록 심하게 줄어든다. 이것을 보상하기 위해서 gain을 주는 것을 말한다. 컴프레서에 따라서 자동으로 게인을 보상해주기도 하고 고정된 게인으로 보상해 줄 수도 있다.

## 다른 시각으로 이해하기

음의 세기를 빛의 세기로 바꿔놓고 이해를 하면 컴프레서는 오디오 세계에서 일종의 레벨 조정을 하는 것이라고 볼 수 있다. 즉, 하나의 화면 안에 엄청나게 밝은 피사체와 어두운 피사체가 있다고 할 때, 밝은 피사체 때문에 상대적으로 어두운 피사체는 훨씬 더 어둡게 나타날 수 있는데, 이 때 밝은 피사체의 빛의 세기를 적당히 줄여주면 상대적으로 어두운 피사체들이 잘 보이도록 만들 수 있다. 밝은 피사체의 빛의 세기를 꾹 눌러주는 그 작업이 오디오에서는 컴프레서가 하는 일에 해당한다. 어찌 되었거나 원래 신호의 다이내믹을 줄여버리는 일이기 때문에 쓸데없이 많이 쓰면 마치 영상에 깍두기 무늬들이 많이 나타나거나 잡음이 부각되는 것처럼 오디오에서도 유사한 폐해를 얻게 된다. 

영상과 마찬가지로 오디오에서도 최대한 좋은 음원을 얻도록 하고, 이러한 이펙트는 최소로 사용하는 것이 좋다. 그러나 최근의 추세는 컴프레서를 과하게 걸어서 얻어지는 효과를 부각해서 이것을 음악의 새로운 요소로 사용하는 이들도 제법있다. 보는/듣는 관점에 따라 다른 게 있으니 사실 꼭 뭐가 좋다/뭐가 나쁘다는 할 수 없다. 따라서 컴프레서를 걸었더니 마음에 드는 소리가 나느냐 안나느냐가 사실 더 중요하다고 볼 수 있다. 

## 부작용

컴프레서를 언제 쓰는 것이 좋고 언제 쓰지 않는 것이 좋은가 생각해 볼 수 있다.

### 쓰면 좋은 경우

- 연주자의 기량이 그다지 좋지 않거나 녹음 상태가 안정적이지 않아서 안정된 출력이 나와야 함에도 진폭의 변화가 불안정한 경우에는 컴프레서를 걸어주는 것이 듣기에 좋을 수 있다. 반대로 연주자가 일부러 강약 조절을 잘 해서 녹음했는데 컴프레서를 걸었다면 그 부분의 다이내믹은 대부분 날아가는 것으로 보면 된다.
- 입력에 포함된 특정 악기의 음량이 가끔씩 너무 커서 나머지 악기들의 소리를 제압해 버리는 경우에 해당 악기의 성질은 최대한 유지하면서 나머지 악기들을 부각시켜야 할 때 사용하면 좋다.

### 쓰면 안 좋은 경우

- 잡음이 많이 포함된 소스의 경우 컴프레서를 잘못 걸어주면 전반적으로 소리를 먹먹하게 만들고 잡음까지 부스트해서 최악의 결과를 초래할 수 있다.
- 너무 컴프레스를 심하게 걸면 듣는 이에게 부자연스러운 느낌을 주게 된다. 

## 용도의 예

### 일반적인 용도

컴프레서의 가장 일반적인 용도는 입력 신호중에 섞여있는 소리 중에서 특별히 중요한 음색의 진폭이 크지 않아서 전체적인 다이내믹 희생해서라도 그 부분을 부각시키고 싶은 경우에 사용하는 것이라고 보면 된다. 이를테면 다양한 키의 사람들이 모여 서 있을 때, 밖에서 바라보면 키큰 사람들의 얼굴만 잘 드러나 보이게 되는데, 이때 키가 적당히 큰 사람들의 얼굴도 보고 싶다고 하면 키가 큰 사람들을 강제로 눌러버려서 키 작은 사람들의 얼굴도 보이게 만드는 것과 같다고 볼 수 있다. 사실 이것은 대부분의 다이내믹 이펙트의 용도라고 봐도 된다.

### 기타
- 커팅을 하는 경우 음의 진폭을 고르게 만드려고 할 때 (스트로크 강약에 의한 음량 차이가 심한 경우) 
- 베이스 녹음을 할 때 어택을 다소 희생하더라도 전체적으로 베이스의 음색을 도드라지게 하려는 경우.

### 드럼
- 전체적으로 다이내믹은 좀 줄이더라도 드럼의 모든 요소들의 소리가 잘 들리게 하려는 경우: 그러나 이게 심해지면 어택이 큰 소리들 (스네어/심볼)은 본래 음색과 많이 달라져서 부자연스럽게 들릴 수 있다.

