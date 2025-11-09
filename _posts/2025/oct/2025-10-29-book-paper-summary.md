---
title: "최근 들어 읽은 책들..."
tags: [life]
layout: post
published: false
author: "Keith"
---

좀 늦은 감이 있지만 요즘은 high speed connectivity와 관련된 책/문헌들을 보고 있다.

- CXL Spec 3.2
- desiging-for-448g-modulation-dsp
- PCIe base spec rev 6.0
- High Speed Serdes Devices and applications
- Silicon Photonics Design

뭐 알만한 사람들은 다 읽고 지나갔을 내용들이지만 대충 요약하면 이렇다.

### CXL: Compute Express Link

신기하게 AI 관련 주식하는 사람들이 관심갖는 주제인 것 같다만. 어쨌든 이것은 high speed PHY위에 올라가는 일종의 stack 같은 거다. 
빠른 데이터 전송로 위에 올라타서 거기에 연결되어있는 device들을 마치 한몸처럼 사용할 수 있게 해준달까? 그것을 달성하기 위해서 protocol을
만들어 놓은 것 같은데, 가장 짧은 전송단위: 68 byte가 마치 ATM cell (53 byte)을 떠올리게 했달까?

### Designing 448g 

lane당 400 Gbps ethernet을 만들기 위한 448 G SerDes에 대한 이야기이다. Communication systems/Signal processing 관점으로 보면 간단한 장치로 보이지만
다루는 신호가 워낙 고속이고 이것을 최대한 단순한 logic으로 만들어 넣어야 좋은 전력 효율/속도/latency가 나오기 때문에 역시나 첨단 기술이고 
표에 정리된 spec으로 보면 PAM4를 넘어서 PAM6까지 이야기 되고 있다. 확률적으로 PAM4에서 PAM6로 넘어가면 transistion이 PAM4에 비해서 줄게 되기 때문인지
되려 high frequency spectrum 손실에 대해 상대적으로 강인한 특성을 보여준다. 어쨌든 PAM4/SerDes 구현과 관련이 있다고 보면 된다.

### High speed SerDes Devices and applications

아마도 고속 SerDes 장치에 대한 교과서적인 책이 아닐까 한다. 여기에 관련된 거의 모든 이야기가 나온다. 
저자와 감수한 이의 경력을 검색해보면 이 바닥 인맥과 history에 대해 알게 되는 또 다른 재미도 있다. 

### Silicon Photonics Design

Silicon photonics에 대한 기초적인 내용 배울 수 있다. 
사실 반도체 물성을 전공하는 사람이 아니면 재미없는 내용도 있지만 
나처럼 이쪽 사람이 아닌 입장에서, 단지 시스템 적인 관점으로 바라보면 나름 '이런 게 고속 데이터 기술의 주류를 이루겠구나'하는 감 정도 잡을 수 있을 것 같다.



