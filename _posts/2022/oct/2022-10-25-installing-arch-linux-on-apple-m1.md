---
title: "Apple M1에서 Qemu에 Arch linux 설치해보기.."
tags: [apple m1, linux]
layout: post
author: "Keith"
---

이 토픽 자체가 철지난 거라 뭐 이런 걸 이제 적어올리냐 할 수 있는데, UTM처럼 누군가 다듬어 준 도구를 사용한다면 모를까 그냥 맨땅에 해당하는 식으로 설치하려고 보면 이게 쉽지 않은 일임을 알 수 있다.

일단 해야 할 일을 적어본다.

1) QEMU-IMG로 가상 파일 시스템 만들기
2) arch linux arm 받아와서 설치하기
3) qemu로 부팅하기

딱 3개의 스텝 밖에 없지 싶은데 그 사이에 노가다가 좀 많다.

### NBD (Network Block Device)

일단 가상 파일 시스템은 qcow2로 쉽게 만들 수 있을 것 같지만 스스로 부팅할 수 있게끔 하려면 조작이 좀 필요하다. 무슨 말이냐면 가상 파일 시스템 안에 EFI 파티션이 하나 있어줘야 한다. 거기서 uboot으로 리눅스 이미지를 읽어봐서 부트가 진행되어야 하는데 이것을 위한 조작이 필요한 거다. 능력이 있으면 arch linux arm에 대한 iso를 받아와서 해도 되는데, 이게 여의치 않으면 qcow2 파일 시스템을 먼저 만들고 그 안에 파티션을 분할해서 EFI와 non-EFI 부분을 써넣어야 한다. 이게 좀 웃기는데.

qcow2는 최대 크기는 지정해서 만들어주지만 대부분 아무것도 쓰여있지 않을 때는 매우 작은 크기로 되어있다. 이를테면 32GB 짜리 파일 시스템을 만들면 결과 파일이 그보다 훨씬 작은 190kB 정도로 나온다. 물론 여기에 이런 저런 데이타가 씌여지면 크기가 불어난다. raw format의 image들은 내가 설정한 크기 그대로의 파일이 만들어지는 것에 대조된다. 어쨌든 파티션을 만들어주려면 fdisk 같은 걸 불러줘야 되는데 이게 qcow2 image를 불러올 수가 없다. 그래서 누군가 꼼수를 낸 것이 nbd라는 디바이스를 쓰는 것이다. 이게 뭐냐고? network block device라는 거란다. 그러니까 네트워크 어딘가에 블록디바이스를 하나 설정하면 이것을 네트워크로 리모트로 불러다 쓸 수 있게 해주는 device인 거다. 이게 가능하려면 kernel에 해당 모듈이 설치되어있어야 한다. 

위 조건이 맞으면 qemu-nbd 라는 유틸을 이용해서 qcow2를 nbd로 mount 시킬 수가 있다. 생각보다 매우 쓸만하고 요긴한 기능같긴 한데, 메이저 OS에 언제 이런 기능이 들어올지는 미지수다.

자세한 내용은 이곳을 참조하면 된다.

[https://gist.github.com/thalamus/561d028ff5b66310fac1224f3d023c12](https://gist.github.com/thalamus/561d028ff5b66310fac1224f3d023c12)

일단 멀쩡한 arch linux machine이 한 대 있어야하고 (VM이든 뭐든) 그걸 가지고 qcow2 image를 만들어서 qemu를 굴려야 한다.

사실 iso가 제공되는 alpine linux arm을 써서 일단 qemu를 부트시키고 arch linux 따위 docker로 불러버리면 되긴 한다. 다만 chroot로 linux를 실행하는 것이 그다지 맘에 들지 않고 dbus까지 깔끔하게 돌아가는 걸 원한다면 qemu로 native 설치하는 것이 좋긴 하겠지.

qemu로 설치해도 geekbench score는 MacOS에서 native로 굴릴 때의 score와 거의 다르지 않다. 그냥 dumb하게 뜨게 해놓고 ssh로 접속해서 사용하게 하다가 필요에 따라 xfce4 같은 것들 불러서 쓰면 된다.

### Plan 9 (9p)

또 한가지 재미있는게 plan 9이라고 하는 것인데, 내가 접한 것은 qemu를 통해서 local file system을 mount하려고 할 때 쓰는 프로토콜 쯤으로 되어있다. 어쨌든 커널이 이것을 지원해야 사용할 수 있는데, 내가 사용해 본 환경 (MacOS Ventura)는 지원이 되고 있고 마찬가지로 arch linux arm 도 마찬가지로 kernel이 제공해서 별 어려움 없이 사용할 수 있었다. 좀 웃긴 게 qemu로 만든 VM에서 host에서 export하는 file system를 NFS로 mount하지 못했다. local에 있는 다른 machine에서는 잘 mount가 되었는데도 불구하고.

좀 이해하기 어려운 구석은 시스템 메모리를 좀 작게 하고 (대략 4GB) file open을 엄청나게 해대면 분명히 존재하고 있는 파일 임에도 찾지 못한다는 메시지를 받게 된다는 것이다. 더러는 벌려놓은 job이 kill signal을 받고 죽기도 한다. 그만큼이나 안정적이라고 볼 수 없는 모양이다. 대표적인 경우가 multithreading으로 build job을 잔뜩 벌여놓을 때 발생하는데, job의 수를 core 개수만큼 잡아놓아도 이런 일이 발생한다. 시스템 메모리는 아무리 못해도 8GB 정도는 잡아줘야 제대로 돌아간다고 볼 수 있다.

사실 M1 mac에서 8GB가 기본 사양이라 16GB 정도는 달아줘야 qemu도 제대로 쓸 수가 있다.

