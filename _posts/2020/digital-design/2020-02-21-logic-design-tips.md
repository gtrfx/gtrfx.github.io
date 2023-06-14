---
title: "간단한 로직 설계 팁 (1)"
tags: [logic design, basic]
layout: post
author: "Keith"
---

너무 당연하고 기본적인 이야기라 책으로 쓰기도 뭐한 내용이라고 생각했던 것들인데, 막상 관련 책들을 읽어보니 비슷한 내용을 길게 다루고 있는 책들이 꽤 많았다. 그래서 기왕에 훑고 지나가는 겸 정리해보려고 한다.

계산 문제를 풀어감에 있어서:
- pipelining을 이용하면 초기 delay는 늘어나지만 연산자원을 작게 사용하면서도 재사용을 통해 매 cycle 원하는 결과를 얻어낼 수 있다. : 데이터가 순차적으로 계속 들어오고, 그에 맞춰 결과를 얻어내야 하는 경우
- loop를 unroll하면 결과를 얻는 시간이 빨라진다 (throughput이 늘어난다). 대신 area는 늘어난다. 
- 연산 logic간 register를 제거하면 throughput이 늘어난다. 다만 critical path (path중 가장 delay를 많이 가진 path)의 delay가 clock duration보다 짧아야 된다. (반대로 clock cycle는 critical path의 delay 보다 길어야 된다.)
- 만일 clock cycle이 짧아야 되는 경우, register를 추가해서 critical path의 delay를 줄여주어야 한다. 대신 latency는 늘어난다. 
- 연관성이 작은 일들은 분리해서 parallel하게 구성하는 것이 throughput을 올리는 설계 결과를 얻을 수 있다.

이 내용은 지극히 이해가 간단하지만, 사용하는 공정과 logic에 대한 구체적인 데이터가 없으면 뻔한 이야기를 늘어놓는 것과 같다. 

실제의 설계는 tool들이 구체적인 techlibrary의 데이터를 사용하여 최적화한다. critical path의 delay가 과하다 싶으면 경고를 내보낸다든가 최적화 과정에서 register를 강제로 추가하여 retiming하게 된다. 다시 말해서 불필요하게 구체적인 기술보단 추상적인 기술을 하고 나머지는 tool에 맡겨서 최적화하도록 내버려두는 것이 더 좋은 결과를 가져온다.

이것은 애매하게 inline assembly로 프로그램을 작성해놓은 결과가 compiler의 최적화 결과보다 훨씬 못한 경우에 비교할 수 있다. 