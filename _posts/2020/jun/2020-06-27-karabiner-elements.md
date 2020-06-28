---
title: "Karabiner element 꼭 써야되나?"
tags: [karabiner elements]
---

MacOS에서 이 소프트웨어를 쓰는 이유는 딱 하나다. 일반 키보드에 eject 버튼이 없어서 그것을 강제로 매핑하려는 것이고, 또 단 한개의 키로 한영 전환을 하기 위함이다. 다국어를 해야할 경우엔 키가 하나 더 필요한데 그때도 사용한다.

그런데 이 소프트웨어는 이것 저것 부품이 제법되는 되다가 단순한 키 리매핑 역할만하는데도 귀찮게 떠올라있고 업데하라고 귀찮게 한다. 

MacOS에는 hidutil이라는 것이 있다. USB HID keyboard의 remapping을 해주는 역할을 한다. 문제는 너무 사용법이 간단한 나머지 Karabiner element처럼 사용하기 쉽진 않다는 것이다. 또 Karabiner element는 이 키 매핑 기능이 여러 가지로 확장되어서 정말 사용하기 편한 소프트웨어가 되었다. 단순히 키 매핑 말고도 많은 기능을 제공하는데, 실제로 내가 쓰는 기능은 딱 한 가지 뿐이다.

이번에 MacOS가 업데이트 되면서 Karabiner key는 한동안 제대로 동작하지 않게 되었다. 아마 개발자는 지금 열심히 일을 하고 있겠지 싶은데, 이것은 늘 같은 현상이었다. 

그래서!

간단한 스크립트를 만들었다. 이것이 뭐하는 것이냐면 
- 오른쪽 ALT키를 F18로 매핑하고
- F12를 Eject로 매핑하고
- F3/F4를 볼륨 up/down으로 매핑
하는 스크립트다.

Karabiner Key는 이제 더 필요없다. 아래 스크립트를 적당히 이용하면 원하는 대로 쉽게 키 매핑이 된다. Karabiner element 따위 늘 띄워놓고 원하지 않는 update 메시지 받지 않아도 된다. 실제로 어떤 키가 어떤 스캔코드로 매핑되는지는 usb.org의 문서를 참조하면 된다. 위치가 가끔 바뀌어서 링크를 붙여두지 않음을 이해하시라.

```
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000E6,"HIDKeyboardModifierMappingDst":0x70000006D},{"HIDKeyboardModifierMappingSrc":0x700000045,"HIDKeyboardModifierMappingDst":0xC000000B8},{"HIDKeyboardModifierMappingSrc":0x70000003D,"HIDKeyboardModifierMappingDst":0x700000081},{"HIDKeyboardModifierMappingSrc":0x70000003C,"HIDKeyboardModifierMappingDst":0x700000080}]}'
```

