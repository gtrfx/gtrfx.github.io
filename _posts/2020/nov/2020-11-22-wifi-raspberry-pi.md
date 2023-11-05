---
title: "Raspberry pi의 wifi를 이용하고 있다면.."
tags: [raspberry pi, wifi]
layout: post
author: "Keith"
---

이것은 라스베리파이에 wifi adaptor를 붙이거나 raspberry pi 3/4에 해당하는 이야기가 되겠다.

SSH 같은 걸로 연결해보면 잠시 입력이 뜸해졌다가 다음 입력이 들어올 때 버벅이는 느낌을 계속 마주하게 될 것이다. 이 원인은 신기하게도 wifi에 power saving mode가 자동 적용이 되어있기 때문이다.

거두 절미하고 wlan 드라이버가 제대로 설치되어있다면 다음과 같이 하자.

```iw wlan0 set power_save off```