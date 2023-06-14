---
layout: post
title: "Guitar Amplifier Simulator on a Raspberry Pi (6)"
categories:
    - project
author: "Keith"
---

자연스럽게 방향이 정해지기 시작한다. 이미 얘기한 바와 같이 다양한 앰프 모델을 이런 소형의 이펙트에서 반영할 수 있게 하자면 많은 컨트롤이 요구되는데, 그것을 만든다는 것은 실험적인 측면에서는 의미가 있을 수 있지만 실용성은 대단히 떨어진다. 

휴대용으로 가지고 다니려는 장비가 복잡한 컨트롤을 하고 있는 것만큼 답답한게 없으니까. 그래서 결국 얻어지는 것은 어디 가서든 즉석으로 꺼내놓을 수 있는 톤을 만들어내는 장치이면 되고, 그래서 결국 Kemper profiling amp를 라스베리파이 위에 올려야겠다 생각한 것이다.

이미 정리한 것과 같이 컨트롤 노브 3개와 각각의 노브를 버튼으로도 활용할 수 있으니까 최대 6개의 컨트롤이 가능하다 했다. 

즉, 노브로는 다음을 조정한다.
- 패치 브라우징 (패치 선택)
- 입력 게인 (알고리즘 구조 상으로 앰프 게인과 상통함)
- 출력 게인

버튼으로는 
- Bypass on/off
- Distortion on/off
- 캐비넷 IR on/off

이렇게가 되겠다. 출력은 오디오 레벨 출력과 class D amplifier 출력 두개를 넣고 전부 다 스테레오로 꾸민다. 어차피 스테레오라고 해봐야 stereo chorus로 split을 하거나 아니면 그냥 carbon copy를 해서 둘로 만들어놓은 것이고 class-D amplifier module은 무조건 스테레오를 지원하니까 그대로 사용하면 된다.

5볼트짜리 앰프로 출력이 모자르지 않냐 할 수 있는데, 가정용 기타 앰프로 쓰기에 충분하다 못해 출력을 올리면 공연장에서도 쓸 수 있는 소리가 나오기 때문에 이 점도 별 문제가 되지 않는다. 다만 개인 제작이라 부피가 크고 쓸데 없는 부분이 많이 달라붙는다는 문제가 생긴다. custom으로 제작하면 손바닥만한 stompbox에 전부 다 내장시킬 수 있고 stompbox의 9V DC power 하나면 이미 전원은 차고도 넘친다. 

디스플레이가 아예 없으면 안되니까 하나에 2천원도 하지 않는 1602 LCD를 붙이려고 하는데, 이게 또 뭐낙 핀수를 까먹는 거라 SPI로 바꿔야 하나 생각 중이긴 하다.

Kemper rig의 parameter들을 더 열어보니 톤에 영향을 주는 몇 가지 파라미터들을 더 발견했다.

- clarity

    Clarity를 올리려면 중간/고음역대의 특정 부분을 부각시켜야 한다. 그래야 소리가 또렷하게 들리는 느낌이 있으니까. 마치 audio enhancer? spectral enhancer? 그런 류의 느낌이 확 온다. 어차피 이 특성을 반영할 바에야 BBE같은 알고리즘을 넣어버릴까 싶다. BBE를 어떻게 구현하는지는 다른 포스트에 적어보겠다.

- presence

    좀 웃긴 것인데, clarity와 presence의 차이가 도대체 뭘까 하는 것이다. 인터넷 어딜 찾아봐도 이들을 정의하는 것도 없고 똑같은 EQing인데 어떻게 달리 해야 하는지도 알 수가 없다. 역시나 사기성이 짙은 요소이다. 
    Presence도 사실 high pass filter의 일환이다. 중요한 것은 어떤 cut-off frequency로 할 것이냐 slope가 어떻게 되어야 하느냐인데, 수 많은 앰프 회로를 들여다봐도 이것에는 딱히 명확한 것이 없다. 어떤 놈들은 power amp feedback path (1st order)에 RC filter의 R 값을 바꿔서 하기도 하고, 어떤 놈들은 tone stack에 1st order RC filter 넣어서 하기도 한다. 근본적인 것은 이게 high pass filter이고 cut-off freq는 대략 수 kHz에 있다는 것이다.
    이것 역시 3 band EQ가 있는 마당에 사기성 parameter일 수 밖에 없다.

- 3 band EQ (treble/mid/bass)

    여태 수많은 회로 패턴을 읽어오고 digital domain으로 옮겨도 봤는데 guitar amp의 tone stack이 아닌 audio용의 3 band EQ에 대해서 한번도 생각해 본 적도 옮겨본 적도 없구나를 알았다. crossover frequency를 어디에 잡아줘야 할지도 잘 모르겠다. filter를 무슨 식으로 구성을 해야 할지도 모르겠고.
    Freq domain에서 주파수를 3등분해서 해봤는데, 많이 부자연스러웠다. 아날로그 필터 회로를 디지털 필터로 옮겨와야 되나 하고 있다.

그 외에 tube model(?)과 관련된 것들이 더 있다.

- power sagging
- pick
- tube model

이것은 일종의 귀속임/눈속임 같은 것인데, 진공관 모델을 직접 알고리즘에 가져다 쓰지 않았음에도 그런 것인양 속이는 것이다. 역시 프로그램을 열어보지 못했으니까 어떻게 구현했는지 알 수 없지만, power sagging은 아마도 compressor의 기능을 조금 응용했을 것 같고 나머지는 EQ와 clipping curve를 변형해서 구현했을 것으로 생각된다.

어쨌든 톤에는 미묘한 차이만 가져올 뿐이니 과감히 생략해도 된다. 솔직히 말하면 사기 요소라고 봐야지 싶기도 하고.
