---
title: "AARCH64 kernel build"
tags: [am64,armv8,aarch64,kernel,linux]
---
# AARCH64 kernel build

kernel.org에서 kernel source를 받았다고 해서 그것을 arm64로 바로 빌드할 수 있진 않다. 몇 가지 작업을 해주어야 되는데 일단 다음을 참조하자.

다음은 p212 보드를 만들 때 사용하는 옵션이긴 하나 시작 주소를 적어놓은 것만 빼곤 별반 다른 arm64와 다르지 않다.

```
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image dtbs
mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux-next -d arch/arm64/boot/Image ../uImage
```
다음은 builde된 kernel을 mmc로 boot시킬 때 필요한 작업이다.

```
fatload mmc 0:1 0x01080000 uImage
fatload mmc 0:1 $dtb_mem_addr meson_board_name_xxx.dtb
bootm 0x1080000 - $dtb_mem_addr
```
dtb는 사용하려는 하드웨어에 맞게 적어넣어주면 된다.

x86 머신을 주로 호스트로 사용하고 속도가 빠르므로 cross compile tool을 가져다 설치한다. linaro에서 나온 것도 있고 우분투를 쓴다면 우분투에 맞게 배포되고 있는 것을 가져다 쓰면 된다.



