---
title: "OpenMP vs pthread..."
tags: [life]
layout: post
author: "Keith"
---

요약해서 얘기하면 OpenMP가 간단하고 세련된 모양을 하고 있고 pthread는 다소 primitive한 모양을 하고 있다.

OpenMP는 간단하고 세련된 모양을 하고 있는 대신 pthread를 가지고 굴리는 것처럼 세밀한 컨트롤을 하긴 좋지 않다.

둘 중에 어떤 것이든 익숙한 걸 쓰면 사실상의 큰 차이는 없으니까 그렇게 하라고 얘기하고 싶다.

나는 pthread를 선호한다. c++의 thread를 쓰면 사실 더 편리하다.