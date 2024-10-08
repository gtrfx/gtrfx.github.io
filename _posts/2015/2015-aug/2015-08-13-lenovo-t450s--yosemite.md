---
layout: post
image: /assets/images/4c920543c482d3bb3780d43aca701da1.jpg
title: "Lenovo T450s + Yosemite.."
author: "Keith"
---

업무용 랩탑으로 받은 X230을 얼마전에 T450s로 교체했다. MacOS를 써오던 전력이 있어 Windows7을 그대로 쓰자니 답답한 것이 한 두 가지가 아니라 해킨작업에 따르는 많은 노가다를 감수해야하나 말아야 하나 고민하다 결국 시작했다.10.10은 올리지 말길 권한다. Freeze현상이 있다. 무슨 말이냐면 동작 중에 마우스만 움직이고 화면 동작이 멎어버리는 일이 잦다. 대개 정상적으로 되돌아오는 듯 하더라도 화면 동작에 문제가 생기니까 결국에 재부팅해야만 한다. 10.11에서는 beta 수준에서부터 이 문제가 없었다. 그런데 모든 경우 dock을 이용해서 2nd display를 붙이는 것에는 문제가 있었다. 애초부터 나오지 않을 뿐더러 셧다운할 때 kernel panic이 발생한다.


![image](/assets/images/4c920543c482d3bb3780d43aca701da1.jpg)
설치는 매우 간단하고 타 랩탑에 비해서 다를 게 없는데, 설치 후 부팅을 시도하면 AppleIntelBDWGraphicsFramebuffer.kext로 부터 panic이 발생한다.이것은 intel의 broadwell chipset의 그래픽 드라이버에 해당한다. BIOS에서 DVMT Preallocate memory (그래픽 처리를 위해서 미리 할당해 놓은 주 메모리)의 양을 조정할 수 없게 되어있기 때문에 발생한다. 즉, 이 드라이버는 64-96MB의 메모리가 할당된 것을 가정하고 동작하는데, 대부분의 랩탑은 32MB 정도의 메모리가 할당되어있고 이것이 BIOS를 통해서 변경할 수가 없게 되어있기 때문이다.더욱 안 좋은 것은 Lenovo에서 Pheonix BIOS를 쓰는 기종들은 BIOS를 수정하기 전엔 절대로 이 값을 바꿀 방법이 없다는 것이다.결국 이 드라이버를 패치하는 방법밖에 없다.10.11에서는 추가 모니터를 2개 정도 붙이는 경우를 제외하고 큰 문제없이 잘 작동한다. 물론 내부에 장착된 Wifi module은 사용할 수 없다만 터치 패드는 나름 무난하게 작동한다. 기본적으로 M2 slot이 붙어있는 물건이라 wifi module은 여기에 맞는 것으로 구입하는 것이 맞다고 본다. 그러나 중요한 것은 Lenovo의 BIOS는 자사의 module이 아니면 부팅을 불허하므로 억울하더라도 외장 USB 동글을 사용하길 권한다.----------T450s의 1.14버전 BIOS를 누군가가 mod해서 BIOS에서 DVMT preallocate memory의 변경이 가능하고, whitelist를 제거해서 M2 slot용 wifi module을 아무거나 쓸 수 있게 했다. 그런데, modded BIOS는 흔히 사용하는 bios update S/W로는 에러를 맞이하게 되므로 적용할 수가 없고, EEPROM writer와 test clip을 이용해서 보드에 땜 되어있는 상태의 플래쉬에 직접 프로그래밍해야 한다. 1.14는 최근 버전은 아니지만 사실상 큰 차이가 없으므로, Broadwell chipset의 T450s를 해킨하는데 있어 더 없이 좋은 방법이다. EEPROM writer와 test clip은 ebay혹은 알리 익스프레스에서 사면 $10도 안하는 가격에 전부 다 살 수 있다. ------------USB flash/EEPROM writer + test clip을 이용해서 bios mod를 해봤는데, 버전이 현재 설치된 것 대비 조금 차이가 있어서 그런 것인지 도저히 부팅이 되질 않았다. 무선랜 모듈까지 같이 준비했는데 안타까운 노릇이다. 다행히도 원복이 가능했기 망정이지 BIOS가 원래대로 복구되지 않았으면 낭패를 볼 뻔했다. ------------BIOS mod를 부분적으로 활용하여 최종적으로 모든 문제를 해결했다. 일단 모든 업데이트에 대해서 문제가 없어지고 복구 파티션으로의 부팅이 전부 패닉없이 가능하다. 그러나 dock에서 제 3의 모니터와 연결하는 일은 안된다. 잘은 모르겠으나 VGA port와 dock으로 나가는 display port가 같게 되어있는 모양이다. 기본적으로Mac OS는 VGA port를 지원하지 않는다. 그래서, 윈도우즈에서 내장 디스플레이를 포함하여 총 3개의 디스플레이를 쓸 수 있는 것이 MacOS를 올리면 mini DP port로 붙일 수 있는 디스플레이 하나로 한정된다. 무선랜은 BCM94532Z를 구입했는데, 매우 잘 되고 있다. 10.11에서는 USB port 처리가 엄격해진 문제가 있어서 기본적으로 내장 카메라가 인식되지 않는 문제가 있는데, 블투+Wifi module을 붙이면 블투 모듈도 인식되지 않는다. DSDT 수정, kext inject 작업이 필요하다. 

