---
title: "Sidecar, Continuity camera 안되는 경우..."
tags: [hackintosh, ryzen]
layout: post
author: "Keith"
---

나는 이게 인텔 GPU가 없어서 안되는 것인 줄 알고 포기했는데, 알고보니 smbio에서 macpro를 선택하면 feature가 lock이 되기 때문이란다. 그런 이유로 FeatureUnlock.kext를 받아다가 설치하면 된다기에 해봤는데 잘된다.

Sidecar는 원래 쓰지 않는 기능이라 확인해보진 않았는데, iphone으로 continuity camera를 하면 잘 된다. 기실 웹캠을 쓰고 싶은 생각이 없을 때 이걸로 하면 제법 괜찮다, 아니 웹캠보다 화질이 훨 낫다. 

물론 화상처리를 위해 들어가는 계산량 때문에 웹캠보다 약간의 딜레이는 더 있지 싶지만 그거야 그렇게 감수하면 그만이니까.

