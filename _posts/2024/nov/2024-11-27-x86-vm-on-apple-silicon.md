---
title: "x86 리눅스 바이너리를 Apple silicon mac에서 돌리기..."
tags: [life]
layout: post
author: "Keith"
---

제목이 좀 웃기긴 하지만 이래야 될 때가 좀 있다. docker는 이게 일단 가능하고 docker를 쓰지 않겠다면 qemu를 써서 할 수 있다.

그런데, brew로 qemu를 설치해보면 알겠지만 aarch64를 기본으로 가지고 가기때문에 일부러 x86 모드로 rosetta를 써서 zsh을 연 다음 brew를 설치해서 작업하면 x86용 brew binary들을 가져다 설치할 수 있다.

일단 aarch64로 빌드된 qemu x86_64는 tcg로 돌기 때문에 굉장히 느리다. 반면 x86으로 빌드된 qemu x86_64는 hvf를 이용해서 돌기 때문에 빠르긴 한데, apple silicon위에서는 rosetta를 거치기 때문에 조금 느려진다. 그래도 tcg와는 비교할 수 없을 정도로 빠르다.

docker처럼 container를 가져다 쓰겠다면 qemu로 alpine linux처럼 작은 OS를 설치해서 docker를 구동하면 docker desktop보다 작고 깔끔하게 돌아가는 장점이 있다.

재미삼아 tcg로 돌아가는 vm에서 geekbench를 돌려보면 처참한 숫자를 볼 수 있다. 믈론 rosetta에서 돌리면 그대로 괜찮은 숫자들을 볼 수 있다.

예전 같으면 x86 linux binary를 돌리려고 별도의 x86 머신을 놓고 작업했던 때가 있는데, 지금은 거의 그래야 할 필요를 못 느낀다. 엄청나게 과한 부하로 빨리 돌려야 된다면야 x86 머신이 있으면 좋겠지만 그 정도가 아니라면 m4 mac에서 아쉽지 않은 스피드로 빨리 돌릴 수 있다.

내가 이래서 m4 mac mini를 여러 개 사고 싶은 거다. 엄한 x86 머신 한 대 맞추는 값으로 4개를 살 수 있으니까.

좀 황당하지 않나??