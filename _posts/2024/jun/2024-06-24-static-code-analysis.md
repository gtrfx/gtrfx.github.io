---
title: "Static Code Analysis..."
tags: [language]
layout: post
author: "Keith"
---

이런 툴을 쓰게 된 이유는 별 게 없다. 코드가 잘못되었다고 지적해도 그럴리가 없다며 반항하는 이들이 있어서다.

적당히 코딩을 할 줄 알고 스스로 검증까지 잘 하는 이들에게 이런 툴은 있으면 좋긴하지만 꼭 필요하다고 할 수는 없으니까.

static이라고 하는 것은 코드를 모두 컴파일해서 돌려가면서 분석한 게 아니라 그냥 문장을 가지고 문제점을 분석했다는 뜻이다.

그러니까 구문 상태에 있는 것에 어떤 문제가 있다 없다를 찾아낸 거라 실제로 돌리면 문제가 안되는 것을 문제라고 찾아내는 경우 (false positive)가 좀 많다. 

일단 잘 알려져있는 것은 Klocwork라는 것과 Coverity라는 것인데 둘 다 다 상용 소프트웨어이다. 

clang의 scanbuild를 이용해서 분석을 할 수도 있는데, 이것은 false positive가 좀 많아서 짜증이 날 수 있다. 결과물을 정리해놓은 것이라든가 전반적인 기능은 매우 우수하다. 사실 clang의 static analysis를 이용해서 Xcode가 analysis를 한다고 볼 수 있다. 

능력이 좀 되면 scanbuild의 결과를 적당히 참조해서 코드를 수정하면 된다. 그 외에 cppcheck이라든가 하는 것들은 나머지 툴 들에 비해 수준이 많이 낮은 편이라 아주 기초적인 수준에서의 문제점은 찾을 수 있지만, 보다 깊은 수준의 버그를 찾아내는 데는 한계가 있다.

대부분 게으르다는 것을 가정할 때 valgrind로 미친 듯이 brutal force로 잡아낼 수도 있고 clang fsan 같은 것으로 좀 더 빨리 돌려가면서 찾아볼 수도 있고 그것도 잘 안된다면 scan build 같은 것을 돌릴 수가 있다. 돈이 좀 많은 회사면 Klocwork이나 Coverity 같은 것을 돌려보면 되겠지만. 

그러나 윈도우즈의 세계는 답도 없다. Linux/MacOS에서는 뭐랄까 이런 소프트웨어 방법론이 잘 적용되어 그렇게 돌아가고 개발되고 있는데 말이다. 