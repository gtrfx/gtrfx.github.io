---
title: "pacman: mirror site name resolve timed out"
tags: [arch linux, systemd resolved]
---

나는 습관적으로 라스베리파이에 들어가서 "pacman -Syyu"를 자주하는 편이다. arch linux를 사실 다른 리눅스들보다도 좋아하는데, 그 이유가 업데가 대단히 빠르기 때문이기도 하고 군더더기가 정말 없기 때문이기도 하고 업데하다가 문제 생기는 경우도 많지 않기 때문이기도 하다.

그런데, 만일 배포되는 package가 아닌 locally built package인 경우엔 이게 좀 달라진다. 무슨 말이냐면 배포되는 패키지는 pacman이 한꺼번에 업데를 해주니까 편하지만, 필요에 의해서 내가 build한 것들은 시스템 패키지들이 업데되면 버전이 다르다는 이유로 잘 되던 것도 안되는 일이 생기기 때문이다.

사실 고작 라스베리파이 가지고 그러냐 할 수 있는데, 라스베리파이로 하는 일이 제법 많은 편이라 이게 좀 독이 되기도 한다. 사실 그냥 내버려둬도 되는 것을 자꾸 긁어부스럼 만드는 게 내 성격인가 싶기도 하다만.

최근의 업데이트를 하고 난 뒤로는 pacman으로 업데가 잘 안되는 문제가 발생했다.

systemd-resolved라는 게 새로 추가가 된 모양인데 애플리케이션에서 name resolve를 요청하면 이 daemon을 통해서 하게 된 것 같다. 요약하면 일반적으로 /etc/resolv.conf에서 DNS server를 참조해서 곧바로 ip address를 가져오는 과정에서 systemd-resolved라는 것이 중간에 끼어들어서 약간 더 복잡한 일을 하게 해준 것이라고 봐야 맞겠다. 이를테면 일반적인 DNS와 local DNS를 섞어써야 하는 경우에 좀 더 지능적인 name resolve를 해주는 역할을 하지 싶다 (그게 아니라면 있어야 할 이유도 없다).

그런데 이게 제대로 작동을 못하고 있어서 내내 name resolve fail/time out이 나는 것이다. 사실 이것을 알아내는 것도 수십분을 소비시켰으니까 좀 한심한 건데 (괜히 업데했어!), 혹시나 이것 때문에 골치 아픈 사람이 있을까 몰라서 적어본다.

대부분의 사용자들은 이런 기능 별로 필요 없다. 다들 google DNS라든가 ISP가 제공하는 DNS를 쓴다. local에 있는 host면 그 수가 많지 않을 땐 다 /etc/hosts에 넣어놓고 쓴다. 

별 짓을 다 해봤는데 좋은 결과를 얻지 못해서 그냥 죽여버렸다. 생각해보니 이것들이 내 허락도 없이 업데하면서 강제로 enable했다는 것도 좀 기가막힌다.

어떻게 죽이냐고?

```
systemctl disable systemd-resolved
```