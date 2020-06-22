---
title: "D-Bus는 뭐하는 것임?"
tags: [d-bus]
---

d-bus 문제에 가끔 휘말릴 때가 있다. Docker container를 쓰거나 wsl로 linux를 불러서 쓸 때 그런데, 이런 저런 애플리케이션을 쓰다보면 가끔씩 warning이 뜨기도 한다. 또 어떤 일을 하려고 하면 dbus에 문제가 있어서 안된다는 경우도 생긴다.

d-bus의 d는 desktop이고 bus는 말 그대로 데이터를 주고 받는 버스를 의미한다. 그래서, d-bus는 아주 쉽게 말해서 gnome이나 kde 같은 리눅스 데스크탑 소프트웨어의 구성품들끼리 통신하기 위한 소프트웨어적인 버스라고 보면 된다. 소프트웨어적인 버스이고 동시에 실행 중에있는 서로 다른 task들끼리 데이터를 주고 받기 위한 버스이기 때문에 그 스스로가 하나의 프로세스가 되어서 늘 떠 있어야 되고 그러다보니 daemon의 형태로 시스템에 늘 떠있게 된다.

흔히 docker나 wsl에서 d-bus 관련된 warning을 맞는 것은, 이 dbus daemon이 제대로 떠있지 않아서 인 경우가 많다. 이것은 systemd로 부팅할 때 daemon으로 떠 있게 되는데 docker나 wsl에서는 일부러 systemd를 돌리지 않는 이상 떠오르지 않기 때문이다. 그러니까 warning을 맞을 때 내가 실행한 application은 linux desktop에 의존하는 것이라 dbus로 linux desktop과 통신하려 했는데 dbus daemon이 떠 있지 않으니 이런 저런 warning을 내는 것이다.

더 자세한 것은 구글링하면 다 나오니까 더 이상은 필요가 없을 듯 하다. 

아주 쉽게 생각해서, '아 부팅초기에 daemon을 띄워 돌리는 시스템이 아니로구나.', 혹은 'deamon들이 제대로 올라가지 않는 시스템이구나', 혹은 '내가 linux desktop을 지원하지 않는 시스템에서 linux desktop에서 뜨는 애플리케이션을 실행했구나' 하면 된다. 대개 이것 저것 물려서 복잡하게 돌아가야 하는 애플리케이션이 아니면 dbus 관련 warning 따위는 무시해도 된다. 