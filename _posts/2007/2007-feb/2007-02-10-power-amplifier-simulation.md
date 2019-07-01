---
title: "Power Amplifier Simulation.."
---
# Power Amplifier Simulation..

Power amplifier distortion의 효과를 보기 위해 아래와 같은 50W power amplifier에 대해 실험해봤다..

![image](/assets/images/ec09d79b62c6fa932ffe5b897e303308.jpg)
예전에 쓰던 트랜스포머 모델은 뭔가 문제가 있어서 (모델 내부 node의 일부가 floating된 것 같음) time domain에서 simulation이 되지 않았는데, 오디오용으로 나온 다른 트랜스포머 모델을 쓰니 그럭저럭 도는 것 같다. 1000Mohm을 달아놓은 곳은 모델이 UL tap 및 4, 16 ohm tap에 대해 별도로 모델링되어 floating으로 둘 수 없어서 연결해 놓은 부분이다.

결과를 대충 보자면..

1) feedback 유/무에 따른 회로의 주파수 특성에는 큰 차이가 없으나, feedback 하는 경우 저역이 다소 커짐 (feedback이 없는 경우에 비해 전체 gain이 저역에서만 덜 줄어듬)
2) feedback하지 않는 경우 gain이 크게 늘면서 phase splitter에서 낮은 voltage에도 distortion이 생김 

회로를 눈으로 더 관찰해보면 

- phase splitter의 cathode 저항 값이 얼마냐에 따라 phase splitter의 distortion이 결정된다.

power amplifier에 따라서 이 저항값을 바꿔 줄 수도 있게도 되어있다.

- 출력관의 bias voltage가 얼마냐에 따라 power tube distortion이 결정된다. 

EL34(-39V?)의 경우 6L6(-51V?)에 비해 bias voltage의 절대값이 작으므로 일찍 saturation된다고 볼 수 있다. phase splitter가 saturate한다고 하더라도 사실상 이 때의 voltage는 power amplifier saturation에 비해 충분히 높은 voltage라서, 출력관의 특성은 아마도 여기서 결정이 난다고 봐야 옳지 않을까 싶다.


따라서, 앰프가 크랭크 업 됐을 때를 보다 낮은 볼륨으로 혹은 프리앰프만 가지고 흉내낸다고 보면, 프리앰프 출력을 diode clipper를 이용해서 뭉갠다음 파워앰프로 보내거나 출력단의 바이어스 전압(절대값)이 낮은 출력관을 쓰는 방법을 생각해 볼 수 있다.

그러나, 중요한 것은 어디까지나 그 능력을 알 수 없는 파워 (큰 전류를 끌어쓰는 상황에서 공급전압은 변동이 일어남)와 블랙박스같은 출력 트랜스포머와 스피커 - 다시말해 이놈들의 다이내믹 특성을 알 수 없으므로 완벽재현이란 어렵다.



