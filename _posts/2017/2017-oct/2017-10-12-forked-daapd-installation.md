---
layout: post
title: "Forked-daapd setup in arch linux arm"
categories:
    - learning
---

If you need antlr3-c library, just try

```
pacman -S libantlr3c
```

After lauching forked-daapd, i f you gets an error message regarding mdns (avahi). Just try

```
systemctl restart avahi-daemon
```

and then relaunch forked-daapd.

