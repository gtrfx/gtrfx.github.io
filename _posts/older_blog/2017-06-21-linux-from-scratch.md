---
title: "Linux From Scratch"
---
# Linux from Scratch (LFS)

[![LFS](https://img.shields.io/website-up-down-green-red/http/shields.io.svg?label=LFS&style=plastic)](http://www.linuxfromscratch.org)

특별히 용어라고 하기도 뭐하긴 한데, 리눅스를 더욱 더 응용분야에 최적화해서 사용하려는 사람들이 만들어서 진행하는 프로젝트이다.

말 그대로 바닥부터 시작해서 올리는 리눅스라고 보면 된다. 우리가 잘 아는 우분투와 같은 배포판은 설치해서 삭제하게 될 때 까지 한번도 사용하지 않는 애플리케이션들을 많이 가지고 있다. 더구나 계속해서 이들을 업데이트 하기 때문에 불필요한 자원을 많이 소비하게 된다.

LFS는 커널부터 애플리케이션까지 모두 손수 올리는 작업이다. 대신 불필요한 기능을 최소화했기 때문에 매우 저렴한 비용으로 운용이 가능하다.

리눅스를 용도에 맞춰서 잘 설치하는 경우 10메가 이내로 설치가 가능하다. 불필요한 어플리케이션을 최소화했을 때다.

요새는 아무리 못해도 8 GB 정도의 tfcard 정도는 사용하는데, 예전 기준으로 생각하면 상당한 용량이다.

커널을 컴파일 해보면 알겠지만 리눅스 커널도 워낙 다양한 종류의 하드웨어를 지원하려다보니 엄청나게 옵션이 많아졌고 까딱하다간 불필요한 기능과 드라이버를 잔뜩 설치하게 될 수 있다.

이렇게 한단계 한단계 필요한 기능만 자동화해서 빌드해서 사용하다보면 리눅스의 구조에 대해서 더 잘 이해하고 최적화할 수 있다.

단순한 기능만을 사용하는 embedded system의 경우에는 불필요한 application과 service를 들고 있는 것이 모두 무의미하다. 시스템 자원을 잡아먹고 불필요한 전력을 소모하고 원치 않는 hole을 만들기 때문이다.


