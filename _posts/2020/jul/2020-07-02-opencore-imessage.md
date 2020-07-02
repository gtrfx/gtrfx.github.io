---
title: "OpenCore bootloader에서 iMessage/Facetime 활성화시키기"
tags: [imessage, facetime, hackintosh]
---

OpenCore로 오기 전에 Ryzen CPU 머신에 macOS를 올렸는데, 당시에 imessage/facetime이 잘 되지 않아서 이게 CPU를 가리는 것인가 하고 말았던 것 같다. 이걸로 연락하는 사람들도 없었으니까.

제대로 동작하지 않을 때엔 iMessage/Facetime을 실행하면 apple ID로 login하라고 뜨는데, 멀쩡한 apple ID를 넣어도 login 상태가 진행되질 않는다든가 아니면 말도 안되는 이유로 할 수 없다고 한다. (도달할 수 없는 연락처라든지 아니면 결재가능한 카드가 아니라느니)

오늘 심심해서 혹시나 하고 찾아보니 ethernet card가 등록이 되어있지 않아서 그랬던 것이란 것을 알았다. 아마도 ehternet card의 mac address라든가 고유한 식별 코드를 signature 삼아 사용하는 것 같다.

어떻게 하느냐?

1) OpenCore configurator를 일단 받아서 설치한다. (Opencore를 쓰면 다들 가지고 있다)
2) Device에서 PCI device/property를 하나 추가한다. OpenCore configurator가 알아서 PCI device를 모두 검색해서 메뉴화해놓았다. 선택해서 추가할 수 있다.
3) PCI device가 추가되면 거기에 property를 하나 추가한다. "built-in"이란 항목이고 여기에 data 값을 "01"로 적어넣으면 된다.

그리고 다시 부팅해보면 PCI device에서 ethernet adapter가 나타나고 특성값을 확인해보면 built-in에 yes라고 나오는 것을 확인할 수 있다.

다음에 iMessage/Facetime을 실행하면 동작한다. 물론 이 때 시스템 UUID 및 시리얼 넘버는 generate해 놓았어야 한다. 적어도 OpenCore bootloader로 설치까지 다 해놓았다면 이 부분은 다 어떻게든 입력이 되어있으니 걱정하지 않아도 된다. 