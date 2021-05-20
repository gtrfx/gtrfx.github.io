---
title: "M1 Mac과 Handbrake"
layout: post
image: https://www.thewebernets.com/wp-content/uploads/2014/12/Handbrake-Logo.png
tags: [m1 mac, handbrake]
---

M1의 video encoding/decoding performance가 좋다고 알려져있는데, 그것을 체감하려면 final cut 또는 handbrake 써보면 알 수 있다. 

단 현재 m1 mac은 beta 형태로 배포된 handbrake에서만 지원이 된다. 그외 버전은 모두 rosetta 위에서 돌아가는 것이라고 보면 된다. 성능차이는 대략 6배쯤 난다고 보면 된다. 당연히 내부 ip를 이용하면 품질이 뛰어난 결과를 얻으면서도 발열/속도면에도 엄청난 이득이 있다.

비교대상으로 삼을 것은 RX 580으로 엄청나게 많은 사람들이 사용하고 있으리라 본다.

대충 동일한 소스영상을 720p H.265(videotoolbox로 선택해야 GPU 내부 ip를 쓸 수 있다)로 인코딩한다고 보면,

1. Rosetta: CPU를 사용하는 옵션 밖에 없다. 40fps 정도가 나온다.
2. Rx580: 140fps로 인코딩, data rate만 control 가능
3. M1 navite: 240fps로 인코딩, data rate/quality 모두 control 가능

여기에 중요한 차이가 있는 것이 RX580의 경우 data rate만 컨트롤 할 수 있어서 fixed bit rate로 인코딩이 가능하다. 따라서 quality와 상관없이 정해진 data rate의 결과물을 만들어낸다. M1에서는 fixed data rate 및 quality based control이 가능해서 quality를 유지한 상태에서 최적의 bit rate의 결과를 뽑아낼 수 있다. 당연히 동일한 quality라고 보면 size면에서 m1 쪽이 이득이 있을 수 밖에 없고 전력 소비/소음/발열에서 RX580 대비 큰 이득이 있다.

잘가라 RX580..

