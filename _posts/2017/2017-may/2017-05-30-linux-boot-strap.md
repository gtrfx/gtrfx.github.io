---
title: "Linux Boot strap"
---
# Linux Boot strap

bootstrap 과정을 정리하면 다음과 같다. 

EFI partition 혹은 H/W가 지정한 BOOT partition을 읽는다.

대개 이 partition은 vfat (FAT16)인 경우가 대부분이다. 

부팅 순서는 EFI(BIOS) - bootloader - kernel - ...

일반적으로 mini board PC는 EFI나 BIOS가 없다. 보드 구성도 모델에 따라 천차만별이다. 

그래서 kernel은 DTB (device tree blob)라는 것을 가지고 있는데, 대략적으로 text로 된 구조체 설명인데 이것을 dts/dtsi(dts의 추가설명 버전?)라고 하고 이것을 컴파일하면 binary의 dtb가 된다. H/W dependent한 일을 하는 application은 반드시 이 정보를 필요로 해서 compile시에 참조하기도 한다. 
ㄴ
DTB에 대해서는 다음을 참조하자.

[DTB](https://saurabhsengarblog.wordpress.com/2015/11/28/device-tree-tutorial-arm/)

그리고 U-boot

[U-Boot](http://www.denx.de/wiki/U-Boot/WebHome)

부트과정을 살펴보면 리눅스 배포판 마다 살짝 다른 것 같은데, 일단 내가 사용하는 arch linux를 기준으로 보면 부트로더가 부트 볼륨의 파일을 읽어들이는 과정을 보자면, 사실 boot foler에 있는 파일만 가지고 모든 과정을 거꾸로 유추하기 쉽지 않다. 

중요한 파일만 먼저 보면,
- kernel.img 혹은 Image, zImage, Image.gz, bzImage, vmlinuz, vmlinux.gz 로 되어있는 커널
- initramfs 혹은 initrd 등으로 되어있는 램드라이드로 로딩되는 커널의 일부
- dtb로 되어있는 하드웨어 세팅을 알려주는 device tree

등이다.

부트로더는 흔히 x86이 아니면 u-boot으로 알고 있는데, 이 역시도 사실 다양한 경우를 겪어보면 확실하지 않다. 파일 이름을 uboot이라고 붙여놓지도 않고 애매한 것이 사실이다. 

일반적으로 uboot은 CPU의 일부가 씌여있고, 나머지 부분은 모두 외부에서 읽어와서 boot strapping을 마무리 하는 것인데, 이 역시도 제조사마다 다를테니까 방법을 정확히 알기 어렵다.

어쨋든 bootstrapping의 기능은 ssd든 hdd든 또는 SD card이든 emmc이든 kernel을 읽어들이는 일이다. 일단 kernel을 주어진 위치에 가져다가 로딩하고 PC를 kernel로 넘기면 kernel은 정해진 파티션에 있는 root file system을 읽어온 뒤에 /usr/bin/init을 실행해서 시스템의 초기화를 진행한다.

이후에 프로세스는 init이 읽어오는 설정파일들 뭐 이를테면 init.d에 있는 파일들이라든가 systemd를 쓰는 버전의 리눅스라면 /usr/systemd/system 안에 있는 파일들에 명시된 프로세스를 실행하며 초기화를 하게 된다.

여기까지가 내가 알 수 있는 부분이다. 나머지 부분은 아무리 들여다봐도 그 실체를 잘 알 수 없다.
