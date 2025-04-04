---
title: "LLM: summarizing long paragraphs..."
tags: [llm]
layout: post
author: "Keith"
---

llm이 요약을 하는 기능에 대해서 알아보았다.

GPT 모델의 경우는 transformer가 미래의 token을 쳐다보지 않기 때문에 오직 prediction을 위해서 동작한다고 한다.

이 특징 때문에 요약을 하는 것에 별로 유리하지 않은데, 많은 문서를 학습하면서 요약하는 기능이 LLM이 문맥을 파악할 수 있게 된 덕택에 저절로 학습되었다고 한다.

이와 달리 BART의 경우는 encoder와 decoder로 구현이 되어있고 summary를 하기 위한 별도의 학습을 했다고 한다.

이걸 위해서 GPT2 모델을 로딩해서 확인해봤는데, 역시나 GPT2 모델은 크기가 작기 때문인지 전혀 엉뚱한 결과가 출력되었다.

매우 작은 LLM인 apple intelligence의 경우도 요약 기능이 동작할 때도 있고 아닐 때도 있다. 요약하려는 글의 원문이 좀 길면 실패하는데, 
요약 과정이 실패한 것인지 아닌지 내부적으로 어떻게 확인하고 있는지 궁금하긴 하다.