---
title: "rtorrent와 flood"
categories:
    - computer
---

rtorrent는 text interface로 동작하는 매우 기특한 torrent 프로그램이다. 매우 가볍기 때문에 raspberry pi는 물론 소형 컴퓨터에 올려놓고 돌릴 수 있다는 장점이 있는데, 사실 이것을 컨트롤 하려면 매번 ssh 같은 것으로 접속해서 상태를 확인해주어야 하는 불편함이 따른다.

이것을 매우 간편하게 할 수 있도록 도와주는 웹 인터페이스가 flood이다. npm으로 아주 쉽게 설치가 가능하고 일단 설치가 되면 언제 어데서든 웹 인터페이스로 쉽게 rtorrent를 제어할 수 있다. 

https://github.com/jfurrow/flood

