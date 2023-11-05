---
title: "Thunderbolt 3/USB-C cable"
tags: [thunderbolt, USB C]
layout: post
author: "Keith"
---

Macbook을 구입한 뒤로는 thunderbolt 3 dock을 두 개 사용하고 있다. 대개의 dock들은 다음과 같은 단자를 달고 있다.
- thunderbolt PD
- USB A/C data port(S)
- HDMI port(s)
- ethernet port

이게 좀 쉽지 않은 게, 어떤 dock의 경우는 USB C를 지원한다고도 하고 어떤 dock의 경우는 thunderbolt 3를 지원한다고 하는데 그렇게 생각하면 사실 USB-C나 thunderbolt 3가 그게 그거니까 다 같이 지원되는 제품이 있는 것 아닐까 하기도 하고, 또 그렇게 보면 USB-C 케이블이나 thunderbolt 3 cable이나 같은 것 아닐까 하기도 한다. 둘다 24pin을 쓴다. 사실 앞뒤 구분이 없게 만들어놔서 사실상 12 pin을 쓰는 것처럼 보이는데 그렇지 않다. 앞뒤 구분을 하는 pin이 있어서 사실상 거의 대부분의 pin을 모두 데이터 전송/파워 전송에 쓴다.

또 나름 protocol이 있어서 data rate에 대한 negotiation이 일어나고 power 또한 그렇게 negotiation이 일어나는 것이다. 따라서 connector의 모양이 같다고 아무 cable이나 가져다 쓰면 예전에 잘 되던 기능이 안되고 뭔가 속도가 느려지고 하게 된다. 

또 웃긴 것은 dock의 특정 포트에 phone을 연결하면 잘되던 PD가 끊어지기도 하고 한다는 것이다. 이를테면 dock에 macbook과 PD로 power adapter를 연결해놓고 USB data port에 iphone을 연결하면 갑자기 laptop으로 가던 PD가 말을 듣지 않고 iphone과 핑퐁을 치는 모양새를 보여주기도 하고, 이게 좀 반복되면 멀쩡한 HDMI 포트에서 양상출력이 나오지 않는 등 골치아픈 일이 벌어진다.

결론: 콘넥터가 같은 모양의 케이블이라고 해서 다 같은 케이블이 아니다. 특히나 높은 데이터 전송을 요구하는 케이블들은 대부분 길이가 그렇게 길지 않다. 아무리 twisted pair에 LVDS (low voltage differential signaling)라고 하더라도 선로 자체에서 감쇄가 일어날 뿐 아니라 간섭도 발생하기 때문에 길게 만들면 효율이 나빠지기 때문이다. 이와는 달리 power adapter에 쓰이는 것들은 어느 정도 손실이 발생하더라도 데이터를 전송할 필요가 없으니까 긴 것들도 존재하고 또 높은 ampere의 전류를 핸들링 하기 위해서 두껍게 되어있다. thunderbolt cable의 경우는 대개 콘넥터에 marking이 되어있다.