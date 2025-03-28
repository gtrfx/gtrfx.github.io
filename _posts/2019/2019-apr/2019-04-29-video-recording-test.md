---
layout: post
title: "비디오 레코딩 테스트: Sony A7, A6300, Panasonic Gx85"
tags: [video recording, h.264, fhd, 4k]
author: "Keith"
---

그동안 수많은 카메라 비교 유튜브 클립을 봐왔지만 사실 대략적인 차이만 인지할 뿐 실질적인 차이는 막상 내가 직접 해보지 않으면 알 수 없는 것이라 실제로 해보니 깨닫게 되는 게 많아서 적어보게 된다.

요점만 요약하면:

1. FHD 모드로 촬영하면 실제로 FHD 화면에서도 crisp한 영상을 얻기 어려웠다. 3개의 카메라 모두 같은 결과다. 아마도 이것은 카메라의 동영상 코덱이 8bit, chroma subsampling (4:2:0) 이기 때문인 것으로 보여진다. 사선 방향으로 나타난 물체가 움직이면 깍두기 모양의 artifacts가 눈에 거슬리게 나타난다. 빛의 밝기 변화가 심한 경계부에서 특히 그런 모양이 나타나는 데 이것은 그것이 chroma subsampling (모든 점의 색정보를 저장하지 않고 일부만을 저장하는 방법)때문임을 잘 보여준다. 4:2:0이라고 하면 4개 점으로 이루어진 정사각형 영역이 같은 색정보를 이용한다 (밝기 정보는 각각의 점에 대해 따로 저장한다). 따라서 4개의 점으로 이루어지는 영역내에서 점간 색의 차이가 커져야 되면 여기서 이질감이 발생하게 된다. 내가 가진 카메라 중에서 FHD에서 4:2:0의 chroma subsampling을 하지 않는 것이 없었기에 3개의 카메라가 모두 비슷한 결과를 냈다. 
2. 4k로 촬영해서 FHD로 downsampling하면 이런 문제는 사라진다. 이것이 FHD로 최종 저장하더라도 4k로 촬영해야 하는 이유가 된다. 4k로 촬영했을 때의 결과물은 대충 보면 a6300/gx65 사이에 큰 차이가 없다. 특별히 low light 조건이 아니면 구분하기 어렵다. 
4. FF 카메라에서 바라보는 세상이 우리 눈에 조금 더 가까와서인지 촬영된 결과는 FHD가 아니라고하면 분명히 A7의 결과물이 더 우수하게 나타난다. (이래서 다들 A7 M3를 사는 것이지 한다).

결론:

1. FHD로 보관할 것이 목적이라도 4k로 촬영하라.
2. APS-C나 MFT나 심도 표현에서 큰 차이를 찾기 어렵다. 물론 MFT는 스마트폰 카메라와 비슷한 수준의 심도 표현만 가능하다고 봐도 큰 차이가 없다. APS-C는 그것 보단 조금 나은 편이고. 
3. 심도 표현을 하고 싶다면 FF으로 가라. 값비싼 렌즈도 필요없다. F2.8 정도만 되도 APS-C/MFT가 바라보기 힘든 수준의 심도 표현도 가능하다. 대신 얕은 심도는 정확한 초점을 요구한다. 그게 확대해서 보지 않으면 초점이 정확히 맞았는지 확인하기 쉽지 않다. 
