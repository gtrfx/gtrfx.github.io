---
title: "요즘 리눅스에서 smbd 올려놓기"
tags: [samba, smb, smbd]
layout: post
author: "Keith"
---

예전 리눅스에서 smbd를 올려놓는 일들은 별로 어려운 일이 아니었는데, 요즘엔 samba package를 설치하고 이걸로 smbd만 startup으로 올려놓는 게 쉽지 않아졌다.

그 이유야 여러가지가 있겠지만, 대부분 보안성을 생각해서 설정 옵션을 까다롭게 만들어놨기 때문이기도 하다. 

집안에서 smb를 올려두는 일은 매우 흔한 일이고 아예 귀찮아지면 접근 가능한 계정이나 암호를 넣는 것도 죄다 없에버리고 싶어지는 일이 생기는데, 물론 그러다가 누군가 몰래 들어와서 일을 저질러 놓으면 후회를 하게 된다만.

요즘 리눅스에서 samba를 굴리는 양상은 아래와 별 다르지 않을 것이다.

1) 기본 배포판에 samba는 포함안되어있음. 별도로 설치해야 함 (yum, apt, pacman, ...)
2) systemd를 쓰는 배포판이 늘어나서 rc.d라든가 init.d 이런 걸 건드리지 않고 systemd가 찾는 폴더들 (/etc/systemd, /usr/lib/systemd)에 있는 파일들로 뭔가 등록을 시켜야 함
3) samba가 설치되면 samba를 위한 service 파일이 있는데 이건 samba를 실행시키기 위함이지 내가 필요하는 smbd를 위한 것이 아니다. 
4) samba를 실행시키면 /etc/samba/smb.conf의 설정을 참조하는데, 오직 smbd만 실행시키자는 입장에서 메뉴얼/웹서칭등등 별 쓸데없는 짓을 다 해야한다. 물론 그래도 쉽게 올리기가 어렵다.
5) 결국 어떻게해서든 smbd -D를 startup으로 돌리고자 하는 욕심이 생기는데 지쳐서 그냥 manual로 돌리게 된다. 이게 매일 껐다 켰다 하는 호스트라면 보통 번거로운 일이 아니다. 

해답이 뭐냐고? 좀 어설프긴 하지만, 아래 내용을 그대로 복사해서 /etc/systemd/system 에 넣어두고 systemctl enable로 등록하고 start 시키면 된다. 사실 별거 아닌데, 계속 trial&error를 하다보면 짜증이나서 그냥 관두게 된다. 어디 누군가 속 시원하게 documentation을 해놓은 것도 찾아볼 수가 없다. 고작 smbd 돌리자고 samba의 모든 메뉴얼을 읽는 것도 시간 낭비다. 왜? 90% 이상이 별로 도움이 안되는 이야기들이다. smbd를 구동하려는 것이지 samba 전체를 알려고 하는 게 아니니까. 

---
[Unit]
Description=Samba service
[Service]
Type=forking
ExecStart=/usr/bin/smbd -D
StartLimitBurst=0

[Install]
WantedBy=multi-user.target
---

s