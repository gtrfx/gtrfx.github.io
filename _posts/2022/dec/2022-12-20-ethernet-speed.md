---
title: "Ethernet speed check.."
tags: [linux, ethernet, mii-tool]
layout: post
author: "Keith"
---

일반적으로 네트워크 스피드를 나는 다음과 같이 체크한다.

### 인터넷 속도 측정

speedtest 라는 툴이 있다. GUI 브라우저가 잘 되는 상황이면 그냥 speed test만 검색해도 온라인으로 측정이 가능한데, 그게 불편하고 커맨드 라인에서 측정해야겠다면 speedtest를 쓰면 된다. 물론 arch linux 같은 데에서 관리해주는 패키지라 그냥 설치해서 쓰면 편하다.

### local network speed

로컬에서 속도를 측정하려면 가장 쉽게 떠올릴 수 있는 것이 iperf 되겠다. brew/pacman 같은 것들을 쓰면 곧바로 설치가 되니까 그렇게해서 쓰면 된다. 쓰는 방법도 매우 간단해서 한쪽을 서버로 만들고 한쪽을 클라이언트로 해서 주고 받기 측정을 하면 된다.

아주 간단하게 다음과 같이 하면 tcp로 패킷을 받는 서버를 만들 수 있다.

```
iperf -s
```

보내는 쪽은 다음과 같이 하면 된다.

```
iperf -c 서버 주소
```

만약 이 상태에서 예상한 것보다 안좋은 속도가 나온다고 하면 mii-tool을 쓰면 네트워크 카드가 어떤 상태로 있는지 확인할 수 있다. 이를테면 네트워크 카드는 좋은데 선로가 안좋다거나 스위치가 낮은 등급의 것인지를 체크하려면 이걸 쓰면 된다.

```
mii-tool [ethernet device]
```

흔히 다음과 같은 결과를 얻을 수 있다.
```
enp5s0: negotiated 1000baseT-FD flow-control, link ok
```
맨 앞은 디바이스 이름이고 나머지는 선로 상태라고 보면 된다. 1000baseT-FD (1GbE, full duplex)이니까 위에 열거한 테스트 방법으로 나온 값들을 적절히 비교해보면 된다.
