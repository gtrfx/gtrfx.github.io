---
title: "Compressor와 Limiter"
tags: [compressor, limiter]
---

이와 관련해서 예전에도 생각하던 것을 적어봤던 적이 있다. 그냥 간단히 요약하겠다.

1) Compressor

어떤 사운드의 진폭을 내가 원하는 레빌 이하로 끌어내리는 것이다. 당연히 그 레벨 (threshold)를 상회하는 peak는 모두 해당 순간의 음량 줄이기(gain reduction이라고 한다)하여 깎아낸다. 이렇게 하면 음량이 약간 줄어드는 효과가 나는데, 그것은 Make up gain 혹은 이와 유사한 기능을 통해서 보상한다. 그 결과 신호의 움직임 폭은 줄어들고 (다이내믹 혹은 다이내믹 레인지가 줄었다고 함) 음량은 비교적 일정해지는 효과를 가져온다. 

다이내믹이 줄었다고 함은 이를테면 연주자가 일부러 강 약의 구분(이것을 역시 다이내믹이라고 한다)을 주어 연주해 놓은 것을 threshold를 낮춰서 컴프레서를 걸어버린다고 하면 연주자가 의도한 강/약의 표현이 대부분 사라지게 된다. 만일 연주자의 기량이 좋지 않아서 강약 표현이 원하지 않게 들어가 있다면 컴프레서를 통해서 그 연주를 일정하게 만들어 줄 수 있다. 

2) Limiter

출력이 어느 한계를 넘지 않게 하는 기능을 담당한다. 역시 한계를 넘어서는 peak를 없에는 일을 한다. 이를테면 믹스의 최종 출력이 0dB 상한을 넘기지 않게, clipping이 일어나지 않게 하는 것도 limiter가 할 수 있는 일이다. 

3) Compressor와 Limiter의 차이점

Limiter는 Compressor의 threshold를 0dB + ceiling으로 맞춰놓은 것이라고 할 수 있다. knee는 hard하고 이때 compressing ratio를 무한대로 맞춰놓은 경우라고 볼 수 있다. 

4) Adaptive Limiter/Maximizer

이 경우는 Compressor + adaptive (makeup) gain + Limiter가 결합된 경우라고 볼 수 있다.

Threshold를 설정해놓으면 그 부분은 compressor ratio가 무한대인 compressor처럼 작동하고 여기에 threshold로 눌러놓은 만큼 gain을 주어서 최종적으로는 그만큼 출력이 진폭을 꽉차게 만드는 기능을 하는 것이다. 일반적으로 마스터링 작업을 할 때 사용한다. 

