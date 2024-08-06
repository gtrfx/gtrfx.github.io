---
title: "gradient descent vs SGD (stochastic GD)..."
tags: [deeplearning]
layout: post
author: "Keith"
---

뭐 제목은 거창하지만 큰 차이랄 게 없고 deep learning 학습을 할 때 cost/loss function의 기울기가 줄어드는 방향으로 최적화를 하게 되는데, 일반적인 방법은 학습시키려는 데이터 전부를 가져다가 최적화를 하고 이걸 좀 빠르게 하고 싶으면 randomly selected sample set을 가져다가 그것만 교육시키는 거다.

일반적으로 모든 샘플을 가져다 다 교육을 시키면 대개 최적지점을 찾긴 하지만 그 이후로는 대부분 그 주변을 왔다갔다하는 게 일반적인 경향이다. 그래서 SGD를 쓰면 작은 수의 샘플을 가져다가 효율적인 학습을 시킬 수 있다라는 생각에서 출발한 거다. 그러니까 학습시키려는 데이터가 잘 골라졌다면 정말 작은 크기의 셋으로 원하는 학습을 시킬 수 있다라는 얘기가 되겠지.