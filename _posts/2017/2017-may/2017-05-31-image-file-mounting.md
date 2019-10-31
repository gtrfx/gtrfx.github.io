---
layout: post
title: "Image File Mounting"
---

Linux에서는 img file을 mount를 이용해서 mounting할 수 있다. 아주 쉽게 다음과 같이 한다.

```
mount -t auto img_file.img destination_folder
```

그런데 img file이 여러 개의 partition을 가지고 있을 수 있는데, 이 때는 fdisk로 내용을 확인한 뒤에 sector 위치를 찾아서 mount하면 된다. 무슨 말이냐면 mount로 mounting할 수 있는 파티션은 딱 하나 뿐이다. 그런데, img 파일 안에 있는 parition이 여럿이면 mount를 이용해서 여러 개를 mount할 수는 없다. 따라서, mount하길 원하는 partition의 위치 (fdisk로 찾은 sector수로 추적)를 offset으로 입력하면 원하는 파티션만 mount가 가능하다.

```
# fdisk -lu arch-live-usb_201105070115.img
You must set cylinders.
You can do this from the extra functions menu.

Disk arch-live-usb_201105070115.img: 0 MB, 0 bytes
248 heads, 19 sectors/track, 0 cylinders, total 0 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0xff978785

Device Boot Start End Blocks Id System
arch-live-usb_201105070115.img1 2048 593919 295936 83 Linux
Partition 1 has different physical/logical beginnings (non-Linux?):
phys=(0, 32, 33) logical=(0, 107, 16)
Partition 1 has different physical/logical endings:
phys=(36, 247, 19) logical=(126, 10, 18)

# mount -t auto -o loop,offset=$((2048*512)) arch-live-usb_201105070115.img /mnt/
```
