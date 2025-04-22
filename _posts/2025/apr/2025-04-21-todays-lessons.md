---
title: "오늘의 학습 내용(4/21/2025)..."
tags: [study]
layout: post
author: "Keith"
---

**HBM**:    
- DRAM을 stacking, TSV(through-silicon via)를 통해서 적층 기판처럼 CPU/SoC와 연결됨
- HBM3: 1024 data pins, 6.4 Gbps/pin
- Bus bandwidth: 1024 x 6.4G /8 = 819.2 GBps

**HBM controller**:     
- HBM의 읽기/쓰기 효율을 높여주는 기능을 담당
- FIFO, FSM, SRAM, ...

**AXI**:
- 기본 구조: AW, W, B / AR, R 채널
- burst type (INCR, FIXED, WRAP)
- outstanding transactions, ID 처리
- read/write ordering과 hazard 관리
- AXI 인터페이스에서 HBM controller로 연결되는 흐름

**여러가지 잡생각**