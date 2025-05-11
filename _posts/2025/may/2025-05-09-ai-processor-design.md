---
title: "ai processor 설계 해보기..."
tags: [hobby]
layout: post
author: "Keith"
published: false
---

멘탈이 정상으로 되돌아오는 기념으로 작게나마 프로세서 설계 프로젝트를 시작하려고 한다. github에 repo도 하나 만들고.

목표는 대략 이렇다.
- processor design: 
   - rtl: verilog
- tool chain (scheduler/optimizer)
   - MLIR을 받아서 컴파일 함
   - IR-level c model (verifying ML-IR toolchain)
   - cycle accuate c model (for DPI-C, S/W emulation, H/W debugging)
   - compiler: creating binary for the hardware

ai에게 물어보니 MLIR을 다루는 게 더 좋다고 한다.

일단 이번 주를 상위설계를 위해서 쓰기로 했는데 제법 다양한 구조의 프로세서들이 나와있어서 survey하는 것도 일이다.

대략 오늘 살펴본 것만 간단히 보자면,
- reconfigurable processor (mesh/grid architecture): 
   - tile 구조의 처리기. tile마다 local memory가 있고 GEMM + 일반 연산처리기가 하나 붙어있음
   - 4개 tile마다 router가 한개씩 붙어있음. 이 아이가 데이터를 인접 tile로 이동시킴  
   나는 병렬 구조가 별로 맘에 들지 않는다. 대개 이렇게 병렬로 했다가 실패한 경우를 많이 봐서 그런가. CUDA처럼 실시간으로 돌아야 할 필요가 없고 한꺼번에 데이터를 밀어넣었다가 결과를 끄집어내는 형태라면 이런 타일? 그리드식의 구조가 의미가 있다고 본다만. 실험실 수준에서 계속해서 구조를 바꾸거나 하면서 학습/추론 또 증설하는 데는 훨씬 유리한 구조라고 본다만.
- Groq LPU:    
이건 공개된 자료만 가지고 세부 내용에 대한 정보를 얻긴 힘든데, 전반적인 내용을 보면 추론 엔진을 하겠다면 나라도 이렇게 만들고 싶다라고 할만한 요소를 다 가지고 있는 정말 괜찮은 구성을 하고 있다. 

