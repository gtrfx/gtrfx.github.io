---
layout: post
title: "OS for single board computer"
categories: technology
---

Single board computer 쓸만한 것들이 많이 나왔다. 그런데, flash card의 속도가 느려서인지 GUI는 생각보다 빠르지 않다. 특히 X를 구동하면 그렇게 느껴진다. Android는 감내할만 하고 Chrome OS도 느린 느낌이 난다. 아마도 빠른 media를 사용하면 쓸만하지 않을까 하는 생각도 든다.

Single board + arm based computer를 지원하는 OS가 좀 되긴하는데, 다양한 용도로 활용하려면 그래도 android나 chrome os는 활동의 제약이 있어서 linux를 찾게 되지 싶다. 

많은 linux가 있지만 역시나 빠른 업데, 쾌적한 사용감, 그리고 가벼운 느낌은 arch linux 말곤 느낄 수가 없었다.

요즘 PC에서 ubuntu를 돌리면 정말 (윈도우와 비교해서) 매우 가볍다는 느낌이 들지만, single board computer에서는 그 정도도 버겁게 느껴지는 모양이다.

물론 SSD를 달고 raspberry pi를 돌려보진 않아서 GUI 환경이 얼마나 빨라질 수 있는지는 모르겠다만, RAM을 특별히 많이 늘려줄 수 없는 상황에서 GNOME이니 XFCE이니 모두 답답한 느낌이 들었다. 특히 웹브라우저를 구동할 때 말도 못하게 느려진다. 반대로 하드웨어 가속기를 쓰는 동영상 플레이 같은 것들은 충분히 좋다. 다시 말하지만 가속기가 많은 부분 빠르게 처리해주고 그것을 곧장 frame buffer에 써내려갔기에 가능한 일이지 일반적인 처리 (CPU에서 그림을 처리해서 frame buffer로 써내려가고 하는 일들)은 답답했을 뿐더러 덩치가 큰 데이터를 flash card와 주고 받는 일 또한 RAM을 access하는 것과 비교가 안되니 그러할 것이다.

arch linux에서 fedora/ubuntu 깔아봤으나 결국 다시 arch linux로 돌아왔다. 이게 나한텐 딱이다.