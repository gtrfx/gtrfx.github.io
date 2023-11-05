---
layout: post
title: "MATLAB on a MAC"
author: "Keith"
---

요새 흔히 쓰는 MATLAB 2008a/2009a 까진 Mac에서 32 bit binary만이 지원이 된다. 따라서, MATLAB이 자체적으로 지원하는 연산을 사용하면 64bit 연산이 되지 않으니 계산 속도가 다소 떨어진다고 할 수 있겠다. 좀 더 신기한 것은 Java도 32bit만 지원한다. 흔히 Mac에 MATLAB을 설치하고도 실행이 되지 않는다 (특히 특정 위치에 log를 적어놓았으니 읽어보라는 메시지와 함께)는 문제는 대개 Java VM을 64 bit으로 설정해놨기 때문이다. 이럴 땐 Java Preference에 가서 32bit VM의 우선 순위를 높여주면 해결이 된다.
그 외 custom function이나 custom simulink block을 사용하게 되는 경우에는 자체적으로 compile하여 동작하게 되므로, 사실상 윈도우와의 속도차이는 실감하기 힘들다. 오히려 Mac에서는 64bit 연산이 몰려있는 어플리케이션을 쓰는 경우 Benchmark를 보더라도 windows XP보단 나은 속도를 제공한다 (여타의 주변장치 드라이버들도 마찬가지겠지만).
다만 평소 즐겨쓰는 print -dmeta (메타파일 형태로 인쇄하여 그 결과를 클립보드에 넣어주는 명령)같은 것들은 애초에 지원이 안되니, postscript나 pdf, EPS 등으로 파일로 인쇄한 다음에 사용해야하는 것은 다소 아쉽다. 그것은 OS 상에서 그렇게 사용이 되지 않기 때문이긴 한데, 문서에 PS/EPS/PDF를 붙여쓰는 것은 오히려 Mac이 더 깔끔하고 편리하니까 파일로 만들어 쓰는 것이 다소 아쉽긴하더라도, 감수해야할 것이다.
불행히도 64bit native인 최신작인 MATLAB R2010b는 사용권한이 없어서 진가를 느껴보진 못했다. 혹시 속도를 체감해보신 분 계신가?



