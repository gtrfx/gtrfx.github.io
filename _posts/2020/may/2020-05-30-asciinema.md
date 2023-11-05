---
title: "터미널 화면 움직 gif로 캡쳐하기"
layout: post
image: /assets/img/test.gif
tags: [asciinema, asciicast2gif]
author: "Keith"
---

이런 저런 방법들이 많이 소개가 되어있고 쓰는 사람마다 이게 좋다 저게 좋다 하는 것 같은데, 내가 봤을 땐

- asciinema: 터미널 화면을 텍스트 형태로 저장/재생함 (실제로 타임코드와 그때 입력된 ascii code가 기록됨)
- asciicast2gif: asciinema로 저장한 파일을 재생하고 그 화면을 gif로 찍어 저장하고 그것을 하나로 묶는 (gifsicle) 기능을 함

이 가장 좋은 방법이었다.

asciinema 같은 것은 Linux/Mac이면 대부분 패키지화 했기 때문에 쉽게 설치가 가능하고, asciicast2gif은 npm으로 설치해야 한다.

node js 같은 경우 확실하진 않지만 python 처럼 파편화가 된 것 같다. 대개 nodejs 10.x 버전을 사용해야 별 무리 없이 빌드가 가능한 것 처럼 보인다. 

asciinema는 녹화를 시작하면 shell을 새로 열어버리기 때문에 녹화후에 그 결과를 gif로 저장하는 과정을 모두 하나의 script로 작성해서 필요할 때마다 쓸 수 있다.

말과 글로 설명해서는 잘 못 알아듣는 사람들이게 특정 컴퓨터 작업을 설명할 때 매우 유용하다.