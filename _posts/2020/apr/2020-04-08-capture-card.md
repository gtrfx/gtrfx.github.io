---
title: "Video Capture Card: 비디오 캡쳐 카드에 대해서"
layout: post
tags: [video capture card, h.264, bitrate]
---

비디오 캡쳐 카드에 대해서 생각하는 사람들을 위해서 적어본다.

거두절미 하고 spec을 들여다보되 bitrate가 얼마인지 확인해봐야 한다. 이게 클수록 (물론 스펙을 사기 치지 않는다는 가정하에) 좋은 화질을 얻을 수 있다는 것을 의미한다.

캡쳐카드가 USB로 된 것도 있고 PCIe로 된 것도 있다. 감각적으로 PCIe 카드로 된 것이 더 좋은 성능을 낼 것이란 생각을 해볼 수 있다. pin 개수가 더 많으니까 그렇지 않을까? 혹은 더 좋은 성능을 내지 못하는데 뭐하러 PCIe 카드로 만들었을까? 등등의 생각을 할 수 있는데, 실제로 중국 Vendor들은 이러한 합리적 상상의 틀을 넘어서는 경우(?)가 있으니까 유의해야한다.

캡쳐 카드가 하는 일은 HDMI로부터 화상 정보를 읽어와서 메모리에 모두 쓴 다음, H.264 (H.265 혹은 그 외의 codec을 쓰는 것은 못 봤다)로 동영상 압축(?)을 한 뒤에 bitrate를 충분히 떨궈서 USB 혹은 PCIe (PCIe의 일부 핀만을 이용한다. 대부분의 경우)를 통해 전달한다.

즉, 이 때 압축이 어느 정도의 비율로 일어나는지가 바로 화질과 연관된다. H.265를 쓰면 좋겠지만, license 문제가 있고 VP9과 같은 좋은 코덱의 경우에는 생각보다 codec chip을 만드는 회사가 없어서 저가의 캡쳐카드를 만들지 못하는 것으로 보인다. 저가의 제품이 나올 수 있다는 것은 사실 cutting-edge의 엔지니어들이나 할 수 있는 일이 그것보다 아래 레벨의 엔지니어들도 할 수 있게 되었다는 것을 의미한다. 기술의 약간 저변화 된 것을 의미하지만, 소비자의 입장에선 이것이 더 좋은 상황이 된다. cutting-edge = expensive 가 성립되니까 말이다.

일반 디지털 카메라의 경우에도 유의미하게 봐야 할 것은 어떤 코덱에 대해서 어떤 bitrate로 encoding하느냐 하는 것이다. 같은 1080p라고 하더라도 20Mbps대와 100Mbps는 천지차이의 결과를 보여준다. 왜 이런 차이가 나느냐? encoding하는 ASIC은 software가 아니기 때문에 adjustable bitrate 같은 게 지원이 안된다. 그냥 하나의 bitrate에 대해서 설계 된다. 그래서 흔히 카메라를 보면 bitrate의 선택 폭이 넓지 않은 것을 알 수 있다. 비록 메모리의 소모량은 많더라도 bitrate가 높은, 또 기왕이면 H.264보단 265, 또 VP8보단 VP9이 좋은 것이다. 

일반적으로 알려져있기로는 H.265가 H.264의 1/4 bitrate만 되도 유사한 화질을 낼 수 있다고 하는데, 체감상으로는 1/2 혹은 1/3 정도는 되어야 비슷하게 느껴진다고 볼 수 있다. 따라서, 4k 30p 영상을 H.265로 대략 100 Mbps로 쏠 수 있다고 하면 4k라고 인정은 일단 해줄 수 있다. 60p에 400 Mbps 정도 할 수 있다고 하면 충분히 인정할 수 있는 수준이다. 이 정도만 되도 USB2가 명목상으로는 수용가능한 bitrate (<480 Mbps)인데, 실제로는 전혀 그렇지 않다. 만약 capture card가 이 정도 성능을 낼 수 있다고 하면 보급형 기기라고 보면 USB3.1로도 못 나온다. PCIe로 밖에 할 수 없다. 그러니까, 실제의 USB capture card들은 이 정도의 성능엔 한참 미치지 못하는 상황이라고 보면 된다. 

실제 카메라 마켓에서는 일부 vendor를 제외하고 H.264가 지금껏 보편적으로 보급되고 있고, H.264라도 100Mbps 코덱이 지원되는 것도 있고 여태 2x Mbps로 머무는 vendor들도 있다. 화질은 천지차이라고 보면 된다. FujiFilm의 최신 제품들은 H.265도 지원이 될 뿐더러 100 Mbps가 넘는 bitrate의 codec까지 지원하니까 화질은 압권이라고 볼 수 있지만, 인기가 좋지 못한 것은 아마도 센서크기/센서성능/광학적인 성능에 의한 것 때문이 아닐까 한다. 즉, 센서/광학 성능의 미진함을 코덱(ASIC)으로 극복하는 게 아닌가 싶다. 최신의 Sony mirrorless도 H.265를 지원하지 않는 상황을 보면 더욱 그러하다. (mirrorless가 아닌 일부 제품에선 H.265를 지원한다)

본론으로 돌아와서, 캡쳐카드 회사에서는 이 스펙(codec, bitrate)은 잘 보여주지 않는다. 제품을 구입하기 전에 유튜브 리뷰를 보지 않아도 이 숫자들을 보면 충분히 가늠이 되기 때문이다. 

예를 들어 24 Mbps H.264, 1080p, 60fps라고 가정하면 화질은 중하급이라고 보면 된다. FHD이지만 전혀 FHD 같아보이지 않는 엉성한 (깍뚜기가 많이 보이는) 화면이 나온다. 상대적으로 100 Mbps (12.5 MBps) 정도의 bitrate면 FHD라도 상당히 좋은 결과를 보여준다. 사실 사람들이 Panasonic mirrorless를 동영상 촬영용으로 선호했던 이유는 이것 때문이다. 당시 다른 카메라들은 이 정도의 높은 bitrate를 지원하지 않았다. 단지, 센서가 생각보다 작아서 폰카처럼 나왔다는 게 문제지만.

대개 저가의 USB 타입 캡쳐카드가 1080p 30 or 60p에 대해서 20 Mbps 언저리의 bitrate를 제공하는 화질을 제공한다. 화질은 딱 그만큼 나온다고 보면 된다. 더러는 4k 30p를 지원한다고 과장 광고를 하는데 잘 들여다보면 capture는 1080p가 최대라고 나와있기도 하다.

일반적으로 알려진 USB 2.0의 전송률은 480 Mbps이기 때문에 엄청나게 고화질인 H.264 동영상 (대략 100Mbps만 되도 충분히 좋다)을 전송하기 충분하다. 그런데, 실질 전송률은 이것보다 훨씬 낮기 때문에 캡쳐카드 중의 일부는 USB 3.0을 고집하는 경우가 있다. 하지만, 이것이 켑쳐 카드의 성능을 의미하는 특징이 아니라는 것을 알아두어야 한다. 중요한 것은 codec이 어떤 것이냐, 또 bitrate는 얼마인가가 화질을 결정하는 요소라는 것이다. 아쉽지만 USB Spec도 마케팅을 위해 사용되는 듯 하다.

잘 알려진 고급 캡쳐카드 메이커인 elgato의 경우 HD 60p 영상을 40 (일반)/60 (pro) Mbps로 내보내고 있다고 스펙에 적혀있는 것을 보면 화질이 어느 정도일지 충분히 가늠이 가능하다. 다시 말하지만 저가의 캡쳐카드들은 60p에 대해서도 20Mbps 언저리의 출력이니까 결과물이 엉성할 수 밖에 없다. 4k에 대해서 60p라고 보면 codec을 특별히 올리지 않는다고 보면 이것의 2배 이상은 되야할 수 밖에 없다.

정리하면,
- 캡쳐 카드 성능은 어떤 ASIC (칩)을 썼느냐, 더 정확히는 어떤 코덱과 어떤 bitrate로 에 따라 결정된다고 보면 된다. 
- 대부분의 캡쳐 카드의 기능은 HDMI로 받은 신호를 내부 메모리에 기록하고, 그것을 H.264로 동영상 인코딩을 하는 것이다.
- USB 2.0만 되도 spec 그대로만 보면 1080p는 물론 4k까지 지원가능하지만 실제로 그렇지 않는 경우가 많다.
- 눈으로 봤을 때 FHD(1080p)의 30p에서 H.64 20Mbps 정도라고 보면 화질은 중하급이라고 보면 된다. 50 Mbps 이상은 되어야 괜찮은 결과가 나온다. 100 Mbps 정도 되면 매우 또렷한 영상을 얻는다.
- 1080p 60p 정도 본다고 하면 역시 50 Mbps 이상은 나와야 화질이 좋다고 인식할 수 있다. 4k 30p라고 보면 H.265를 지원하면 좋겠지만 그렇지 못하더라도 어느 정도의 bitrate가 나와야할지 충분히 감이 잡히게 된다.



