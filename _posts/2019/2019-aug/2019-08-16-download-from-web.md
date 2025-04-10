---
layout: post
title: "웹에서 대용량 파일 다운로드 받기"
tags: [wget]
author: "Keith"
---

라스베리파이가 나오기 전엔 사실 서버스러운 일을 시키려면 멀쩡한 데스크탑을 온종일 켜두어야 하는 번거로움 때문에 사실 포기했던 일이 많았던 것 같다. 단순히 서버 프로세스들은 하는 일도 많지 않지만 항상 armed and ready하고 있어야 하니까 컴퓨터가 늘상 켜져있어야 하는 문제가 있는데, 라스베리파이는 고작해봐야 스마트폰에 들어가는 것보다도 작은 에너지로도 구동이 가능하니까 이런 일을 시킬 수가 있다.

대용량 파일을 다운 받을 경우, 특히나 인터넷 속도가 느린 한국 외 지역에서는 이런 물건들이 좀 필요하다. 라스베리파이는 그런 일을 하기에 딱 좋다. 한국 같으면 가정용 인터넷 속도도 라스베리파이가 수용할 수 있는 범위를 훨씬 뛰어넘기 때문에 사실 라스베리파이로 일을 시키는 게 더 답답할 수 있지만 이게 단순히 미국만 가도 얘기가 달라진다. 

큰 회사의 인터넷도 속도가 한국의 가정용 인터넷만 못하다. 속도측정기 돌려보면 예전에 서울 살던 시절 나오던 수치의 2/3쯤 나오던 기억이 난다. 이걸 생각해보면 가정용은 오죽할까 하는 생각이 든다. 지리적인 장점 때문에 미국 내의 연결은 나을 수도 있다고 생각되지만 요샌 세상이 좋아져서 CDN이라는 게 있기 때문에 조회하는 일이 많고 용량이 큰 것들, 특히나 돈 버는 것과 관련된 컨텐츠들은 CDN에 들어가 있기 때문에 지리적인 차이가 거의 없다. 무슨 말이냐면 수요가 많은 지역엔 로컬 복사본이 따로 있어서 그곳에서 직접 데이터 교환이 일어나기 때문에 원본이 어디 있든 어디서든 빠르게 꺼내 쓸 수 있다는 것이다.

잠시 말이 샜는데, 웹에서 다운 받아오는 경우에는 커맨드라인에서 웹 브라우저를 대신해주는 애들이 있다. curl과 wget이 그것이다. 그 둘 중에서 사실 wget이 더 쓸만하다고 생각한다. 뭐 이를테면 여러 단계를 걸쳐지나가야 다운이 되는 경우라든가 인증서가 왔다갔다하는 https를 통해서 받아야 한다거나 하면 wget이 그런 일을 군소리 없이 잘해주기 때문이다.

라스베리파이에서 대용량 파일을 여러 개에 걸쳐서 받아야 한다고 치면, wget으로 배치를 돌려버리면 된다. 

나 같은 경우에는 node로 작은 웹서버 스크립트를 돌려서 외부에서 웹 인터페이스로 링크를 던지면 node가 wget를 돌리기도 하고, 아예 링크의 목록 (list)를 던지면 배치잡을 돌리게도 했다.

정말 세상 좋지 않은가? 인터넷 속도가 엄청나게 빨라서 사실 앉은 자리에서 대용량 파일을 척척 받을 수 있는 한국은 얘기가 좀 다를 것 같기도 하다. 쉽게 말해 '그런 거 뭐하러 하나?' 말이다.