---
title: "테슬라 펌웨어 업데이트 (2024.20.1)..."
tags: [tesla]
layout: post
author: "Keith"
---
요샌 펌웨어가 어떻게 배포되고 있는지 관찰하는 게 나름 취미가 되었다. 어떻게 이 패키지들을 관리하고 있는지 하는 거다.

어제부터 2024.14.9를 가지고 있는 차량들이 대개 2024.20.1로 업데이트 되었다. 무슨 일인지 알 수 없으나 FSD 12.4.x가 아직 배포할 수준에 이르지 못해서인지 12.3.6에 한동안 머물기로 결정한 것 같다. 그럴 바에야 모든 차량들의 펌웨어를 2024.20.1로 통합하려는 움직임으로 보여진다. 이래 저래 확인해 보면 2024.3.25에서 4.19로 올라간 이들 (대개 FSD를 사용하고 있는 이들)도 20.1로 올라가고 있는 걸로 보면 나도 조만간 또 업데이트를 하게 될 것 같다.

아마도 이전엔 FSD와 비 FSD 사용자의 firmware의 차이가 있었던 모양인데 software를 하나로 통합하여 구현하고 FSD도 transfer할 수 있게 하겠다는 것도 사실상 software(VIN 혹은 그외의 식별자)로 on/off 할 수 있게 하게 하려함이 아닐까 한다.

이미 출시된 차량의 종류가 대단히 많기 때문에 예전처럼 뭔가 선행/안정 버전을 여러 개 따로 두는 것 보단 대부분의 소프트웨어가 하나의 버전으로 통합되는 것이 맞을 것 같고 테스트를 위해서 임시 버전을 가끔씩 푸는 것이 소프트웨어 관리에 유리할 것으로 보여지니까 말이다. 