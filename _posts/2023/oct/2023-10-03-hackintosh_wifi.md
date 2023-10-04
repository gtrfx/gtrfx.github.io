---
title: "Hackintosh와 Wifi.."
tags: [hackintosh, wifi]
layout: post
author: "Keith"
---

Mac으로 나오는 제품들이 대부분 wifi module을 장착하고 있기 때문에 MacOS에서는 wifi module을 쓰는 것이 지극히 당연한 것이고 따라서 hackintosh를 쓰더라도 wifi module이 있고 없고는 매우 중요한 문제가 되었다고 본다. 특히나 iphone을 쓰면 iphone의 많은 기능이 wifi/BT로 연계되는 게 있고 이걸 한 두 번 사용해보면 그 편리성 때문에 MacOS를 쓴다면 분명히 이 기능이 제대로 동작하길 희망하게 된다.

사실 Macbook과 iphone을 사용해보기 전엔 imessage/facetime과 같은 기능은 사용할 일이 아예 없고 apple id와 연동할 생각도 별로 하질 않게 된다. 그런데 이것이 연동되었을 때의 편리함에 한 번 빠지게 되면 안해도 별 지장없는 완성도 높은 해킨 작업을 하려는 욕심을 갖게 되는 거다.

wifi module 중에서 가장 호환성이 높은 것은 broadcom의 chipset들이고 거의 10년 전에 나온 wifi module이라고 하더라도 Ventura (MacOS 13)까지는 잘 지원이 되왔다. 그러니까 해킨이라고 하더라도 이 모듈을 장착하면 모든 기능이 거의 아무런 문제없이 깔끔하게 동작했단 말이다. 

그러나 Sonoma에 와서는 구형 wifi의 지원을 대부분 중단했기에 Ventura에 있는 driver를 강제로 Sonoma에 밀어넣는 작업을 하고들 있다. 이 과정에서 사실상 여러 가지 무리가 따른다. 이를테면 가끔씩 일어나는 OS update 때에 이 작업을 꼭꼭 해줘야 되고 웬만큼 작은 규모의 update는 그냥 skip하는 것이 정신 건강 상에 유리하다. 사실 대부분의 해킨 사용자들이 소소한 업데이트는 건너뛰는 게 일반적이지만, 또 안하고 있으면 찜찜한 느낌이 들어서 또 꾸역꾸역하게 되곤 하니까.

그걸로 따지면 사용자 수준에서 만들어지고 관리되고 있는 intel wifi module들이 오히려 sonoma로 가면서는 더 유리한 측면이 있다. 문제는 그 wifi module이 native한 것들에 비해서 뭔가 원활하게 작동한다고는 보기 여러운 동작을 보여주는 것에 있다.

그래서 결론을 내려보자면:
1) native한 Mac의 기능을 요구한다면 broadcom의 wifi module이 여전히 매력적이긴 하지만 예전에 비해 그걸 유지하는데 제법 노력이 들어가게 되었다.
2) sonoma 혹은 그 이후의 MacOS를 생각하면 intel wifi module도 나름 매력적이다. 지금까지는 드라이버를 만들어서 배포하는 주체가 있고 드라이버 자체를 밀어넣는 것이 당장엔 드라이버 자체가 bulky하다는 문제가 있긴 하지만 Sonoma + broadcom wifi module에 비해서 부담은 덜하기 때문이다.