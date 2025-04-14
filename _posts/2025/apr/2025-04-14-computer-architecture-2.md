---
title: "컴퓨터 아키텍쳐(2)..."
tags: [study]
layout: post
author: "Keith"
---

멀티코어 CPU면 단순히 코어를 여러 개 복붙하면 되는 줄 알았는데, 이게 cache consistency 문제 때문에 쉽지 않다는 사실을 알았다.

캐쉬간에 데이터가 어떤 것이 최신인지 또 어떤 것이 변경되었고 다른 곳에서 변경되어서 어떤 것이 쓸모없게 되었는지 등등을 구분하는 게 중요하단 사실도 알게 되었다.

여기서 같은 x86이라도 Intel과 AMD간 차이가 있다는 것도. 

최근의 CPU는 CPU core마다 관할하는 영역이 다른 memory를 취하고 있고 그것이 NUMA(Non-uniform memory access)이고 최근의 고성능 CPU들은 대부분 NUMA를 채택하고 있다는 것도 (apple silicon은 아님).

내가 사용하는 5950x, 7950x 모두 NUMA를 채택하고 있다. 또 NUMA의 효율적인 운용을 OS가 돕고 있다는 것도.

그 외에 WSC(Warehouse scale computers)에서는 주로 다루는 이야기가 MapReduce에 대한 이야기인데, 이 바닥에서는 Spark이 대세라는 것 (Hadoop이 저장장치를 썼는데, Spark은 memory에 올려서 처리?) 정도.

실질적인 이야기는 거의 없고 대부분 개략적인 개념 이야기라든가 현재 세상 돌아가는 것에 대한 얕은 수준의 이야기가 늘어지고 있어서 이 책은 그냥 패스 하기로 함.