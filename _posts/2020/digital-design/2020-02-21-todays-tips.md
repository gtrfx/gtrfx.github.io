---
title: "오늘의 팁"
tags: [lmstat]
layout: post
published: false
---

네트웍상에 어떤 라이센스가 떠있는지 확인하는 방법

```
lmstat -a
```

물론 environment variable인 LM_LICENSE_FILE에 license server들이 잘 들어가 있어야 한다. 서버 이름만 알고 있다고 하더라도 여기에 추가시켜주면 알아서 찾아온다.

실습용으로 쓸만한 S/W 자원이 아주 넉넉하구나 확인 했다.

추가로...

icarus verilog와 vcs를 테스트해봤는데 vcs는 g++을 돌려서 simulation file을 생성해낸다. 물론 그 executable을 돌리면 VCS simulator가 떠오른다. 라이센스가 중헌 것이니. 

icarus verilog는 자체적으로 simulation executable이 있고 중간 결과물은 사람이 읽을 수 있을 정도 수준의 결과물을 내는데, 이게 vvp라는 simulator 엔진을 불러서 최종 결과를 만든다. 

덩치가 큰 것도 생각보다 빨리 compile이 되고 simulation 결과도 나쁘지 않으니 icarus가 참 괜찮은 툴이구나 싶었다. 

