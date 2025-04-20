---
title: "오늘의 학습 내용(4/19/2025)..."
tags: [study]
layout: post
author: "Keith"
---

verilog:     
- 간단한 implementation인데 RAM으로 합성이 안되고 FF로 합성되는 경우 어떤 조건을 가지고 있는 실험해봄

computer architecture:    
- RISC-V 나머지 (micro architecture) 학습      
   - 내용을 살펴보면 왜 이걸 Chisel같은 고차원 언어로 구현하려고 했는지 이해가 되긴 함.
   - 개념적인 것을 구현하려고 너무 많은 노가다를 해야 된다는 게 verilog에서의 문제임.
   - 그러나 아직 산업계는 모든 걸 다 verilog로 구현함. 꽤나 옛날 방식인데 여기에 머물고 있음.
   - LLM based AI (copilot 따위)는 노가다를 돕긴 하지만 근본적인 도움을 주진 못함: debugging/optimize
- cache/(memory mapped)-IO는 다른 책들과 별반 차이가 없음. 그냥 일반적인 이야기만 쓰여져있음.
- AXI 같은 내용을 포함했어야 될 것 같은데 나머지는 다 뻔한 내용임
   - 책의 분량을 늘리고 나름 신선하다라는 느낌을 주려고 옛날 text의 computer architecture 책에 RISC-V를 넣음
   - logic gate로 시작해서 memory mapped-io로 끝남. 

algorithm analysis:     
- 복잡도 측정 기준
	- 시간 복잡도(Time Complexity): 결과를 얻기까지 걸리는 연산 시간.
	- 공간 복잡도(Space Complexity): 연산에 필요한 메모리 사용량.
	- 둘 다 일반적으로 입력 크기 n의 함수로 표현.
- 비대칭 표기법 (Asymptotic Notation)
	- Big-O (O): 최악의 경우 성능 (상한).
	- Omega (Ω): 최선의 경우 성능 (하한).
	- Theta (Θ): 평균적 혹은 정확한 경우 성능 (정확한 경계).
- NP hard problems: 여전히 무슨 소리하는지 감이 잡히지 않음 ㅠ
   - P:
   - NP: nondeterministic polynomial time
   - NP-complete:
   - NP-hard:
- Sort/Search/...
