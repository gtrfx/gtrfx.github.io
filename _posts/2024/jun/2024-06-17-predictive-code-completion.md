---
title: "Predictive Code Completion..."
tags: [apple, xcode]
layout: post
author: "Keith"
---

Xcode 16에 이런 기능이 들어왔다. "예측형 코드 완성"기능? 그러니까 github copilot 같은 것들이 해주는 일이다. 오직 M1/2/3 맥에서만 지원되는 기능이다. 확인해보지 않아서 알 수 없지만 language model을 받아오는 것으로 보아서 local LLM을 돌리는 것 같고 응답시간은 github copilot을 온라인으로 사용하는 것보다 약간 느린 듯 하다. 그도 그럴 것이 LLM을 활용하려고 쓰는 HW의 load가 상대적으로 매우 커야 되는데 그렇지 못하므로 model의 크기가 작긴 하지만 (< 3GB) 반응시간도 느리다. 

Xcode에 이 기능이 더해지긴 했지만, 내 경험으로는 swift만 지원을 하고 나머디 Xcode가 지원하는 다른 언어들은 지원하지 않는다. 다만 예전에 비해서 search 능력이 좀 더 좋아져서 몇 글자만 작성해도 원하는 함수 혹은 예약어를 빠르게 찾아주긴 한다. 뭐 어쨌든 C++도 지원을 해주면 좋을 것 같고 나름 속도도 더 빨라졌으면 한다. local LLM으로 들어온 이상 github copilot보다는 보다 빠르지 싶다. 
