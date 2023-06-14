---
layout: post
title: "Ryzen hackintosh: 5일째 - MATLAB"
tags: [amd, ryzen, hackintosh, matlab]
image: https://static.bhphoto.com/images/images1000x1000/1545834915_1404638.jpg
author: "Keith"
---

MATLAB을 실행하면 죽는 현상을 발견했다. 죽는 위치가 정확히 libiomp5.dylib의 _intel_fast_memcpy였다.

즉, intel용으로 만들어진 fast memcpy인데 뚜껑을 열어보면 CPU 기능에 맞춰서 memcpy를 가장 빠르게 할 수 있는 함수로 분기하고 처리하는 것이다. 이상하게도 이 분기 지점을 이리 저리 바꿔봐도 전부 다 죽는다.

기능은 사실 별게 없고 OpenMP 하자고 만든 라이브러리라 비슷한 게 있나 검색해보니 하나 걸렸다.

그렇다. 이 파일만 바꿔주면 감쪽같이 돌아간다. 이제 남은 것은 Docker 뿐이다. Docker만 잘 돌아가면 (아니 패럴랠즈도 좀 돌아갔으면) 더 바랄 게 없다. 

For non-Korean-readers:

If you can't run your own MATLAB on Ryzen-Hackintosh, please download the following dynamic library 

[https://osdn.net/projects/sfnet_badgui2/downloads/libs/mac64/libiomp5.dylib](https://osdn.net/projects/sfnet_badgui2/downloads/libs/mac64/libiomp5.dylib)

and replace the original libiomp5.dylib at /Application/MATLAB_xxxxx/sys/os/maci64 with this.