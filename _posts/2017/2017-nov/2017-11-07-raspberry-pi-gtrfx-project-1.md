---
layout: post
title: "Raspberry Pi GtrFx project (1)"
categories:
    - project
    - music
    - gtrfx
    - raspberry_pi
author: "Keith"
---

이번엔 외부 컨트롤러를 만들기 위해서 GPIO를 다루는 방법에 대해서 이야기하기로 한다.

라즈베리 파이가 외부와 소통할 수 있는 방법은 다양한데, 가장 쉽게 할 수 있는 것이 GPIO를 이용하는 것이다. GPIO를 사용하는 방법이 딱히 좋은 API로 구성되어있는 것은 아니고, io file을 건드려주는 것으로 컨트롤 하게 되어있다. 이것을 C/C++로 만드는 것도 마찬가지로 같은 방법을 사용한다.

과정을 대충 요약하면 다음과 같다. 

1) GPIO관련 io file은 다음 위치에 있다.
```
/sys/class/gpio/export
```
2) 특정 GPIO 핀을 사용하려면 먼저 핀 번호를 위 위치에 먼저 알려주어야 한다. 

    즉, 4번핀을 쓰겠다면 아래와 같이 한다. 이 작업은 물론 root만이 할 수 있다.

```
echo "4" > /sys/class/gpio/export
```

    이 결과 해당 폴더에 gpio4라는 폴더가 하나 생긴다. 이 폴더는 4번 핀과 일어나는 통신을 담당하는 폴더가 된다.

3) 핀을 출력 혹은 입력으로 쓸지 알려준다.

    입력으로 쓸 것이라면 in 출력이면 out이라고 알려준다.

```
echo "in" > /sys/class/gpio/export/gpio4/direction
echo "out" > /sys/class/gpio/export/gpio4/direction
```

4) 핀과 소통한다.

    입력 상태로 해놓았다면,
```
cat /sys/class/gpio/export/gpio4/value
1
```

    출력상태로 해두었다면,
    
```
echo "0" > /sys/class/gpio/export/gpio4/value
```

C/C++ 작성할 때도 해당 파일과 읽기 쓰기를 하는 것으로 소통하게 된다. 일반적으로 알고 있는 GPIO와의 소통방법, 즉 특정 io mapped memory address를 읽어들이는 것과는 다르게 바보(?)같다. 속도도 전혀 빠를 것 같지 않고 (그렇지만 나름 빠르다).

결국, 이 일을 하기 위해서는 좀 바보 같은 일을 하는 함수 몇 개를 짜놓고 라이브러리를 만들어쓰는 것이 편하다. 이것을 python으로 하는 것들을 많이 가르치고 보여주고 하는 것 같은데, 아이들이 그런 방법으로 실습하고 바보같은 노가다를 해야한다는 것을 생각하면 조금 가슴이 아프다.

어린 시절 8255를 가지고 놀 때가 훨씬 더 깔끔했던 것 같은데, 속도도 빠르고 말이다. 물론 8255를 가지고 놀려면 지금보다 (납땜) 노가다와 기초 작업이 훨씬 더 많이 필요했던 것은 사실이다만.

