---
title: "Docker를 remote로 돌려보기.."
tags: [macos, docker]
layout: post
author: "Keith"
---

MacOS를 쓰다보면 그 자체로도 좋지만 linux를 필요로 할 때가 있다. valgrind 같은 걸 MacOS에서는 돌릴 수가 없으니 (이게 한 때는 가능했다만 지금은 안된다) linux를 어쩔 수 없이 불러써야할 때가 있기 때문이다.

이 때 생각할 수 있는 여러 가지 중 MacOS에서 file system의 일부를 export하고 그걸 linux host가 mount하고 ssh로 들어가서 쓰는 방법을 떠올릴 수 있다. 이것은 해당 리눅스 박스에 있는 개발 툴을 이용하겠다는 것이고 만일 다른 배포판의 개발 툴을 써야된다면 이 때 생각해볼 수 있는 것은 docker다.

docker server를 MacOS에 둘 수 있다. VM이 잘 동작한다는 가정하에. 그러니까 M1 Mac은 aarch64 linux를 올려서 쓰는 것이고 IntelMac은 x86 linux를 올려서 쓰는 거다. 이미 잘 알다시피 이 때엔 최소사양의 linux VM을 하나 띄우고 그 안에서 docker를 굴리는 것이라서 결국 내 시스템 부하를 그 linux VM에게 넘겨주어야 한다. 이게 좀 느려터지긴 해도 쓸만한데 이것 저것 떠오르는 게 많아서 좀 무거워지는 느낌이 있다. 

이걸 피하고자 하면 외부 linux box에 docker를 돌리고 외부로 포트를 뽑아주고 docker를 remote로 굴리는 방법이 있다. 이 방법은 쉽게 말해서 내 파일 시스템의 일부를 nfs로 내보내고 해당 linux box (docker server)의 힘을 빌어 docker를 굴리게 되는 거다. 사실상 NFS로 내 로컬 파일 시스템을 내주고 ssh로 들어가서 해당 linux box에서 docker를 굴리는 것과 같다. 어쨌든 컨테이너며 CPU 부하며 등등 모두 서버쪽에 떠넘기고 나는 달랑 local file system만 share해서 쓰면 되는 것이니까 여러 가지로 가볍고 좋긴 하다. 또 서버가 어떤 플랫폼이냐에 따라 x86/aach64 등등으로 개발할 수도 있고.

빌어먹을 윈도우즈는 이런 게 없다. 한동안 MS가 linux적인 접근방법을 취하는 듯 하더니 지금은 뭐하는지 모를 일이다. 윈도우즈에서는 docker와 유사한 linux subsystem을 지원했었기에 재미있게 가지고 놀아봤던 것 같은데 그 역시도 단점이 있어서 답답했던 기억이 떠오른다. 
