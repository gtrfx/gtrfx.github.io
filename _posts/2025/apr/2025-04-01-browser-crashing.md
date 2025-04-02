---
title: "Linux: browser를 띄우면 Xorg가 crashing하는 경우..."
tags: [life]
layout: post
author: "Keith"
published: false
---

먼저 내 컴퓨팅 환경을 요약하면:

- Ryzen9 7950x
- NVidia 5070 Ti
...

이 환경에서 arch linux를 설치하고 xfce4를 설치해서 간단하게 사용하고 있는데, 신기하게 web browser를 설치할 때마다 X가 죽어버리는 일이 생겨서 확인해봤다.

7950x에는 내부에 GPU core가 들어있어서 linux에서 이걸 인식해서 이게 뭔가 시스템 동작에 영향을 미친다.

다른 GPU가 설치되어있다면 modprobe.conf에 다음을 추가하고 mkinitcpio -P 로 업데해주면 문제가 해결된다.

```
blacklist amdgpu 
```