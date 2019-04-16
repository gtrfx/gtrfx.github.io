---
title: "TC2290 Delay Processor: Essentials"
---
# TC2290 Delay Processor: Essentials


구조는 일단 아래와 같다. 기본 구조는 일반적인 디지털 딜레이와 다름 없는데, 딜레이에 대한 컨트롤 로직과 엔빌롭 컨트롤이 복잡하게 되어있다는 차이만 있다.




대충 나눠보면,




0) Controllability: 다음 3가지 요소를 dynamic하게 컨트롤 할 수 있음

- delay time

- pan control

- VCAs

1) delay time

2) VCA: VCA가 총 3군데 적용되고, 같은 것을 3군데에서 같이 쓰는 것으로 보여진다.

- direct out

- feedback

- delayed out

3) Pan control




요약하자면, 딜레이 시간을 다이나믹하게 조정하고, 입출력/피드백 신호의 진폭을 어떻게 조정하느냐, 그리고 스테레오 효과를 위한 패닝을 어떻게 다이내믹하게 하느냐로 결정된다.




2개의 delay engine을 사용하고 각각의 엔진이 채널 1/2 (좌 혹은 우: 이것은 가상적임)를 담당하고, 각각의 엔진은 좌우측 출력이 있고 최종 출력은 두 엔진 출력의 합으로 구성됨.




구조까진 간단하다. 앞에서 지적했듯이 이 장치와 같은 파라미터를 설정하면 같은 뉘앙스의 소릴 얻는 게 가장 어려운 문제다. VCA의 알고리즘이 같은 수 없으니까 괜히 고생하지 말고 이 부분은 미리 포기하자.









![image](/assets/images/f2f6a6315fbe88286b367b5d8fa48890.png)



![image](/assets/images/5d3ecea9b2ce8d8142cbac3feb34c200.png)




매뉴얼에서 건질 수 있는 가장 중요한 부분이 딱 이부분인 것 같다. 더 자세히 나눠보면 아래와 같다. 






![image](/assets/images/d874d3fa2680f0aa16f16862472ad3bb.png)





