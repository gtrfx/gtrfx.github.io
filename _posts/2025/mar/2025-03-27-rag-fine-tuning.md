---
title: "RAG..Fine tuning..."
tags: [llm]
layout: post
author: "Keith"
published: false
---

최근 다양한 기술들이 개발되면서 칭호나 이름을 붙여 불리는 경우가 많은데, 같은 맥락으로 
현재의 어떤 기술적인 문제를 해결하고나면 그 해결 방법에 이름을 붙이는 것 같다. 

그게 별 것 아닌 것 같아도 막상 거창한 이름을 붙여놓으면 왠지 배우는 데 시간이 많이 걸릴 것 같고 그런데 막상 그렇지도 않다는 생각을 한다.

LLM을 들여다봤더니 요새는 RAG과 fine tuning이 hot topic이 되고 있단다. 글쎄? 내가 LLM을 자체적으로 운용하고 있는 게 아니면 RAG과 fine tunining이 뭐고 어떻게 하는지 어렴풋이 알아도 
써먹을 일이 없으니 그런가보다 하게 될 뿐이다.

대충 이해하기로는 일종의 기존에 훈련시킨 (pre-trained)LLM이 새로운 정보에 약할 수 밖에 없으니 그것을 갱신해준다거나 내 입맛에 맞게 고쳐쓰겠다는 이야기다.

당장 지금 ChatGPT만 봐도 스스로 알고 있는 내용이 아니라고 하면 곧바로 웹에 접속해서 내용을 가져온다. 이것이 그냥 단순히 데이터를 가져오는 게 아니라
이런 저런 내용을 한꺼번에 검색해보고 요약해보고 비교 추론하여 알려준다. 그렇게 알려준 내용은 스스로를 업데이트 하는 데 쓰이고 말이다.

그냥 뻔한 이야기일 수 있는데 그렇게 한다. 사람이 많은 교육을 받았다고 하더라도 매일 매일의 생활에서 이런 저런 매체 혹은 다른 사람들을 통해서 자기가 알고 있는 내용들을 갱신하는 것과 다르지 않다.

일단 이 과정은 충분히 자동화가 가능해보인다. 

