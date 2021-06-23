---
title: "M1 Mac에서 외장 SSD에 Monterey 설치하기"
layout: post
tags: [m1 mac, monterey]
---

Monterey beta를 주력 파일 시스템에 설치하긴 뭐하다보니 외장 SSD 혹은 HDD에 설치하려 할 것이다. (나는 주력 시스템도 외장 SSD로 쓰고 있다.)

M1 Mac을 써보면 알겠지만 내장 SSD (NVME이지 싶다)와 외장 SSD와의 체감 성능차가 별로 크지 않다. 물론 내가 빠른 SSD를 필요로하는 작업을 하지 않기 때문이기도 하지만 대부분의 사용자가 나와 같은 경우라고 보기 때문이다. 외장 SSD의 경우 NVME SSD에 별도 USB3 혹은 Thunderbolt adapter를 달고 있는 경우가 가장 빠른 SSD인 경우인데 그렇지 않더라도 SATA-USB3라고 하더라도 대략 400 MBps 정도의 읽기가 가능하기 때문에 큰 체감성능 차이를 느낄 수가 없는 것이다.

간단히 정리하면:
1. moneterey beta를 다운로드 받는다. gibMacOS를 써도 되고 softwareupdate도 있고 검색하면 방법은 다양하다.
2. 시스템을 재부트해서 recovery mode로 진입한다. (진입 방법은 HW에 따라 다르다.)
3. 설치할 SSD/HDD를 APFS로 포멧한다 (미리 해놓고 와도 되고 recovery mode에서 diskutil을 이용해서 해도 된다.)
4. Terminal app을 실행한 뒤에 monterey beta를 받아놓은 위치로 가서 InstallAssistant를 실행한다. (command line에서 실행하는 방법은 별 다른 게 없고 해당 app 폴더 안으로 들어가서 /Content/MacOS 안에 있는 실행파일을 실행하면 된다.)
5. 나머지는 시킨대로 진행하면 된다.

차이점이 어떠냐고? 글쎄 배경화면과 Safari가 약간 달라진 것 말고 큰 차이를 느낄 수가 없다. Message/Facetime에서 제법 기능 향상이 있었다는 것은 익히 알고 있지만. iTune의 경우 Apple Music 사용여부의 취소가 불가능하게 되어있다. 그냥 무조건 사용하거나 광고가 뜨는 것을 봐야 한다. 다행스러운 것은 iTune은 다시 실행할 때 사용자가 가장 마지막에 열어놓았던 회면이 나오기 때문에 Apple Music 때문에 신경쓰일 일은 거의 없다고 본다. 다만 메뉴상에서 사라지지 않을 뿐이다.

이유를 모르겠지만 suggestd가 계속 CPU 100%를 점유하고 있는 관계로 이런 저런 방법을 다 써보다가 안되서 임시방편으로 crontab에 1분 간격으로 체크해서 suggestd가 나타나면 죽이도록 해놓았다. MacOS가 좋은 점은 이런 거다.

