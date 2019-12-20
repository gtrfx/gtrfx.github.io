---
title: "AMD 프로세서를 위한 MacOS kernel hack for 10.15.2"
tags: [hackintosh]
layout: post
---

### 현재 상황

현재 10.13/10.14/10.15에 대해서 나와있고 10.15의 경우 최신의 10.15.2는 아직 지원되지 않는다. 그런데 간간히 성공했다는 글들이 올라오는데 이것은 조금 이해하기 힘들다. 정식으로 어떻게 패치해야하는지 나온 바가 없다.

### MacOS가 AMD 프로세서를 구분하나?

Kernel에서 processor의 특징을 찾는 부분이 몇 군데 있다. MacOS는 오직 Intel processor만을 다루고 있는 것으로 알고 있으니까 그 목적은 수 많은 인텔 프로세서 중에 어떤 것인가를 알려고 하는 것인데, 이게 AMD processor가 되면 예상하지 않은 결과가 나와서 오작동을 하게 된다. 

### 어떻게 패치하나?

CPU의 특징을 알아내는 명령어 (이를테면 rdmsr: read model specific register, 즉 CPU마다 고유한 값을 내는 부분을 읽어내는 명령어)가 실행된다거나 하면 그 값이 특정값이 되도록 수정하거나 이와 관련된 확인을 하는 subroutine call이 일어나면 그것을 못하게 하는 등의 방법으로 패치한다.

예전엔 kernel source를 가져다가 재컴파일 하는 방법으로 패치하였지만 지금은 bootloader의 kernel patch 기능, 즉 kernel의 binary에서 특정 패턴이 발견되면 그것을 원하는 다른 값들로 치환하는 방법으로 패치한다. 그러니까 해당 부분에서 발생하는 문제를 피해가는 방법으로 프로그램을 작성하고 그때 나온 op code를 가져다가 대신 채워넣는 것이다.

이를테면 어떤 조건이 성립되면 어디로 점프하라는 부분이 나오면 그냥 무조건 점프하라는 것으로 바꾼다거나 어떤 연산을 수행해서 그 결과를 이용하는 부분을 그냥 아무일도 하지 않는 것 (nop/nopw/nopl..)으로 치환한다거나 하는 것이다. 

다행스럽게도 커널에서는 스스로 checksum이나 hashcode같은 것으로 스스로가 변조되었다는 것을 체크하진 않는 모양이다. 이런 일을 한다면 문제는 좀 더 복잡해진다. 

### 중요 check point

1) disable kernel panic logging
2) commpage_populate: rdmsr이 있는 부분이다.
3) cpu_topology_sort
4) cpuid_set_cache_info: CPUID를 강제로 inject 한다.
5) cpuid_set_generic_info: wrmsr을 제거하고 microcode를 186으로 고정 등등 AMD 용으로 치환함
6) cpuid_set_cpufamiily: CPU family를 모두 CPUFAMILY_INTEL_PENRYN으로 치환함
7) cpu_set_info: Ryzen CPU의 core와 logical processor의 수로 치환함
8) i386 init: rdmsr 제거

같은 맥락으로 기존의 config.plist를 수정해보았다. 10.5.2 커널에 와서 몇 가지 패턴이 바뀌었기 때문에 기존의 patch로는 동작하지 않는 문제가 있어서 10.5.2에 해당하는 부분만 확인하여 수정하였다. 내 Ryzen 2700x으로 확인 후에 추가하도록 하겠다.

급하신 분은 아래 링크를 이용해서 테스트 해보시기 바란다. 

[config.plist](/assets/images/config.plist)