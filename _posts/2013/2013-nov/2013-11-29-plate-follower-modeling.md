---
layout: post
image: /assets/images/8a916c77c0a76402bf22655a065f10e3.jpg
title: "Plate follower modeling"
author: "Keith"
---


여태까지의 포스트를 통해서 대부분의 passive filter회로, 그것도 가장 큰 부분인 tone stack의 digital modeling을 완성했다. tone stack의 경우 3rd order IIR filter로 구성하면 되므로 연산량이 얼마되지 않는 특징이 있고, 사실상 아날로그 특성을 bilinear transform에서 s를 z로 대치하는 과정에서 발생하는 약간의 approximation을 제외하고는 그 어떤 타협도 존재하지 않는다는 장점도 가지고 있다. 




이제는 증폭단을 모델링하는 일만 남아있다. 기타 프리앰프의 대부분을 구성하는 증폭단이 plate follower이고 이것을 모델링하는 것은 사실상 기타 앰프의 모델링의 시작이자 끝이다.




12ax7이 들어간 회로는 다음의 특성 곡선을 통해서 설계/분석할 수 있게 된다. 곡선을 보면 plate voltage의 증가에 따른 plate current의 증가가 직선이 아닌 곡선으로 비선형 특성을 가지고 있고, grid voltage에 따른 곡선간의 간격도 일정하지 않아서 이 역시 nonlinearlity를 가지고 있음을 보여준다.




앰프를 설계하는 사람은 입력 전압의 변동 폭을 고려하여 12ax7 주변에 붙는 저항값을 결정하게 되는데, 그림에서 보는 바와 같이 비선형성을 덜받고 움직일 수 있는 grid voltage의 폭은 대략 커봐야 +/- 2Volt 정도가 됨을 알 수 있다. 기타의 경우 입력 전압 자체가 대략 +/- 1 Vpp로 볼 수 있으니까 사실상 전압을 별도로 제한하지 않는다면 1단만 증폭하게 되면 그 다음단에 12ax7이 또 붙게 되면 찌그러짐이 심하게 일어날 것이라는 사실을 쉽게 유추할 수 있다.




Plate follower의 경우는 여기에 plate resistor를 이용하여 load line을 그려서 동작점을 잡아준다. 그 동작점이라는 것이 입력이 0 V일때의 동작 조건을 말하는 것으로, 아래 그림을 대충 보면 B+를 350V로 잡았다 가정하면 cut off이 일어나는 grid voltage가 대략 4-4.5v 정도 이므로 하한을 -4v로 잡는다고 하고 grid voltage를 최대 0v까지 움직이게 설계한다면 입력 0v에 해당하는 grid bias는 대략 2v가 된다. 



![image](/assets/images/8a916c77c0a76402bf22655a065f10e3.jpg)




아래 그림은 증폭률 (mu)와 plate resistor를 나타내는 그림이다. 여기서 증폭률은 입력 전압대 출력 전압의 비를 나타내고 plate resistor라 함은 증폭기를 전압원으로 봤을 때 직렬 연결되는 내부 저항값을 나타낸다. 설명 자체가 이해하기 어려울 수 있는데 증폭률이 100이라 함은 입력전압이 1볼트 만큼 변화했을 때 출력 전압은 100볼트가 된다는 것을 의미하고, plate resistor라고 하는 내부저항은 외부에 부하가 달라붙어 전류를 흘리게 되면 그 전압이 떨어지게 만드는 요소로 해석할 수 있다. 


무슨 말이냐면 출력단으로 아무런 부하 (이를테면 저항 혹은 스피커 등등)가 걸리지 않으면 아래 그림의 증폭률을 얻을 수 있게 되지만, 여기에 저항이 무한대가 아닌 어떤 부하를 붙이면 그 부하로 전류가 빠져나가게 될 것이므로, 증폭소자가 이상적인 증폭소자가 아니므로 증폭률이 떨어지게 될 것이다. 그 정도를 나타내는 것이라고 이해하면 된다. 이를테면 plate resistor가 0이라고 하면 이상적인 증폭소자로 부하가 어떤 것이 되든 원하는 증폭률로 증폭이 가능하단 뜻이고(어떤 부하도 굴릴 수 있는), plate resistor가 매우 큰 값이 되면 어떤 부하가 붙게 되든 부하가 붙게 되면 증폭률이 크게 떨어지게 된단 의미가 되겠다.
 


![image](/assets/images/db1f9a122de9335556a1ec94632bccf0.jpg)






다시 본론으로 돌아와서, plate follower를 어떻게 모델할 수 있느냐에 대한 문제 해결해야 한다.




실제로 12ax7의 spice model은 매우 다양한데, 그 모든 비선형성을 다 반영하여 모델링을 하려면 너무나 많은 계산량이 필요하게 된다. 여러 가지 기타 앰프 회로를 검토해 본 결과, 우선은 가장 단순한 모델을 사용하는 게 맞을 것 같다.




1) B+/Load resistor를 바탕으로 증폭률과 plate resistor를 단순화된 공식으로 도출한다.

2) 주어진 조건에서 grid current 함수를 도출한다.

3) 1,2로부터 동작점을 계산하고 이로부터 선형동작 영역을 근사한다.

4) 1-3으로부터 clipper x multiplier의 구성을 도출한다.




여기서 별도의 필터링을 하지 않는 이유는 

1) high band cut-off은 대부분 기타 앰프의 주파수 영역에 비해 매우 높다.

2) low band cut-off은 cathode resistor/capacitor에 의하여 결정되는데 충분히 낮은 값이고, 별도의 RC filter는 별도로 처리한다.




대부분의 기타 앰프의 경우 grid bias가 -2v 근방에 설정되고 동작하는데, 일부의 하이게인 기타 앰프의 경우는 cold bias라고 해서 grid bias를 매우 낮은 곳에 잡아서 극심한 distortion을 유도하는 방법을 쓰고 있다. 이게 마샬 회로를 개조한 Soldano의 SLO회로에서 첨 등장했고, 최근의 많은 high gain amplifier에서 사용하는 방법이다 (Mark series는 제외).




grid current는 무시할 수 없는 경우도 존재하고 grid current가 존재하는 경우, grid bias상에서 변화가 발생하므로 이것이 또 다른 비선형 특성을 가져오게 되는데, 이것은 단순 모델로 시작해서 실물 앰프와의 차이점을 통해 확인해 나가는 것이 좋을 것 같다.




다시 정리하면, 초 간단 모델은 다음과 같이 구성한다.




1) 동작 조건: B+, load resistor ==> grid bias, mu를 계산

2) grid bias로부터 clipper의 상하한을 계산

3) clipper x mu의 간단 모델로 동작함




이상!





