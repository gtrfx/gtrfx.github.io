---
title: "MIPS vs ARM?"
layout: post
tags: [mips,arm]
author: "Keith"
---

ARM이란 단어가 기술계통에 스며들게 된 것은 내가 알기로 Qualcomm이 이 RISC architecture를 적용한 CPU를 사용하게 된 다음이 아닌가 한다. 지금의 Snapdragon이 나오게 되기 전에 이미.

MIPS라는 architecture가 있다는 사실은 인터넷을 통해 얻어들은 게 전부이고 가장 간단한 architecture로 CPU를 디자인하는 과제가 있다고 하면 그 해답으로 MIPS가 언급되었던 것이 내가 알던 것의 전부였다. 오히려 이 MIPS라는 단어는 Millon Instruction Per Sec = 1초의 몇백만의 인스트럭션을 수행할 수 있는가? 하는 문제의 해답으로 나오는 것이 더 흔했던 것 같다.

어쨌든 ARM은 한동안 저전력 CPU의 대명사가 되었고 대부분의 안드로이드폰/iOS폰의 CPU였구나 했었는데 마침내는 desktop cpu로 등장하게 되었다. 이미 그전에 수많은 ARM server project가 있었고 어떤 경우는 super computer grid가 ARM server project로 만들어졌다는 기사들도 제법 나왔다.

MIPS는 사실 ARM에 비해서 많이 가려져있었는데 이 역시 유명한 CPU architecture의 하나로서 존재했고 alpha 라는 RISC processor도 있었고 지금은 RISC-V가 사실 유망주로서 존재하고 있다.

한참 나중에 알게 된 사실이지만 대부분의 network switch가 MIPS CPU로 만들어져왔고 지금도 수많은 공유기/HUB들의 main CPU가 MIPS core를 가지고 있다. 비용을 줄여야 되니 1 core CPU에 불과하지만 GbE 트래픽도 소화를 한다. 

흔히 그런 얘길 한다. 

#### RISC가 저전력에 더 유리한가?

x86이 저전력 프로세서 프로젝트에 죄다 망했던 것을 보면 답이 나온다. Desktop 세계에서도 저전력이 중요한 고려 요소가 되어감에 따라 이 흐름은 계속해서 진행 될 것으로 본다. 기본적인 instruction은 간단하게 하되 application dedicated IP를 따로 두어 SoC하는 것이 그 어떤 면으로 보더라도 실속있고 의미가 있다.

#### 둘 중에 누가 좋으냐? 

가장 흔한 답은 이거다.

MIPS는 ARM보다 register 개수가 많아서 memory access에 시간이 많이 드는 경우에 ARM보다 유리하다.

정말 그런가??? 신기하게도 MIPS가 아직 살아있다는 게 신기한 노릇이다. MIPS가 모바일에서든 서버에서든 성공했다는 말은 못 들어봤다. 그냥 네트웍 장비에 들어가는 CPU로 계속 머물게 될지는 알 수 없지만 지금은 그러하다.

