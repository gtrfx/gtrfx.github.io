---
title: "vmware fusion on catalina: 화면 안나올 때 (black screen)"
layout: post
tags: [vmware, black screen]
---

Catalina의 보안관련 기능이 VMWARE의 화면이 온통 까맣게 나오도록 도와준다.

system configuration의 screen recording에 관한 privacy setting에 가서 VMWARE도 screen recording을 할 수 있도록 활성화하면 된다.

그런데, 여기 가봐도 VWMARE와 관련된 사항이 아무것도 나오지 않을 때는 아래와 같이 해보자. 

먼저 recovery mode로 들어가서 terminal로 다음을 실행해서 SIP을 무력화시켜야 한다.

```
csrutil disable
```

이게 실행되면 재부팅하면 이 기능(무력화)가 활성화 된다는 메시지가 나온다. 일반 모드로 재부팅해서 아래의 내용들을 실행한다.

```
tccutil reset All com.vmware.fusion

sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'insert into access values ("kTCCServiceScreenCapture", "com.vmware.fusion", 0, 1, 1, "", "", "", "UNUSED", "", 0,1565595574)'

sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'insert into access values ("kTCCServiceListenEvent", "com.vmware.fusion", 0, 1, 1, "", "", "", "UNUSED", "", 0,1565595574)'

sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'insert into access values ("kTCCServicePostEvent", "com.vmware.fusion", 0, 1, 1, "", "", "", "UNUSED", "", 0,1565595574)'
```

다시 recovery mode로 들어가서 SIP을 활성화한다. 

```
csrutil enable
```

Recovery mode를 두번이나 드나들면 번거롭기도 번거롭지만 시간도 많이 소모된다. 참 불편하기 그지없다.