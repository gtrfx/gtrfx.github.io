---
title: "여러 개의 망을 써야 될 떄..."
tags: [hackintosh]
layout: post
author: "Keith"
---

필요에 따라 컴퓨터는 한 대인데 여러 개의 네트워크를 동시에 써야 할 일이 있다. 이를테면 로컬망은 일부 주소에 대해서만 http/https를 허용하고 나는 외부의 http/https 서비스를 이용하고 싶을 때.

그러면 두 개의 네트워크 서비스를 물려주면 되지 않느냐 할 수 있다. 이를테면 로컬망은 ethernet으로 들어오고 외부망은 폰의 tethering을 써서 하면 되지 않느냐고. 이론상으로 맞는 말이다. 그런데 실제로 하면 그게 잘 안된다. 

왜? routing 문제를 해결하지 않았기 때문이다. 이를테면 내부망으로 가는 트래픽은 ethernet으로 가야 되고 외부망으로 보낼 트래픽은 tethering device (이를테면 USB)를 통해서 가야되는데 그걸 지정하지 않았기 때문이다. 네트워크 디바이스가 하나 일 때는 모든 트래픽이 해당 디바이스를 통해서 가야되므로 별도로 설정해줄 게 없다. 그러나, 여러 개라면 어떤 트래픽은 어디로 가야되고 하는지 알려주어야 한다.

그걸 일반적으로 "route"라는 명령을 써서 한다. route에 대한 구체적인 사용법은 구글링을 해보길 바란다. 

이렇게 하는 방법도 있지만, microsocks라고 SOCKS proxy를 local로 돌려서 해결하는 방법도 있다. 그러니까 일부의 주소 대역, 주소의 문자열이 맞아떨어지면 socks proxy로 http/https를 가져오고 그게 아니면 local로 돌리는 거다.

그러니까, 구체적으로 예를 들자면, ethernet adapter와 wifi adapter가 있다고 하자. ethernet adapter는 local network에 물려있고 wifi adapter는 phone의 wifi tethering을 이용한다고 가정하자.

1. Mac의 system config에서 network setting으로 가서 service order를 ethernet을 가장 상위로 끌어올린다.
2. wifi adapter를 켜고 폰과 연결한다.
3. 두 interface의 ip address를 확인한다. 그 다음 microsocks를 기동한다.
```
microsocks -i [ethernet address] -b [wifi address]
```
4. ethernet의 세부 설정항목에서 socks proxy를 활성화하고 주소 조건에서 proxy를 쓰지 않을 조건을 명시한다.

