---
title: "왜 4k를 FHD로 만든 것이 FHD로 촬영해서 FHD로 보는 것 보다 좋아보이는가?"
tags: [4k, FHD, h.264, movie encoding]
---

지금 생각하면 좀 바보스럽게도 이런 의문을 계속 가지고 있었다. 왜 프로의 비디오 클립은 나의 비디오 클립보다 또렷한 것인가? 하는 것이기도 하다.

가장 처음 이 의문을 가진 것은 내가 Sony A7을 가지고 있고 그 카메라가 FHD의 video recording이 가능했기에 그렇게 촬영을 했는데, 결과물은 아무리 봐도 (60p로 촬영해도) 전혀 FHD로 보이지 않았기 때문이다.

수많은 FHD(1080p)로 업로드된 영상들과 비교해봤지만 나의 A7으로 찍은 FHD 영상은 조악하기 그지 없었다. 가장 처음 드는 생각은 A7이 full frame sensor를 가지고 있어서 심도가 떨어지는 나머지 동영상도 blurry해진 것이 아니냐 하는 것이었는데, 우습게도 A7 III로 찍어올린 것들은 전혀 다른 양상을 보여주는 것이었다.

열심히 관찰한 끝에 알아낸 것은 

- FHD로 촬영했다고 해서 그게 1920 x 1080에 대한 모든 색정보를 공급하는 것이 아니다.
- 프로들은 그들만의 (공개되지 않은) recipe가 있다.

이다.

우린 이 문제에 대한 해답을 4:2:0에서 찾을 수 있다.

4:2:0라는 것은 우리가 흔히 보는 카메라들의 동영상 인코딩 방법이다. 

무슨 뜻 이냐면

4개의 점에 대해서 밝기 정보는 4개를 보내는데 blue에 대한 색정보는 2개만 보내고 red에 대한 색정보는 보내지 않는다는 뜻이다. 자세한 내용은 인터넷의 다른 정보들을 참조하기 바라고 결론적으로 말
하자면
- 이렇게 인코딩 하면 4개의 점이 사실상 하나의 점의 색정보로 이루어진다.
- 결과적으로 가로 세로 방향으로 각각 두개인 점이 실제로는 하나가 된다.

라는 것이다. 

영상을 압축할 때 영상자체의 정보량을 줄이기 위해서 이런 저런 정보를 빼먹다보니까 결과적으로 FHD 영상이더라도 960 x 540의 영상이나 별 차이 없는 수준으로 질이 떨어졌다는 것이다.

4k에서도 같은 짓을 했다면 (실제로 그러하다 대부분의 카메라에서는) 유효 해상도는 사실상 1920x1080과 같은 것이다. 그렇다보니까 FHD video가 촬영 가능하다고 하는 카메라에서도 결과물이 이상하게도 FHD에서 4k 영상에 비해 참담한 결과를 얻을 수 밖에 없다.

쉽게 말해서 돈을 벌기 위해서 살짝 사기를 친 것이다 라고 말할 수 있다. 어리숙하게 생각해서 FHD로 촬영한다 함은 1920 x 1080의 점들의 색정보를 모두 인코딩하고 중요도를 따져서 적당히 버릴 건 버리고 취할 것은 취하지 않을까 하지만, 실제로는 1920 x 1080개의 점에 대해서 밝기 정보만 들고 있을 뿐 (그것이 사람 눈에 민감하다고 보니까) 색정보는 그렇게 들고 있지 않아서 화면이 엉성하게 보이는 채로 인코딩이 되었다는 것이다. 

당연히 FHD로 촬영했지만 4k로 촬영해서 FHD로 다운 스케일한 영상에 비해 떨어질 수 밖에 없는 것이다. 4k로 촬영했다고 하면 3840 x 2160의 모든 점의 RGB를 다 기록하지 않았다고 하더라도 최소한 1920x1080에 대한 색정보는 들고 있기 때문이다. 

말은 4k이지만 그것은 사실상 FHD인 것이다. 웃긴 것은 4k display이지만 4k를 보여줄 수 없는 능력의 디스플레이라고 하더라도 4k source를 받으면 사실상 더 좋은 결과물을 얻기 때문에 사람들은 여기서 한번 더 속아넘어갈 수 있다.

무슨 말이냐면 '아 내 디스플레이가 4k라 4k source에 대해서 더 좋은 결과를 보여주는 구나'하고 말이다. 그 디스플레이가 진정 4k 아니라도 FHD만 되도 분명히 4k source에 대해서 더 좋은 결과를 내어줄 수 밖에 없기 때문이다. 