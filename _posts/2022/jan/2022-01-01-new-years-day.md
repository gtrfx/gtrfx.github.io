---
title: "clang"
tags: [clang]
layout: post
author: "Keith"
---

clang에 이런 저런 툴이 붙어있다는 사실은 익히 알았지만 써 볼 생각은 한번도 하지 않았다. klockwork 대신에 쓸만한 static analysis가 가능한 툴이 있나 찾다보니 clang-tidy가 걸렸다.

klockwork과 비교해보진 않았지만 나름 쓸만한 것 같긴하다. Xcode에 있는 analysis가 같은 거라고 봐도 되지 싶은 수준의 analysis다. Klockwork은 그것보다 단계가 좀 더 깊었던 것 같은데, 내가 가진 것이 최신 표준의 c++을 지원하지 않기에 비교해보려다 관뒀다.

여기에 엮어서 clang-format도 마찬가지로 써봤는데, 이것은 뭐랄까 기 정의되어있는 format(code style)들이 별로 마음에 들지 않아서 어찌해야 하나 생각 중이다. clang의 엔진을 쓰는 거라면 astyle보다 뭐랄까 좀 더 낫지 싶은데, 구체적인 style을 결정하는 parameter들을 들여다보기 귀찮아서 그냥 구경 중이다.

뭐랄까 이것을 잘 쓰면 manual하게 누군가 코드형식에 맞춰 작성하지 않은 것들을 잡아내서 자동으로 수정을 시키거나 할 수 있을테니 여러 가지로 시간도 절약할 수 있게 해주고 나 스스로도 좀 애매한 경우에 대해서도 뭐랄까 더 확실한 결론을 내려주지 않을까 하는 기대를 해본다.

