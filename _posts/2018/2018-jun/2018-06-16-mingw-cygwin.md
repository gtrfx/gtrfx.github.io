---
title: "MinGW(w32/w64)/Cygwin 속도 비교"
categories:
    - computer
    - compiler
---

개인적인 호기심으로 별 대수롭지도 않은 걸로 덕질을 하는 것 같다.

어쨌든 공들여 알아낸 것이니 만큼.

FFT 계산을 하는 것으로 동일한 윈도우 플랫폼 (윈도우즈10)에서 

cygwin/mingw32/w64 (이상 g++)/visualstudio를 가져다놓고 어떤 게 빠른지 실험해봤다.

cygwin이 말도 못하게 빨랐다. 그 다음 mingw64/VC++ 마지막으로 mingw32였다.

4096 포인트 FFT를 10000번 수행하는 것인데, 각각의 3군간의 속도차이는 제법 나타난다. 실감이 난다. 

같은 머신에서 우분투로 부팅해서 g++로 컴파일 한 결과 cygwin보다 약간 빨랐다. 다음은 MacOS에서 clang-LLVM의 경우 MinGW/VC++와 비슷한 결과가 나왔는데, brew로 g++를 빌드하는 과정에서 OS가 너무 최신 버전이라 (10.14 beta) 아쉽게도 실패하였다. 아마도 Linux/Cygwin과 유사한 결과가 나올 것으로 예상된다.

정리하면..

gcc/g++이 native하게 빌드하는 경우 가장 속도가 빨랐고 그 다음이 clang/LLVM /VS C++/MinGW64, 그리고 가장 느린 것이 mingw32였다. 
