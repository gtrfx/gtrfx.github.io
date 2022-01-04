---
title: "OpenSSH update issue.."
tags: [openssh]
---

무슨 이유에서인지 알 수 없으나 openssh가 판올림을 하면서 예전 openssh 서버에 접속할 때 매끄럽지 않은 모양새를 보여주고 있다.

진짜 옛날 서버에 접속하려 하면 특정 키를 지원하지 않는다 라고 한다든가 예전에 등록시켜놓은 key로 접속하려고 하면 거부당했다는 메시지가 뜬다.

이게 어쩌다 한 번 접속한 경우라고 하면 쉽게 넘어갈 수 있지만 자동화를 해놓았다거나 git을 쓴다거나 하면 화딱지 나지 않을 수 없는 일이다.

어떻게 해결하냐고??

.ssh 폴더 안에 config라는 파일을 만들고 다음과 같이 써넣는다.

Host [target host name]
HostName [target host address]
HostKeyAlgorithms=+ssh-rsa
PubkeyAcceptedKeyTypes +ssh-rsa

별 것 없다. 그냥 rsa 알고리즘과 그 공개키를 쓰겠다고 하면 된다. 예전엔 이게 default로 먹혔으니 상관없지만 지원하는 알고리즘과 키 종류가 늘어나다보니 어쩔 수 없는 선택을 한 것 같다.

