---
title: "TCP tunneling 할 때 dns forward하는 방법..."
tags: [tunnel, vpn]
layout: post
author: "Keith"
---

내가 아는 방법들 중에서 가장 쉽게, 보안 프로그램들의 의심을 덜 받는 터널링 방법이 ssh로 SOCKS proxy를 하는 것이다. 일반적으로 SOCKS로 tcp/udp를 모두 tunneling할 수 있다고 알려져있지만 ssh를 쓰면 tcp tunneling 밖에 할 수 없다. 이런 이유로 두 개의 서로 다른 네트워크를 연결할 때 dns forwading이 문제가 된다.

가장 쉬운 방법으로 내가 쓰는 dns server가 강제로 tcp를 이용해서 상대측 dns server에 query를 넘기고 받고 할 수 있다면 모든 문제가 아주 쉽게 풀린다. 그런데 이게 잘 안된다. 아직도 이유를 알 수 없지만 udp를 쓰려고 하기 때문에.

그렇다면 다음에 생각할 수 있는 방법으로 dnsproxy를 쓰는 방법이다. 이것은 강제로 내가 원하는 방법으로 dns query를 forward할 수 있다. 쉽게 말해서 내가 udp로 dns query를 날리면 tcp로 대신 상대측 dns server에 query를 날려준다. 당연히 상대측 dns server는 그 결과를 tcp로 날려주니까 문제가 쉽게 해결된다.

dnsproxy는 github에 올라가 있고 x86 linux/macos 등등에서 곧바로 바이너리를 받아서 쓸 수 있는데, aarch64 linux에서는 별도로 빌드해서 쓰면 된다. 

