---
title: "Apple M1에서 QEMU.."
tags: [qemu, apple m1]
---

M1에서 rosetta2는 virtual machine을 지원하지 않기 때문에 x86 qemu를 rosetta로 돌릴 수는 없다고 한다. 결국 apple m1에 설치한 qemu x86은 모든 instruction을 emulate하는 것이기 때문에 수행속도는 매우 느리다. 결국 x86용 윈도우즈는 설치할 수는 있지만 속도가 너무 처참해서 사용하기에 좋지 않다.

