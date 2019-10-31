---
layout: post
title: "Ubuntu slow boot problem"
---
# Ubuntu booting이 느려졌을 때..

대개 SSD면 부팅이 10초 이내에 완료된다. 그런데 그렇지 않다면 먼저 다음을 확인한다.

```
systemctl-analyze blame
```

그렇다. Blame 받아야 마땅한 boot process를 찾아내는 것이다. 사실은 boot process 들이 소요한 시간을 정리해놓고 이것을 시간이 긴 순서대로 list up한다.

대개 mount가 시간을 많이 잡아먹는데, 다음을 확인하자.

1. 혹시 존재하지 않는 disk를 mount하려고 하진 않는지
1. NFS로 뭔가를 mount하려고 하진 않는지
1. fs-uuid가 틀린 file system을 mount하려하진 않는지

uuid는 blkid 명령으로 확인하면 된다. /etc/fstab을 열어서 맞게 설정되어있는지 확인하자.

그 외에 NetworkManager-wait-on-line.service가 시간을 소비한다. online이 될 때까지 기다려주겠다는 서비스인 것 같은데, 역시나 없어도 무방하니 다음과 같이 처리해주면 대략 5초에서 30초 정도는 시간을 벌어준다.

```
systemctl disable NetworkManager-wait-on-line.service 
```
