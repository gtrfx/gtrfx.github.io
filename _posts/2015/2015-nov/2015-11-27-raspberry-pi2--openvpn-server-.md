---
layout: post
title: "Raspberry Pi2 + OpenVPN server..."
---


잘은 모르나 요샌 공유기의 성능이 좋아지고, linux based로 되어있어서 공유기 스스로 smart한 network filtering은 물론이고 VPN gateway기능을 가지고 있는 것들이 있다. 과거에는 별도의 gateway 호스트를 두고 관리했을 일을 공유기가 전부하고 있는 것인데, 이럴 땐 힘들여 open vpn을 설치할 이유가 없고, 공유기의 web interface를 그대로 따라서 시킨대로 하면 된다.




이 포스팅은 구식 공유기를 사용하는 입장에서 집안에 VPN gateway가 있었음 하는 사람을 위한 것이다.




기본적으로 Raspberry Pi는 하루 종일 켜 두어도 전기료에 미치는 영향이 미미하므로 이걸 이용해서 vpn server를 만들어두면 여러 모로 요긴하다. 내 경우는Raspberry pi가 NAS며 audio server 등등의 기능을 모두 겸하고 있어서 외부에서 집에 있는 파일을 가져와야 하거나, 갑자기 삘을 받아 듣고 싶어진 음악을 찾아들을 때 매우 요긴했다. 그 수많은 음악파일을 스마트 폰에 넣어둘 수는 없는 일이고, 유료 서비스라고 하더라도 접속해서 검색해서 듣기 까지 참으로 많은 과정을 거치게 되니까 말이다. 또 내가 원하는 음악이 상시 있으라는 법도 없고.




대개 집안에 유무선 공유기가 있는 상황이라 raspberry pi를 이용해서 유무선 공유기의 기능까지 대신하라고 하는 것은 무리다. 광랜이 보편화된 한국에서는 Raspberry pi2라 하더라도 광랜의 속도를 감당하기 어려울 것으로 본다. openvpn server는 그 자체가 gateway가 되어야 할 필요는 없다. 다시 말해 외부에서 들어오는 vpn 트래픽을 같은 네트워크 카드로 받아서 암호화/캡슐링을 위한 이런 저런 해제 절차를 수행하고 그것을 다시 내보낼 수 있다. 즉, 난 바깥에 있지만 Raspberry PI가 대신해서 내 스마트폰의 트래픽을 집안으로 흘려서 마치 집안에 있는 스마트폰처럼 동작하게 된다. 단 하나 아쉬운 것은 broadcasting/multicasting traffic을 받아서 중계해주지는 않는다는 것이다. bonjour/avahi가 뿌려대는 패킷은 전달되지 않는다. avahi에 옵션을 줘서 해봐도 안된다. 그냥 포기하고 다른 방법을 쓰는 게 낫다.




본론으로 돌아와서, OpenVPN은 이미 build된 package가 있으므로pacman이든 apt든 rpm이든 그대로 받아서 설치하면되니 매우 간단하고, 

실제로 노가다를 해야하는 부분은 key를 생성하고 client에 key를 전달하고, 접속을 시도해봤을 때 생기는 문제들을 해결해야 하는 것이다. key의 경우는 easy-rsa를 받아서 설치하고 readme가 시킨대로 혹은 how-to가 시킨대로 해주면 된다. 말은 간단한데 왜 노가다라고 하는지는 해보면 안다.




어쨌든 대략적인 설치조건을 열거하면




* Raspberry pi 2 + Arch Linux

* OpenVPN server: pacman으로 가져다 설치했으니 최신 버전이고 수시로 system update를 하므로 version number는 찾기 귀찮다.

* Client: tunnelblick for MacOS




대략 도움이 될 내용들을 적어보면,




* server/client key와 pem등 모두 옳게 생성/분배했다면 Tunnelblick으로 접속까진 가능하다. 

* 접속 이후 흔한 문제들은 다음과 같다.

* client에서 public ip address가 VPN 접속 이후에도 바뀌지 않는다며 설정에 문제가 있다고 한다. : 나의 모든 트래픽을 VPN을 통해서 하고 싶다면 public ip address는 vpn server측의 public ip address가 된다. 따라서, 이를 위해 tunnelblick의 setting&amp;gt;advanced로 가면 모든 traffic을 vpn으로 forward한다는 option을 check한다. 

* internet traffic이 흐르지 않는다 - 1 : server에서 dns 정보를 제대로 내려주는지 확인하고, 아닌 것 같다면 server측 configuration에서 강제로 dns server info를 pushing하도록 설정한다.

* internet traffic이 흐르지 않는다 -2 : client의 dns server setting을 "set DNS server"로 한다.

* internet traffic이 흐르지 않는다 -3 : server의 firewall setting (input/forward/masquerade)




그 외에, VPN을 하는 경우에는 server를 거쳐 내 패킷이 다른 곳으로 전달될 수 있도록 packet forward를 위해 kernel option에서 ip forward (/proc/sys/net/ipv4/ip_forward)는 1로 세팅하는 것은 기본이다. 






