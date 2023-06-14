---
title: "Jenkins agent 만들기"
tags: [jenkins]
layout: post
author: "Keith"
---

재미삼아 Jenkins로 자동화를 했는데 어쩌다보니 1년 넘게 사용하고 있고 이를 통해서 제법 시간을 벌고 있다. 

최근에 몇 가지 문제 (OOM)로 시스템이 뻗어버리는 경험을 하고보니 agent도 둬볼까 하고 잠시 시도해보았다.

Agent라는게 jenkins.war를 daemon처럼 띄워놓으면 master node에서 접속해서 원격으로 작업을 돌릴 수 있는 뭐 그런 거 아닐까 했는데, remote.jar라는 것을 구동시키는 매우 간단한 방법으로 돌아가는 것이고 (그래 난 이런 게 좋다) 접속하는 방법도 다양하지만 ssh를 쓸 수 있으니까 편하고, 더구나 Jenkins는 CLI가 있어서 좋다. Jenkins가 흥하는 게 다 이유가 있다. 

결론만 요약하면
- Jenkins site에 나와있는 docker container를 이용한 agent node 만들기 예제는 잘 안된다. 따라 하지 마라. 시간만 낭비한다.
- VM을 쓰는 파이프라인의 경우 agent를 docker container로 만들면 nested VM이 되어 관리가 복잡해진다. --> 결국 포기.
- 비교적 안정적인 네트워크를 사용 중이라면 그냥 ssh로 원격접속하는 agent가 가장 쉽고 빠르다. 아무 것도 설치할 게 없다. 계정만 만들어주고 접속하는 방법만 알려주면 Jenkins가 알아서 한다.

또 build pipeline 중에 VM 말고도 다른 docker container를 굴려야 되면 마찬가지로 nested docker container가 되는데, 이 역시도 docker가 허락해준다고는 하지만 어차피 삽을 떠서 진행하다가 안되면 될 때까지 헤딩하면서 시간 소비할 것을 생각해서 그냥 포기했다. VM이나 docker container를 굴려야 하는 거라면 agent를 docker container로 만들어서 머리 아플 이유는 없다고 본다.

내 경우 3개의 linux container에 1개의 windows VM을 굴리고 있는데 이걸 모두 한 개의 container에 모두 넣어서 굴려야 된다. 말 그대로 하나에 다 넣고 관리하면 최종적으로 한 개의 파일만 관리하면 되니까 대단히 간편해지는데, 이미 말했다 시피 nested VM에 nested docker container가 되는 상황이라 애매하게 잘 구동하지 않는 상황을 만나면 매우 골치 아파진다. 

이러한 경우 docker container를 가져오는 일 (docker import/export), 또 VM을 가져오는 일 (virtual file system은 대개 수십 GB 정도 한다)까지 해야 하니까 이걸 docker container 하나에 다 넣어서 관리하겠다는 것은 아직은 좀 버거운 일 아닐까 한다. 귀찮지만 migration script를 한 벌 만들어놓고 여기저기 복사하게 해놓으면 container 하나에 꾸역 꾸역 넣어놓는 것에 비해 그리 번거롭진 않다. 

문제는 ip address를 사용해야 하는 경우가 발생하는 것인데 이 때에는 agent마다 전부 설정해줘야하는 귀찮음이 있다.


