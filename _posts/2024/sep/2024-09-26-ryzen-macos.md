---
title: "저주 받은 해킨: Ryzen + MacOS..."
tags: [aiml]
layout: post
author: "Keith"
---

가뜩이나 해킨하기도 어려운 이 조합이 저주 받은 이유를 또 발견했다. AI/ML을 하기에 가장 안좋은 조합이란 거다.

왜? pytorch와 같은 모듈이 그래도 MacOS 세계에서는 나름 MPS라는 옵션을 살려놓고 있다. metal layer라고 해서 GPU와 CPU 등을 한꺼번에 활용하는 옵션인데
Ryzen hackintosh는 여기에서도 제외가 된다. 최근의 모듈들 모두 intel CPU를 기본으로 만들어졌기 때문에 MKL을 사용하고 그 때문에 MPS enabled된 module까지
덩달아 쓸 수 없게 된 거다.

MLX라고 해서 apple silicon mac에 적용되는 기능도 안된다. 그러니까 이 조합은 저주받은 조합인 거다.

VM도 잘 안되지 그렇다고 유명한 소프트웨어 조합(adobe, matlab 등등) 다 잘 안돌아가지. 그렇다고 pytorch가 잘 돌길 하나.

안되는 것들 투성이다. 그렇다고 짜증나는 intel 14th gen을 억지로 들이고 싶지도 않다. 차라리 그 돈이면 M4 mac mini를 기다렸다가 사고 말지 하게 되는 거다.

막상 사용해보면 그래도 x86 hackintosh가 저렴한 비용으로 막대한 자원 (RAM, SSD)으로 호사를 누릴 수 있다는 장점은 여전하다. M? machine들이 나름 싱글 코어로는 빠르긴 해도
Ryzen 7950x라든가 향후의 9950x 같은 것들을 쓰고 램을 펑펑 쓰면 사실 M4 pro Mac mini 한 대 살 돈으로 훨씬 여유로운 컴퓨팅을 할 수 있으니까. 어차피 인텔 CPU가 아니면 mps를 못 쓰게 되니까 (하려면 또 굉장한 레벨의 꼼수를 부려야 할 거다) GPU 좋은 것도 별 다른 의미가 없다. 그렇다고 해킨에 CUDA를 쓸 수도 없다. 최근의 cuda driver라는 게 macOS로 지원이 안된다. 

