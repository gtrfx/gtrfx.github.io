---
layout: post
title: "일반인의 눈으로 본 Deep Learning (1)"
tags: [deep learning, neural network]
categories:
    - computing
    - deep_learning
author: "Keith"
---

80년대말 90년대 초에 전기전자공학과에 교수가 된 분들의 이력을 보면 80년대에 인공지능 붐이 일어서 패턴인식과 관련된 연구 내용으로 외국 학교에서 박사를 받아온 사람들이 제법 많다. (인공) 신경망을 하다 온 사람, Wavelet이란 것을 하다 온 사람들 등등인데 아쉽게도 90년대 중반을 넘어가면서 이 분야는 아예 죽어버린 듯 했다. 

인공지능의 역사를 보면 제목이 neural network라 아예 인공지능 관련 학회에서 논문이 그냥 reject되어버렸다는 이야기도 나온다. 그래서 deep (belief) network이란 이름을 붙여서 논문들이 나왔는지도 모른다만. 

이게 2012년 부터 인기가 서서히 올라간 것 같은데, 내가 실감하게 된 것은 2013년부터였던 것으로 기억된다. 최근 기술 분야 관련된 강좌에 machine learning이란 게 들어있고 인기가 상당히 좋았기 때문인데, 호기심에 열어서 들어보니 이런 저런 서론이 길긴 했지만 결국 neural network에 대해서 얘기하려는 것을 알고, 아니 이 '사기성' 짙은 neural network가 다시 부활을 하게 되는 것인가, 뭔가 또 해낼 것으로 사람들의 기대를 받고 있는 것인가 (그래도 가망없을텐데) 했던 기억이 난다.

아예 neural network에 대한 경험이 아예 없었다면 그 당시에 새로운 관심을 갖게 되었을지 모르는데 기존의 선입견 때문에 멀리했던 기억이 난다. 그런데 그 사이 많은 변화가 있었다. 업계의 관심 및 관련 인력들의 몸값이 매우 높아졌음은 물론 그동안 neural network 및 AI를 전공했음에도 본인의 출신성분을 감추고 다른 분야에서 활동하던 이들도 죄다들 커밍아웃을 하고 스스로 AI 전문가임을 자처하게 되었다는 것이다.

그 이후로 여러 책과 논문들을 틀춰봤는데 도무지 무엇이 새로워졌는지 감을 못 잡다가 결국 실험을 몇 가지 해보고 나서야 뭔가 감을 잡을 수 있게 되었다. 그리하여 그동안에 알게 되었던 것들만 (일반인의 눈에서) 간략히 정리해볼까 한다.


