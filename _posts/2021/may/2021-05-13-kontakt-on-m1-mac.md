---
title: "M1 Mac에서 kontakt"
layout: post
tags: [kontakt]
---

어차피 Kontakt는 rosetta로 돌기 때문에 /Library/Audio/Plugins/Component에 있는 파일들을 가져다 복사만하면 될 것 같은데, 여기에 좀 문제가 있다.

이것 자체로는 기존의 샘플 라이브러리를 add하는데 문제를 일으킨다. 이해하기는 어렵지만 plugin app으로 library add를 하면 error가 발생하고 그냥 standalone app으로 해야만 library add가 된다.

나는 몇 개 되지 않는 오디오 샘플을 쓰긴 하지만 8GB M1 mac으로도 별탈없이 잘 동작한다. 물론 앱을 쓸데 없이 많이 열어놓지 않는 조건에서.
