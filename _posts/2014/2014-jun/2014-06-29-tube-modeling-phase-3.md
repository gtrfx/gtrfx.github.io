---
title: "Tube Modeling..phase 3"
---
# Tube Modeling..phase 3

일단 가장 어려운 Tube 모델에서 출발해서 그것을 tube만이 아니라 plate follower를 통째로 modeling하는 과정을 통해서 앰프 시뮬레이션을 해보려는 시도를 해왔다. 


여러 번 얘기하는 바지만, 쉽게 생각하기로는 tube하나만 간단한 함수로 만들어서 나머지 회로와 구동하게 하면 되는 것 아니냐라는 생각할 수 있는데, 이게 그렇지 못한 것은 아날로그 회로에 zero-delay loop라는 특성이 있기 때문이라고 했다. 별도의 loop가 형성된다는 뜻이 아니라 일단 wire로 연결해 놓으면 그것이 초단이 되었든 가장 마지막의 출력단이 되었는 사싫상 동시간에 움직이는 회로라 아무리 큰 회로라도 어떤 부품을 새로 더하거나 빼거나 하게 되면 그 영향은 작든 크든 모든 부분에 영향을 미친다. 


이것이 나처럼 디지털 신호 처리에 길들여져 있는 사람에겐 독으로 미친다. 디지털 회로에서는 앞단의 처리 결과가 뒷단에 영향을 미치고, 사실 상 별 다른 feedback을 하지 않으면 뒷단의 처리 결과가 앞단에 영향을 미치지 않기 때문에 회로를 잘게 잘게 쪼개서 모델링하고 그것들을 조합하기만 하면 된다. 사실상 회로로 만들어버리면 가장 간단한 것이고, 디지털로 모델링하지 않으면 되는 일인데, 그 모두를 하지 않겠다고 해서 이 사단이 나는 거다. 


그래서 찾아낸 방법이 되도록이면 앞단에 영향을 미치지 않는 지점을 중심으로 회로를 쪼개서 모델링하는 방법이고, 이게 아마도 많은 기타 앰프 시뮬레이터들이 사용하고 있는 방법이기도 할 것이다. 그리고 진공관 회로를 디지털로 모델링하는 것이 가능했던 것이 사실상 정상적인 전압 범위에서 진공관이 동작하면 grid의 입력 저항이 엄청나게 커서 앞단의 결과가 뒷단에 영향을 줄 뿐이기 때문이다. 그러나 실제로 grid의 입력전압이 너무 높으면 grid를 따라 전류가 흘러들어가고, 그 때문에 앞단의 출력단 전압에 전부 변화가 생기고, 그게 어느 수렴점을 찾아서 계속 iteration을 해야되고, 특히나 C가 같이 붙어있으면 이것은 더 복잡한 식이되기 때문에 경우에 따라 영향을 받기도 하고 안 받기도 하게 된다. 그래서 모든 문제가 발생하게 되는 것이다.


그래서 이것이 실제 앰프의 plate follower와 정말 같다 치자! 그러면 plate follower를 제외한 부분은 어쩔 것인가? 이것들도 회로의 한 부분이라 결국엔 어딘가에 붙여서 같이 모델링해야 하는데, 너무 복잡해지는 것이다. 이렇게 되면 다양한 기타 앰프를 모델링할 수 없다. 하나 모델링하는데 너무 많은 시간이 걸리게 되니까.


그러면 다시 초점을 뒤로 돌리자. 정말 수도 없이 앞으로 가야되나 되로 가야되나 반복한 것 같다. 어차피 plate follower를 너무 복잡하게 모델하게 되면 프리앰프 회로 자체를 모델링하기가 어려워진다란 결론에 이른다. 그 이유는 plate follower만 너무 잘 모델한다고 모든 회로를 실제 아날로그회로처럼 하나의 몸뚱이로 전부 다 잘 모델할 수 없기 때문이다. 그래서 찾은 초기의 타협은 small signal model을 쓰고 나머지는 모두 filter로 도배하는 방법인데, 일단 이 방법은 증폭률이 너무 과다하게 계산되는 측면이 있었다. 실제의 회로는 cathode cap이 달라붙으면 bias point가 입력에 따라 왔다갔다 움직이면서 실제로 증폭률이 개선된 것처럼 동작하는데, small signal model에서는 그것을 모두 무시한다. 단지 그 효과를 저음이 깎여나가는 정도로만 필터로 모사할 뿐이다. 마찬가지로 기생 용량 (parasitic capacitance)또한 low pass filter로 모델할 뿐, 이것이 bias에 이바지하는 면은 모두 무시한다.


자질 구레한 것들은 모두 떼어내고 골자만 얘기하자.


다시금 grid를 중심으로 증폭단을 분리해내기로 하자. 방법이 없다. 다만 plate follower를 좀 더 사실적으로 묘사하자. 어차피 이 방법을 사용하면 grid limiting current의 효과를 제대로 흉내낼 수는 없다. 그것이 큰 함정이지만 나머지 회로 요소들에 더 신경쓰기로 하자. 더 많은 회로를 모델하는 데 쏟기로 하자. 더 이상 갈데가 없다. 제대로 하자면 한도 끝도 없고, 조금만 타협을 해도 귀가 먼저 안다.







