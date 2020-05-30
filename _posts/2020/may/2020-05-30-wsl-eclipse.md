---
title: "WSL에서 Eclipse 쓰기"
layout: post
image: https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRd41rbKb83I4VggG4tgI208cOCEKMix3q1Sb9iI0_EkP8HTnDP&usqp=CAU
tags: [WSL, eclipse, Linux]
---

Eclipse가 여전히 많이 사용 중인 것은 eclipse외에 뚜렷한 대안이 없기 때문이지 싶다. 지금보면 vs code보다 답답한 인터페이스와 쓸데없는 무거움을 가지고 있는데, vs code가 못하는 일이 있으니 어쩔 수 없이 써야할 경우가 생긴다. 

그것은 이런 저런 응용분야에 특화된 IDE 기능 때문이다. 이것을 VS code라든가 그 외에 가벼운 텍스트 에디터에서 똑같이 실현해보려했지만 할 수는 있지만 동일한 만족도를 얻기 어려웠다. vs code도 여러 가지 플러그인을 써서 어렵지 않게 문제를 해결할 수도 있지만, eclipse가 아니면 불편한 경우가 존재한다. 

사실 코딩을 위한 편집기로서의 기능으로는 내가 봤을 때 Xcode를 능가하는 편리함을 주는 것은 없었다. Eclipse는 거기까진 가지 못하지만 자바VM 위에 올라가 있는 이라 여러 가지로 무겁다. 컴퓨터 속도가 올라가서 예전만큼의 묵직함은 좀 덜해졌지만.

WSL에서 eclipse를 쓴다고 보면 WSL 혹은 윈도우즈 위에 eclipse를 올려서 하면 되겠구나 싶은데, 실제로 윈도우 위에 올리면 WSL과 path가 같지 않아서 돌지 않고, WSL에 올리면 WSL 전용의 linux file explorer를 쓸 수 없어서 답답한 게 있다. 그렇다. nautilus 같은 거 설치해서 Xserver를 통해서 띄우면 된다. 그런데 nautilus를 설치하려면 이것만 설치되는 게 아니라 gnome desktop을 통째로 설치하게 된다. 

그래서 잠시 고민하다가 구글링을 해보면 eclipse-theia라는 프로젝트가 있음을 발견하게 된다. vs code와 매우 유사한 외관을 가지고 있는데, eclipse처럼 쓸 수는 없다. 그냥 vs code처럼 쓸 수만 있다. 이것은 eclipse처럼 빌드가 된 자바와 바이너리의 형태로 배포되지 않고 nodejs source code의 형태로 배포된다. 따라서, 받은 사람이 자신 빌드해야 한다. 그러면 electron을 써서 X로 띄울 수도 있고, web browser로 접속해서 쓸 수도 있다. 그런데 무겁고 느리다. 

Node js를 좋아하는 이들이 만든 것 같은데, npm이 아니라 yarn이란 것을 이용해서 동작시킨다. 빌드하느라 시간이 꽤 걸리는 (nodejs + c++이다보니까) 데 이럴 바에야 그냥 vs code를 쓰는 게 낫다.

그래서 결론은?

eclipse를 WSL위에 설치하고 gtk 설치해주고 해서 X server를 통해서 뿌려주는 게 가장 빠르다. 그래도 분명히 mingw류에 비하면 빠르고 더 잘 돌아간다. mingw로 win64 binary를 만들고 싶으면 linux에서 mingw 포팅용 gcc/g++을 써서 빌드하면 된다. 