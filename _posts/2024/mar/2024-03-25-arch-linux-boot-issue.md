---
title: "arch linux 부팅시 블랙 스크린/부팅 안될 때"
tags: [linux]
layout: post
author: "Keith"
---

NVIDIA 그래픽 카드가 꽂혀있으면 안되는 문제가 있다고 한다. 이게 말이 되는지 잘 모르겠는데 어쨌든 잘 안되면 부트 옵션에 아래를 더해 주면 된다. (나는 이래서 성공했다)

```
module_blacklist=nouveau
```