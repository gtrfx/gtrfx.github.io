---
title: "matplotlib이 제대로 동작하지 않는 경우..."
tags: [life]
layout: post
author: "Keith"
published: false
---

먼저 내 컴퓨팅 환경을 요약하면:

- Ryzen9 7950x
- NVidia 5070 Ti
...

이 환경에서 miniconda를 설치해서 pytorch를 쓰고 있다. matplotlib은 매우 흔히 사용하는 라이브러리인데, 신기하게 이것도 제대로 동작하지 않기에 확인해보니

libopenmp에서 문제가 생겨서 동작하지 않았던 것을 알았다.

다음과 같이해서 libopenmp를 다시 설치하면 된다. ryzen이라서 동작하지 않는 그런 문제는 아니다 일단.

```
conda install --force-reinstall intel-openmp
```