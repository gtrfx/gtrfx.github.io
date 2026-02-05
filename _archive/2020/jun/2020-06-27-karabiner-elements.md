---
title: "Karabiner element 꼭 써야되나?"
tags: [karabiner elements]
layout: post
author: "Keith"
---

Karabiner key는 나름 덩치도 있고 불편한 구석이 있어서 hidutil을 써서 한영키 매핑을 해주면 요긴하다. 특히나 나 같은 경우에는 reboot/(deep)sleep도 단축키를 사용하는 편이라 eject key가 없는 키보드에서는 F12를 eject로 매핑해서 쓰기도 한다. 또 영문 키보드만을 사용할 때도 있고 한영키가 있는 키보드도 사용할 때가 있는데, 이 때 한영키도 먹히고 오른쪽 ALT 키도 먹히게 하려면 아래의 스크립트를 만들어서 사용하게 된다.

물론 keyboard>input source shortcut에 F18/F19를 등록해주어야 한다. 내 경우는 한글과 영어 두 가지만 사용하다보니까 previous/next langauge에 각각 F18/F19를 매핑하면 오른쪽 ALT 혹은 한영키를 모두 한영 전환에 사용할 수 있어서 여러 모로 도움이 되었다.

```
#!/bin/sh
hidutil property --set '{"UserKeyMapping":[
    {"HIDKeyboardModifierMappingSrc":0x700000090,"HIDKeyboardModifierMappingDst":0x70000006D},
    {"HIDKeyboardModifierMappingSrc":0x7000000E6,"HIDKeyboardModifierMappingDst":0x70000006E},
    {"HIDKeyboardModifierMappingSrc":0x700000045,"HIDKeyboardModifierMappingDst":0x700000066}]
}'
    #{"HIDKeyboardModifierMappingSrc":0x7000000E6,"HIDKeyboardModifierMappingDst":0x70000006D},
    #{"HIDKeyboardModifierMappingSrc":0x700000090,"HIDKeyboardModifierMappingDst":0x70000006D},
```