---
title: "Multi-core vs. Multi-machine..."
tags: [parallel processing]
layout: post
author: "Keith"
---

나는 이 문제로 아주 예전부터 씨름해왔다. 오늘 내린 결론은 multi-core/multi-cpu machine이 훌륭하다면 역시나 multi-machine을 만지는 것보다 관리 차원에서 참 좋구나이다.

컴퓨터 10대와 씨름하면서 이런 저런 스크립트를 업데이트하는데, 같은 SSD가져다가 복사해서 셋업하는 게 아니고 경우에 따라 증설하면서 전부 수동으로 업데/관리했었는데 특히나 jenkins에 9개의 agent를 붙여서 작업하려니 이게 보통 노력으로 쉽지 않구나 했다.

- docker로 다양한 linux 환경에서 빌드할 수 있어야 되고
- windows VM으로 windows binary도 만들어야 되고
- 그렇게 만들어진 build를 각자의 OS에서 검증까지 해야 되니

이게 정말 죽을 맛인 거다. 더구나 검증 시간을 줄이기 위해서 multi-threading을 해야 하는데, 이게 윈도우즈는 참 뭐 같다고 해야된다.

그나마 perl을 써서 multithreading이 나름 아쉬운 곳은 있지만 적당히 잘 돌아서 크게 시간을 절약했지만 이 단계에 이르는 동안 많은 시행착오 때문에 소비한 시간이 정말 많다.

이런 거 아무리 잘해봐야 어차피 이 바닥 불황에 낭인이 되는 것은 시간 문제라 뭐하나 싶다가도 그나마 이렇게 정신 분산시킬 일이라도 있다니 다행이다 싶기도 하고. 돈이 한 곳으로 몰려가다보니 나머지 영역에 있는 사람들은 불황이 되는 것이다. 전체적으로는 막대한 돈이 흘러들어오고 있으니 호황이라고 할지 몰라도.

과거의 기술들은 이제 다 최소 관리모드로 넘어가고 뭐가 될지 모르는 새로운 분야에만 막대한 투자가 들어오고 있다. 그들이 벌어들인다는 돈의 액수만 봐도 '와 이 많은 돈이 어디서 나왔길래...'하는 소리가 절로 나온다.

그 때문에 이미 주위에 낭인들이 넘쳐나고 있다. 잘 안 풀리고 있다는 것을 알고 있기에 어쩌다 잘 지내냐고 말 건네기도 좀 미안할 지경이다. 술이라도 한잔 하자고 하긴 더더욱이나 그렇고.

각자 도생의 시절이라 안부를 묻기도 뭐하고 얼굴 보기도 쉽지 않다. 친구며 인간관계 그것이 다 무엇일까? 내 형편이 좋아도 그들의 형편이 좋지 못하면 그 역시도 멀어지는 원인이 되는 것인데. 
