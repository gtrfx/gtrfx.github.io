---
title: "터널링으로 다른 곳과 네트웍 연결하기(1).."
tags: [tunnel, vpn]
layout: post
author: "Keith"
---

대개 적정 수준 이상의 인원을 데리고 있는 기관에서는 네트워크를 외부로부터 보호하려는 목적으로 다음과 같은 구성을 취한다.

1. 10.x.x.x라거나 192.168.x.x 주소 대역을 쓰는 내부망을 가지고 있다.
1. 외부에 노출이 되지 않는 내부의 DNS server도 가지고 있다.
1. 일부의 트래픽에 대하여 외부로 연결하는 것을 허가한다. 물론 ip masquerade로 처리 된다.
1. 외부에서 내부로 접속이 가능하도록 vpn을 허가한다.

이러하다면 외부에서 내부 접속이 가능한 클라이언트 수를 제한하기 위하여 여러 가지 보안 프로그램이며 인증서 같은 것을 줄줄이 깔아놔서 작은 조건 하나도 만족하지 못하면 연결하지 못하도록 한다.

이러한 경우 여러 대의 컴퓨터가 해당 영역으로 접속할 수 있게 하려면 접속이 가능한 한 대의 컴퓨터를 통해서 트래픽을 공유하도록 해야 한다. 물론 보안 프로그램이라든가 여타의 것들이 그런 것을 할 수 없게 방해한다.

기본적으로 보안 설정이 되어있는 컴퓨터는 해당 컴퓨터에서 외부로의 접속은 가능해도 외부에서 내부로의 접속은 불허한다. 특히나 정해진 소프트웨어 이외의 것들은 설치할 수 없도록 해놓았다. 특히나 네트워크 접속이 일어날 것으로 판단되는 것은 수시로 모니터링해서 제거하도록 유도한다.

결국, 이런 컴퓨터를 이용해서 VPN 접속을 공유하려면 가장 쉽게 떠올릴 수 있는 것이 reverse tunnel이다. 즉, 외부에서 필요할 때마다 접속해 올 수 있도록 하는 게 아니라 데몬처럼 떠 있으면서 외부에 상시 접속해있게 하는 것이다. 이 때 터널은 내가 연결해서 뚫지만 (이것만 가능하므로) 터널의 입구는 상대방쪽에 만들어두는, reverse tunnel을 뚫는 거다. 즉, 외부에서 연결할 수 있도록 터널을 뚫지만 그 주체는 상대방이 아닌 내가 되는 거다. 이 터널은 SOCKS5의 proxy로 쓸 수 있는 일종의 VPN tunnel이 된다.

이게 보안 소프트웨어의 의심을 사지 않고 가능하게 하는 것은 ssh를 이용하는 것이다. sshuttle이란 것을 쓰면 더 좋은데, 이것은 흔히 알려진 응용 프로그램이 아니라 의심을 살 수 밖에 없다. 

이렇게 터널을 뚫고 이 터널을 여러 대의 컴퓨터들이 쓸 수 있게 하려면 또 다른 터널을 뚫어주어야 한다. 이미 ssh로 뚫은 터널은 SOCKS5 proxy를 필요로 하기 때문에 불편하다. 즉, 외부에서 일반 트래픽을 보내면 이것을 SOCKS5 proxy를 통해서 보내고 받고 할 수 있도록 해주는 뭔가가 필요한데, 그것이 badvpn 되겠다. 흔히 tun2socks라고 하는데, tunnel device를 통해서 일반 트래픽을 받아서 그것을 socks5용 패킷으로 만들어서 목적지로 보낸다. 물론 그 반대의 기능도 수행한다.

여기까진 다 좋다. 그러니까, vpn으로 특정 영역으로 접속이 가능한 PC 한대를 통해서 트래픽을 뚫고 이걸 공유시키기 위해서 로컬의 다른 호스트로 리버스 터널을 뚫고 이 터널이 socks proxy용이므로 이것을 일반 트래픽으로 바꿔주는 터널을 badvpn(tun2socks)으로 뚫음으로써 특정 주소 대역으로 통신하려하면 강제로 이쪽 터널로 routing하게 하면 내 로컬에서는 이 vpn 접속을 공유해서 사용할 수 있게 된다.

문제는 DNS다. DNS는 대부분 udp로 정보를 주고 받기 때문에 udp까지 터널링을 해주어야 하지만 ssh tunnel은 tcp만 된다. udp proxy를 하려면 별도의 소프트웨어를 해당 PC에 설치해서 돌려주어야 된다. 될까? 안된다. 

