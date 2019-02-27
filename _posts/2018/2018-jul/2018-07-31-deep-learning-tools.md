---
title: "Learning Deep Learning: tools?"
tags: [deep learning, machine learning]
categories:
    - computer
---

## python/anaconda

MacOS나 Linux의 일반 배포판에는 python과 필수 패키지들이 그대로 따라오는 반면 Windows에서는 python은 포함되어있지 않다보니 python + 필수 패키지의 세트인 anaconda를 설치하게 된다. 

좀 짜증나는 사실이긴 한데, anaconda를 이야기하면 Nicky Minaj의 노래 가사 "~~my anaconda don't want none unless you got buns hun~~"이 떠오른다. 이게 뭔 리야 싶다만. python의 anaconda와는 무관하다. 

## tensorflow

아무래도 [tensorflow](https://www.tensorflow.org/)의 인기 때문인지 python과 tf를 쓰는 것이 업계 표준처럼 되어버린 듯 하다. API는 많은 언어로 다 제공된다. python을 사용하면 python shell 안에서 마치 matlab을 쓰듯 해볼 수 있으니까, 그리고 무료로 이들 툴을 장만할 수 있기 때문에 더 그러한 것이 아닐까 한다.

## CUDA/OpenCL

tensorflow같이 남이 만들어놓은 deep learning platform을 쓰면서 CUDA가 왜 필요한가 하는 생각을 한다. 

## OpenCV

Computer vision에 적용하는 것으로만 보면 OpenCV로도 할만한 것은 다 할 수 있다. 

## CoreML

Xcode와 model converter (python)만 있으면 할 수 있다. model을 만들고 training을 하려면 python + tensorflow가 필요할 것이다. 