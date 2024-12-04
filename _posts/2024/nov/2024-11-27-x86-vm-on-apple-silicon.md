---
title: "x86 리눅스 바이너리를 Apple silicon mac에서 돌리기..."
tags: [life]
layout: post
author: "Keith"
---

제목이 좀 웃기긴 하지만 이래야 될 때가 좀 있다. docker는 이게 일단 가능하고 docker를 쓰지 않겠다면 qemu를 써서 할 수 있다.

그런데, brew로 qemu를 설치해보면 알겠지만 aarch64를 기본으로 가지고 가기때문에 일부러 x86 모드로 rosetta를 써서 zsh을 연 다음 brew를 설치해서 작업하면 x86용 brew binary들을 가져다 설치할 수 있다.

일단 aarch64로 빌드된 qemu x86_64는 tcg로 돌기 때문에 굉장히 느리다. 반면 x86으로 빌드된 qemu x86_64는 hvf를 이용해서 돌게 할 수 있을 것 같은데 안된다. 거기에 apple silicon위에서는 rosetta를 거치기 때문에 조금 느려진다. 그래도 tcg와는 비교할 수 없을 정도로 빠르다.

docker처럼 container를 가져다 쓰겠다면 qemu로 alpine linux처럼 작은 OS를 설치해서 docker를 구동하면 docker desktop보다 작고 깔끔하게 돌아가는 장점이 있다.

재미삼아 tcg로 돌아가는 vm에서 geekbench를 돌려보면 처참한 숫자를 볼 수 있다. 믈론 rosetta에서 돌리면 그대로 괜찮은 숫자들을 볼 수 있다.

예전 같으면 x86 linux binary를 돌리려고 별도의 x86 머신을 놓고 작업했던 때가 있는데, 지금은 거의 그래야 할 필요를 못 느낀다. 엄청나게 과한 부하로 빨리 돌려야 된다면야 x86 머신이 있으면 좋겠지만 그 정도가 아니라면 m4 mac에서 아쉽지 않은 스피드로 빨리 돌릴 수 있다.

내가 이래서 m4 mac mini를 여러 개 사고 싶은 거다. 엄한 x86 머신 한 대 맞추는 값으로 4개를 살 수 있으니까.

좀 황당하지 않나??

rosetta 2를 쓰면 대략 20% 정도 성능이 저하 되긴 하지만 잘 돌아간다. 왜?

해당 애플리케이션이 native instruction으로 빌드된 kernel이나 shared object를 많이 불러제끼면 성능 저하가 줄고 (왜냐면 native instruction으로 돌아가는 부분이 늘어나는 거니까) 그게 아니라 자체적으로 만들어넣은 부분이 많으면 rosetta라든가 emulator가 돌아야 되는 부분이 늘어나니 당연히 성능 자하가 늘어나는 거다.

일반 사용자의 입장으로 보면 그래도 aarch64에서 x86을 돌릴 수 있다는 자체가 고마운 노릇인데 거기에 성능저하까지 별로 없다면 좋은 거다. 그래서 linux에서 x86 binary를 돌릴 수 있으면 땡큐인데 애플리케이션에 따라서 자체적으로 x86 shared object 같이 특화된 걸 또 불러대거나 하면 성능 저하가 더 있겠지.

그래서 아예 static하게 link해 버린 게 나을 지도 모른다.

내가 테스트해본 바 M4 mac mini에서 build 된 것의 성능을 100%라고 하면 

1) aarch64 kernel에서 돌아가는 linux VM에서 aarch64 binary를 돌리면 거의 100% 가까운 성능을 내고 (multicore score는 약간 빠짐)
2) binfmt을 쓰는 x86 binary + rosetta는 실패하느라 못 해봤지만
2) docker에서 돌려보면 x86에서 빌드된 binary는 성능이 50% 정도로 떨어진다.

이때의 테스트한 애플리케이션은 거의 모든 계산 작업을 빌드한 시스템의 native instruction으로 한 것이라 성능저하가 매우 뚜렷하다. 
이를테면 그것들을 손수 구현하는 대신 standard library/class를 가져다 썼다면 빠를 수 있는데 말이다.

생각해보면 python이라든가 java 같은 애들은 플랫폼의 구애를 받지 않으니 좋은데 얘들은 원체 속도가 느려서 사실 별 상관은 없다만.
그렇다고 이 애들이 범용성이 아주 높다고 하기 뭐한 게 pytorch 같은 것을 쓴다고 해도 머신의 사양에 많이 의존하고 있고 더 빠른 것을 쓰겠다고 이를테면 mlx같은 것을 쓰면 아무 머신에서나 돌아가지 않으니까 이것도 별로 범용성이 있다고 할 수가 없다. 
더구나 python이 뭔가 버전을 타는 것들이 제법 있어서 아무 python/script/module이나 다 가져다 쓸 수도 없고.

어쨌든..

M4에서 linux를 굴리는데, 자체적인 VM 프레임웍이 굉장히 좋아서 aarch64 linux를 가상머신으로 돌리면 엄청 빠르고(qemu를 쓸 이유가 없다), 여기에 binfmt를 쓰면 x86 바이너리도 돌릴 수 있고 docker 역시 x86 linux binary를 제법 잘 돌린다는 거다.

docker를 쓰는 것도 좋긴 한데, 좀 무겁고 이것 저것 깔고 하는 게 별로 좋지 못해서 그냥 MacOS에서 지원하는 VM framework을 돌리는 게 좋아보이고 여기서 rosetta를 부를 수 있으면 참 좋은데, Sequoia에 와서 이게 잘 안된다는 이야기도 있다.

지금의 분위기로 보면 x86 바이너리가 세상의 주류를 이루고 있지만 m4와 같은 프로세서가 계속해서 등장한다면 어찌될지 두고 볼 일이다.
나야 x86도 쓰지만 apple silicon을 좋아하니까 (더 좋아하게 되었으니) 대세가 aarch64로 옮겨갔음 하지만. 