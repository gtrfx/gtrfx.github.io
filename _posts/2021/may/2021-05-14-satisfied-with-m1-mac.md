---
title: "여전히 만족스러운 M1 Mac"
layout: post
tags: [m1 mac, brew]
author: "Keith"
---

Brew 관련 작업하는 분들은 칭송받아야 마땅하다고 본다. 수많은 어플리케이션들이 이미 전부 m1 mac을 위해 brew 작업이 완료되어있다.

아직 돌아다니지도 않는 gcc 11버전도 올라와있다. (엄청나게 빠르다.., 대개 rolling release OS가 배포하는 gcc가 10.2 정도가 최신이니까)

그 뿐 아니다 안돌아가는 게 하나도 없다. 다만 좀 적응과정이 필요한데, 어차피 이거 적응하고 나면 빠르고 편리하게 사용할 일만 남아있기 때문에 이것 때문에 불평하는 놈들은 그냥 인텔맥이나 벽에 X할때까지 쓰라고 하면 된다.

8GB를 구입해서 돌아오는 불이익이 있긴 하지만, 어차피 SSD는 점점 싸지고 있고 그 수명이란 게 대충 컴퓨터를 2번 업데하고도 남을 정도의 수명은 되기 때문에 별 문제가 되지 않는다. 

내 평소 사용 습관대로 쓰고 있는데, 대략 500MB의 메모리가 swap되어있고 대략 중간정도의 메모리 압박을 받고 있지만 사용 환경은 여전히 쾌적하다. 만약 이 때에 갑작스러운 Xcode 업데라든가 시스템 업데가 걸려버리면 골치 아파질 수 있지만 그게 아니라면 아무 상관없다.

8GB 사용자라도 너무 기죽거나 메모리 과민반응 하지 말자. 이런 상황에서도 matlab/vs code/xcode/terminal/itunes/mail/openoffice 다 올려놓고도 (메모리 압박은 있지만) 아무 문제없이 잘 쓰고 있다. 16GB 버전은 M1 차기작이 나온 뒤에 사도 된다. 어차피 ipad air 값으로 산 거니까. 오늘 주식도 5% 넘게 뛰었네.

그런데 약간 아쉬운 것은 화면 해상도 선택 사항 중에서 3200x1800이 사라졌다는 것이다. SwitchResX를 쓰면 되지 싶은 생각을 하겠지만 native하게 지원하지 않는 해상도를 switchresx로 강제설정하면 화면이 흐려진다. 그래서 이것을 쓰지 않는다. 대부분의 GPU들은 지원하고 있는 해상도인데 다소 아깝긴하다. 대충 이해를 하자면 GPU의 처리 방법이 예전과 달라졌기 때문이 아닐까 한다. 즉, 프레임버퍼에 출력물을 직접 쓰고 메모리의 포인터를 날려서 GPU가 직접내보내는 방식으로 되어있기 때문이다. 무슨 소리냐고? 일반적인 방법은 컴퓨터의 내부 메모리에 쓰고 그것을 GPU가 PCIe를 통해서 복사해가서 그것을 다시 frame buffer에 쓰고 그것을 내보내게 되어있다. 당연히 이 과정에서 전류와 시간자원을 같이 까먹는다. 이 과정에서 더 절약을 하자면 애매한 해상도를 지원하지 않으면 된다. 즉 애매한 비율로 interpolation/filtering을 하면 연산과정이 더 요구되기 때문이다. 
