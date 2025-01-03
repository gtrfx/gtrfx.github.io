---
title: "위기에 빠진 해킨 구조하기"
tags: [hackintosh]
layout: post
image: https://cdn2.macpaw.com/images%2Fcontent%2Fhow-to-new%2FHow+to+start+up+your+Mac+in+Recovery+Mode+G+1200x670.jpg
author: "Keith"
---

어제는 외부에서 가져온 소프트웨어를 윈도우에 설치하다 트로이/malware 판이 되는 걸 보고 윈도우를 전부 새로 설치했다. 백신이 있어도 검출도 잘 못해내고 백신이 뭔가 말을 듣지 않을까 이것 저것 눌러보며 허둥지둥하는 동안 이들 악성 소프트웨어는 내 컴퓨터에서 필요한 정보를 다 빼내간다. 이런 어처구니 없는 상황을 피하기 위해서는 항상 정품 소프트웨어를 사용하고 절대로 외부에서 가져온 소프트웨어를 설치해서는 안된다. 물론 윈도우도 언제든 날릴 수 있도록 중요한 일을 별여놓으면 안된다. 간단히 문서작업이나 하고 게임(!)만 하라고 있는 게 윈도우즈다.

사실 해킨으로 오면서 그런 문제는 싹 다 해결되고 컴퓨터도 언제나 전원이 잘 관리되는 쾌적한 환경에서 사용하다 보니 해킨을 더더욱 사용하지 않을 수가 없다. 얼마전에 새로 맞춘 Ryzen 해킨도 아주 잘 돌아가고 있다. 물론 해킨인 이상 예상치 못한 경우 때문에 곤욕을 치룬 경험이 몇 번 있지만.

그럴 때마다 절대로 당황하지 말고 다음의 조치를 취하면 쉽게 해결이 된다.

1) EFI 드라이버에 문제가 생긴 경우: EFI shell 사용
   EFI shell은 아쉽긴 해도 아주 간단한 filesystem 명령을 수행한다. ㅣs/rm/mv/cp 같은 명령어가 듣기 때문에 문제의 EFI 드라이버를 삭제하면 된다.
2) kext가 잘못 설치된 경우: Recovery mode를 이용
   EFI shell로 들어가서 작업할 수 있는데 경우에 따라 file을 지우거나 변경할 수 없는 경우가 발생한다. 이럴 땐 Recovery partition으로 boot해서 terminal을 이용해서 작업하면 된다. /Volume에 가보면 내가 평소 사용하는 file system이 나타날 것이다. 문제의 Kext는 대개 /System/Library/Extensions 또는 /Library/Extensions에 놓여있을텐데, 문제의 파일을 삭제하고 나면 자동으로 kextcache refresh는 자동으로 진행된다.
3) 위 방법 모두 다 제대로 동작하지 않는 경우: linux live 기능을 활용
   요새 리눅스 배포판은 live mode (설치 하지 않고 그냥 linux로 부팅해서 즉시 사용하는 경우)가 지원된다. 문제는 요새 APFS가 linux에서 인식되려면 부가적으로 뭔가를 설치해줘야 한다든가 쓰기(write)가 안되는 경우가 있다는 것이다. 

