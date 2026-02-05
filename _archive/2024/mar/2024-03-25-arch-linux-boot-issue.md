---
title: "arch linux 부팅시 블랙 스크린/부팅 안될 때"
tags: [linux]
layout: post
author: "Keith"
---

NVIDIA 그래픽 카드가 꽂혀있으면 안되는 문제가 있다고 한다. 

증상은 부트 화면에서 triggered 어쩌고가 마지막으로 출력되고 화면이 확 꺼져버리는 것이다. 네트워크가 연결되어진 상태가 아니기 때문에 뭘로 해도 설치 과정을 진행시킬 수가 없다.

이게 말이 되는지 잘 모르겠는데 어쨌든 잘 안되면 부트 옵션에 아래를 더해 주면 된다. (나는 이래서 성공했다)

```
module_blacklist=nouveau
```