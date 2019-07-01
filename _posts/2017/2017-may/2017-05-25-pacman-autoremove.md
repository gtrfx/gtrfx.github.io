---
title: "pacman autoremove??"
---
# pacman autoremove??

아쉽게도 pacman에는 autoremove가 없다. 대신 다음과 같이 활용이 가능하다.

```
pacman -R $(pacman -Qtdq)
```

그렇다. 사용하지 않는 package를 찾아서 지워준다는 것이다. 한줄로 끝난다. crontab에 넣어서 주기적으로 관리해주면 신경쓰지 않아도 된다.

