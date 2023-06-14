---
layout: post
title: "p212 arch linux install"
tags: [linux, aarch64, arm64]
author: "Keith"
---
#p212 arch linux install

테스트 보드인 p212 보드에 arch linux를 install했다.

150balbee가 작업한 arch linux image를 이용했는데, 아직 모자른 점이 많다.

부트이미지가 필요하다면 다음을 참조하시라
[Click Here](http://freaktab.com/forum/tv-player-support/amlogic-based-tv-players/606133-linux-images-for-s802-s805-s812-s905-s905x-s912-sd-usb-emmc)

대략 요약하면,

- 비교적 경량이지만 빠르게 업데되는 arch linux를 선택함 (현재 raspberry pi 1/2/3에서 모두 arch linux 사용함)
- 기존 android box가 dual boot하도록 하는 update file이 image에 포함됨
- android로 boot하여 해당 update file을 실행하면 USB 혹은 sd card slot으로 dual boot이 가능해짐
- USB로도 boot이 가능하지만 sd card slot에 sd card를 요구하는 message가 계속해서 발생함
- sd card로 boot할 때 image는 BOOT와 ROOTFS의 두개 partition으로 구성되어야 함

궁금증:
- 일단 android tv box 상태를 dual boot이 가능하도록 해놓고 generic arm64용 linux image를 설치하여 boot했을 때 실패함
- 해당 linux image는 p212 board의 dtb를 가지고 있었음에도 boot 실패: 이유을 아직 알 수 없음

지금까지의 문제점:
- video 처리에 문제가 있는지 콘솔에서 작업하면 화면이 깨짐
- console에서 xfce/cinnamon/mate 등등 모두 동작 안됨. video fb에 문제가 있는 것으로 보임
- aarch64 platform에서 kodi 같은 것들은 설치가 안됨
- system update를 통해서 kernel update를 하면 반영이 안됨
- wireless LAN driver가 없는지 module이 인식되지 않음

이외 나머지 arch linux의 다양한 기능들은 사용이 모두 가능함.


Linux kernel에서 어떤 driver들을 지원하는지 아래를 참조.

[open-source_wireless_drivers](https://en.m.wikipedia.org/wiki/Comparison_of_open-source_wireless_drivers)

----
- Amlogic의 3.12대 kernel로 작업한 arch linux에 kodi를 올린 것들은 그럭저럭 쓸만하다. 아쉽지만 fxce나 lxde는 드라이버 작업이 안되었는지 매우 느리다.
- Amlogic meson chipset 및 p212와 같은 일부 보드들은 모두 linux kernel에 반영되어있음. 현재 4.12까지 올라가있으며 mali GPU도 모두 올라가 있음.
