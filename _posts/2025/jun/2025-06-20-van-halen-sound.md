---
title: "Van Halen Sound..."
tags: [audvans]
layout: post
author: "Keith"
---

내가 Van Halen을 기타리스트로서 열렬히 좋아하는 건 아니지만, 이번에 앰프 시뮬레이터의 피드백 루프 문제를 해결하고 나니 마치 앓던 이가 빠진 듯한 시원한 느낌이 들었다.
그동안 시뮬레이션은 해왔지만, 파워앰프 부분은 항상 어딘가 엉성했는데, 이번에 그걸 나름대로 완성 단계까지 끌고 가면서 내 안에서 에너지와 동기부여가 자가 발전처럼 터져 나오기 시작했다.

그 결과 이것저것 실험해보고 싶은 마음이 생기고, 내 시뮬레이터가 얼마나 좋아졌는지 확인해보는 과정에서 결국 1959SLP 앰프를 Van Halen 스타일로 개조하는 방식까지 시도하게 되었다.

사실 Marshall Plexi라고 불리는 1959SLP는 시중에 나와 있는 거의 모든 앰프 시뮬레이션 플러그인, 페달, 랙 장비에 다 들어가 있다. 나도 다양한 Plexi 모델을 써봤지만, 만족스러운 건 하나도 없었고, 그래서 결국 직접 만들게 된 것이다.
적어도 내가 만든 시뮬레이터는 어떻게 만들어졌는지 내가 정확히 알고 있으니, 믿음이 갈 뿐만 아니라 점점 애착이 생긴다.

예전에는 이 앰프를 어떻게 써야 하는지도 잘 몰랐다. 예전에 진공관 프리앰프를 만들어봤을 때도 결국 프리앰프였을 뿐이고, 회사 다니며 아이 키우느라 정신없이 지내던 게 대부분인 나에겐 1959SLP와 마주할 여유조차 없었다.
고등학교 밴드 시절 연습실에서 소리만 들어본 솔리드 스테이트 마샬이 전부였다.
디지털 모델링을 할 때도 프리앰프 쪽만 모델링되니 당연히 제대로 된 드라이브가 나오지 않았고, normal/treble 채널이 따로 있는 이유, 저음이 벙벙거리는 이유, 채널을 왜 점프해서 쓰는지 같은 건 당연히 알 수 없었다.

하지만 이번에 피드백 루프를 해결하고, 유튜브를 통해 실제 앰프 작동 방식을 자세히 살펴보면서 이 앰프의 톤 캐릭터를 뚜렷하게 이해할 수 있었다.
Plexi 계열 앰프 중에 JTM45라는 모델이 있다는 것도 이번에 처음 알게 되었는데, 이건 사실상 동일한 회로의 변종이라 쉽게 모델링할 수 있었다.
그렇지만 “이제 모델링이 잘 됐어요”라고 설득하기엔 뭔가 부족했다. 그러다 Van Halen을 떠올리게 됐고, ‘어차피 잘 모델링됐다면 Van Halen mod를 해도 비슷한 소리가 나겠지’ 싶어서 시도해보게 됐다.

다행히도 사운드가 제법 괜찮게 나왔고, 그래서 주변 사람들에게 들려줬더니 돌아오는 반응은 대부분,

“Van Halen이 누구야?”
혹은
“기타 앰프 소리는 다 거기서 거기 아냐?”
이런 류였다.

기대는 안 했지만, 그렇다 보니 결국 직접 A/B 비교 영상을 만들어야겠다는 생각에 이르게 되었다.
물론 앰프 시뮬레이터도 중요하지만, Van Halen의 연주를 흉내낸다는 건 솔직히 굉장히 부담스러운 일이다.
예전 기타 처음 배우던 시절 교본에서 Van Halen은 늘 “전설”처럼 소개됐지만, 나는 그때만 해도 그 이름이 보컬인지 기타리스트 이름인지도 몰랐고, 형제가 기타와 드럼을 맡고 있다는 것도 훨씬 나중에야 알았다.

어쨌든 내가 만든 이 앰프 구성은 Van Halen이 Soldano SLO-100으로 넘어가기 전, 즉 1990년대 초반까지 사용하던 것이다.
그 직전에 나온 5150 앨범에서는 코러스나 플랜저 같은 이펙트를 엄청 걸고 연주하기에, 그 이후 톤은 내가 다루는 범주에 속하지 않는다.

Van Halen 톤을 재현하려고 하다 보니, 그가 애용했던 MXR Phase 90 이펙터도 따라야 했다.
이게 빠지면 소리에 큰 차이가 생기기 때문이다.
문제는… 이걸 시뮬레이션 하는 일이 앰프보다 훨씬 더 어려웠다는 것이다.
FET를 가변 저항처럼 쓰고, 그걸 VCO로 제어하는 구조인데, 귀로 세심히 들어가며 FET의 전도성과 VCO 사이의 간접적인 영향을 흉내내느라 
꼬박 3일동안 퇴근해서 저녁시간에 튜닝했다. 

사실 SLP1959 자체는 시뮬레이션이 꽤 쉬운 편이라 수많은 유사 플러그인이 존재하지만,
정말 중요한 건 파워앰프와 피드백 루프가 정확히 구현되어야만 제대로 된 Plexi 톤이 나온다는 것이다.
예전에는 hard clipper 방식으로 대충 때웠다가, 실물 앰프와 너무 괴리가 크다는 걸 느끼고 아예 접었었다.
그런데 이번에는 확실히 다르게 느껴졌다.
실제 앰프 작동 영상을 참고하며 모델링을 조정한 끝에 이건 거의 확실하다는 감각을 갖게 되었고,

결정적으로 Van Halen이 썼다는 몇 가지 Mod (Variac 전압 강하, Arrendondo mod (커패시터 교체)) 까지 적용해본 결과,
내 시뮬레이터에 대한 신뢰와 확신이 훨씬 더 커졌다.

이제는 단순한 구현을 넘어서,
“디지털 모델링으로도 진짜 Plexi 톤을 만들 수 있다”는 증거를 남기고 싶은 마음이 들었다.
그래서 결국 이 프로젝트를 공유해보기로 한다.

혹시라도 그 시절의 앰프 사운드에 애정이 있는 사람이 있다면,
이번 작업이 조금이나마 의미 있게 느껴졌으면 좋겠다.

<iframe width="560" height="315" src="https://www.youtube.com/embed/rYW833pv1HI?si=7nh60M-W1R6wbZ6D" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/jBYOEKUjptk?si=zpeuI91fFj-H3Mjc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/iNzYjhwA-IY?si=N-hqrQPhAc1f7vJ5" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>