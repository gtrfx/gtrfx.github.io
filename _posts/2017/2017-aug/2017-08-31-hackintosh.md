---
layout: post
title: "When you see - failed loading kernel cache at boot time"
categories:
    - hackintosh
    - life
---

High sierra (MacOS 10.3)로 업데이트 한 이후에 발생한 문제이다. Developer beta 8에 와서 발생했는데, 업데이트 도중에 firmware가 맞지 않는다며 설치가 중단되고, 부팅할 때는 kernel cache를 loading하는데 문제가 생긴다며 부팅이 중단된다.

대개 이 경우에 hackintosh의 SMBbios 설정이라든가 혹여 NVRAM이라든가 여러 가지 요소들에 대해서 문제가 있나 없나 열어보게 되는데, 답은 하나다.

**bootloader를 최신으로 업데이트 해라.**

bootloader 제작자들은 전세계에서 오는 수많은 부팅 혹은 동작 문제들에 대해서 리포트 받고 있는 모양이다. 버전업을 하면 예전에 이해할 수 없었던 문제들이 다 해결된다. 이게 다 폐쇄적인 OS를 만들어놨기 때문이다. 한쪽에서는 문을 걸어잠그려 하고 한쪽에선 걸어잠근 문을 찾아다니며 다시 열어놓는다. 

