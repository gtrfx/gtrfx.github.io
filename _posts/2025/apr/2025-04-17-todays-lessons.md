---
title: "오늘의 학습 내용(4/17/2025)..."
tags: [study]
layout: post
author: "Keith"
---

**verilog 실습**:    
- simple UART. 상용칩으로 보고 따라 만드려다가 포기함.
- simple DMA unit. 8257을 보고 따라 만들어 봄
  - dma controller: A/D port 한 개 뿐이라 이걸 multiplexing해서 1 word씩 데이터를 복사함.
  - 필요에 따라 FIFO를 넣어서 완충할 수 있음.
  - verilog에 inout port는 define은 되어있지만 잘 쓰지 않음
- 작성하는 것은 쉽지만 대부분 test/debug하는데 많은 시간을 씀
- copilot이 코드 작성의 많은 부분을 돕긴 하지만 실제로 debug하는 데 도움을 주진 못함. 따라서, 아주 약간의 생산성 증가만 있음.

**computer architecture**:
- 책 2권 겉핥기 완료
- RISC-V 책 시작함 (Harris):     
이 책은 뭐랄까 다루는 내용은 최신인데, 책 전체가 아무런 기초가 없는 상태에서 올라가는 모양새다. 
기본적인 내용을 잘 알고 있다면 최소 5장까지는 그냥 뛰어넘어갈 수 있다.
RISC-V라고 해서 특이한 instruction을 가지고 있진 않으므로 assembly에 대해서도 어느 정도 잘 이해하면
6장도 건너 뛰면 됨. (RISC-V의 compressed instruction이 생소한 사람이 있을 수 있겠지만, 이것은 arm의 thumb instruction과 같은 개념임)
- 6502 들여다보기:      
6502의 implementation에 따라서 다르긴 한데, 게임용 에뮬레이션을 고려한 경우에는 쉽게 구현될 수 있는 걸 일부러 느리게 동작하게끔 (instruction마다 실제 clock cycle이 있음) 구현되어 되어있다.
- CPU:     
CPU가 사실 엄청난 많은 기능을 가지고 있을 것 같지만, 그것은 software와 주변기기와 결합되었을 때 엄청난 능력을 보여줄 뿐 사실상 구성은 매우 간단하다.
크게 나눠서 ALU와 PC를 조작하는 FSM으로 나눠보면 될 것 같다 (data path + control logic).
여러 개의 instruction으로 구현 가능한 것들을 죄다 빼버리면 ALU도 간단하게 만들 수 있다.

**책 모으기**:    
- verilog/FPGA 관련 서적: 5권
- computer architecture (RISC-V 포함): 4권

