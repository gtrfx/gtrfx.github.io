---
title: "전기 회로 이해하기..."
tags: [life]
layout: post
author: "Keith"
---

어렸을 적 바램하나가 회로 기판을 보면 그것이 어떤 일을 하고 있는지 바로 알 수 있는 능력을 얻고 싶었던 것이다. 

그 바램을 이루기 위해서 전기/전자 전공을 했지만 입학하자마자 이내 크게 실망하고 그래서 학부과정을 어느 정도 다니고 나서 깨닫은 것은 '전기전자 전공을 했다고 해서 기판을 딱 보면 회로를 이해할 수 있는 능력을 갖게 되는 게 아니구나..' 였다.
학교에서 하는 과정과 상관없는 나만의 프로젝트를 오지게 해야 그 다음에 나름 어느 정도의 기술을 터득하게 된다. 어쨌든 학교에서 이런 건 안 가르쳐준다. 그러니까 제도권 교육에서 제공하는 수준의 지식은 실제의 세상과 많이 뒤쳐져있어서 개인적인 열정을 가지고 엄청난 정보습득/패턴(암기)학습을 거쳐야 어느 정도 세상의 흐름을 따라갈 수 있다는 사실은 알게 되었다. 

사람이 하는 거의 모든 것들이 다 이러한데 어린 시절 나는 뭔가 이상주의에 빠져있었던 나머지 학교 공부를 너무 엉터리로 해서 그걸 한 눈에 알아볼 수 없구나 했었던 것 같다. 내가 학교 다닐 당시에도 이미 원리나 이론 학습, 또 디지털로 대부분의 분야가 넘어와서 아주 쉬운 회로도 읽지 못하는 교수도 많았고 아마 지금은 더 많을 거라고 생각한다. 모든 교수가 다 회로를 읽어야 할 필요가 없다. 뭐 자신의 전공분야의 최신 트렌드도 (오랫동안 논문 따위 읽지를 않으니) 따라가지 못하는 이들도 수두룩한데 회로도를 읽고 못 읽음은 중요한 일이 아니다. 지금은 그 교수들이 세상이 바뀌어 죄다 AI/ML을 한다며 공공연히 이야기하고 다니고 있다. 그래야 뭐라도 연구비 지원 같은 거 받을 수 있으니까, 문제는 이쪽 바닥 교수면 거의 8-90%는 다 AI한다고 하고 있다. 그렇게나 이 바닥에선 자신의 전공분야가 쓰레기통에 쳐박히는 게 10년도 채 걸리지 않고 밥벌이를 위해서는 계속해서 유행하는 분야를 파야된다는 말도 된다.

본론으로 돌아와서, 전공 수업을 열심히 들어도 기판을 보고 회로를 읽을 수 없는 이유는 다음과 같다.

- 기판을 보고 곧바로 회로도를 유추할 수는 없다. 기판을 지나다니는 모든 wire가 다 눈으로 보이는 게 아니기 때문이다.
- 단층의 양면 기판 정도에 RLC 그리고 transistor, regulator, 또 지금은 별로 쓰지 않는 (MOS)TTL 따위가 놓여있는 회로라면 모를까 이런 저런 칩이 박혀있는 것들은 datasheet을 다 가져와서 읽기 전엔 알기 어렵다.
- 어떤 것은 회로도와 데이터시트가 있어도 그 안에서 firmware가 구동되는 것은 정확히 어떤 일을 하는지 알기 어렵다.

오직 전공수업을 하고 나서 이해할 수 있는 회로는 잘 해야 증폭기 정도고 opamp의 회로도? 그 정도 이해하면 나름 성실하게 공부를 마친 사람이라고 할 수 있을 것 같다. 생각해보면 RLC를 사다리처럼 연결해 놓고 impedance 계산하는 문제 같은 거나 풀고 했던 것 같은데, 글쎄 내가 교과과정 외에 들여다 본 회로 중에 그런 회로는 거의 없었다. 있다고 한 들, 'filter'구나 하고 말았겠지만. 

그러니까 학부과정을 다니면 증폭기 회로 이해할 수 있는 걸로 끝난다. RLC로 된 filter를 보고 frequency response 정도 근사화해서 그려볼 수 있고. 설계하라면 할 수도 있겠지만, 그러느니 차라리 디지털 필터를 설계하는 게 빠르고 쉬운 지경이 된다. 

그래서 내가 요즘 어쩌다 이런 저런 기기의 뚜껑을 따게 되면 느끼는 것은 이젠 전공자가 아니라도 뭔가를 이해하고 수리하는 게 훨씬 쉬워졌구나 하는 거다. 대개의 기판은 CPU 혹은 Main SoC 칩과 그 주변에 전원 관리 칩, 주변 R/C 부품들이 전부다. 그외엔 메모리라든가 모뎀이 밖으로 나와있는 경우도 있고. 

그래서 수리를 하라고 하면 (열풍기로 땜을 해서 매우 작은 부품들을 붙이고 떼야 하니 새로 사는 게 훨 남는 경우가 대부분이지만) 대충 데이터 시트를 찾아보고 전원단자에 예상한 전원이 들어오는지 확인하는 정도? 그래서 그게 안되면 전원회로 좀 들여다보고 어떤 것을 교체해야할지 결정할 수 있는 노우 하우만 가지고 있으면 된다. 이것은 전기/전자 전공 공부와는 큰 관련이 없다. 

내가 이래서 세상이 빨리 변하면 전공자와 비전공자, 교수와 학생의 차이가 없어지게 된다라고 보고 있다. 비단 전기 전자 분야가 아니라 모든 학문 분야에 골고루 해당한다고 본다. 예전에도 그랬지만 지금처럼 정보의 획득과 유통이 엄청나게 쉬워진 시절에는 초야에서 도를 닦고 있는 엄청난 강호의 고수들을 이길만한 1인자 라는 것은 존재하지 않는다고 본다. 