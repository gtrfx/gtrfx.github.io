---
title: "Where is MacOS kernel in OS installer?"
tags: [kernel, installer]
layout: post
author: "Keith"
---

아래의 위치에서 찾으면 된다. Pacifist를 이용하거나 전부 열거나 해야한다.

/macOS Install Data/InstallESD.dmg/Packages/OSInstall.mpkg/Contents of OSInstall/Contents of Core.pkg/System/Library/Kernels/kernel

같은 폴어 안에 있는 대용량의 Core.pkg가 아님을 명심하자. 이것은 말 그대로 설치해야 할 OS의 Core이다. 




