---
title: "AMD 머신 해킨토시"
tags: [amd, osx]
---

원치 않게 나 혼자 4대의 PC를 거느리게 되었다. 새로 들어온 한 대를 빼고 모두 native OSX가 설치되어있다. 

다른 OS를 사용하지 않는 이유는 다음과 같다.
- OS 설치 후에도 설치할 게 너무 많다.
- 윈도우즈는 컴퓨터를 금방 느리게 만든다.
- 윈도우즈/리눅스에서는 쉽게 하지 못하는 작업들을 OSX에서는 쉽게할 수 있는 일들이 많다. 

그러한 이유로 생각지도 않게 생긴 AMD 랩탑도 해킨하게 되었다.

대개 AMD 랩탑들은 저가 부품들을 사용한 것이 많아서 AMD CPU 자체는 어떻게 잘 해킨할 수 있게 했다 하더라도 인식이 안되는 부품이 있을 수 있다. 지금 다루고 있는 랩탑에서는 무슨 이유인지 아직 알 수 없지만 다음과 같은 부품들이 인식이 안되고 있다.

- SATA SSD (NVMe가 아니다)
- Wifi module

SSD가 인식이 안되는 것은 처음인데 어쨌든 지금 그러하다. 

예전엔 AMD 머신에 OSX를 설치하려면 별도로 컴파일된 커널이 필요했다. 지금은 부트로더가 커널을 스스로 패치하는 기능이 있어서 그것을 이용한다. 잠깐만 검색해봐도 Clover를 위한 커널 패칭 script가 올라와있는 것을 알 수 있다. 따라서, AMD도 해킨이 생각보다 많이 쉬워졌다.