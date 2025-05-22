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
이건 공개된 자료만 가지고 세부 내용에 대한 정보를 얻긴 힘든데, 전반적인 내용을 보면 추론 엔진을 하겠다면 나라도 이렇게 만들고 싶다라고 할만한 요소를 다 가지고 있는 정말 괜찮은 구성을 하고 있다. 이거 알아보면 알아볼 수록 뭔가 좀 애매한 구석이 있는데, 프로세서 개당 처리능력/메모리가 작아서 많은 개수의 프로세서를 가지고 처리해야 원하는 일을 수행할 수 있다. 신기하게 요즘 트랜드인 HBM을 쓰지 않고 비싼 SRAM을 쓰고 있다. 

누군가가 작성한 내용을 옮겨왔다.

 1. LPU의 핵심은 ‘결정론적(deterministic)’ 구조
	•	전통적인 CPU/GPU는 캐시, 분기 예측, 동적 스케줄링 등으로 인해 비결정적임
	•	LPU는 모든 비결정성을 제거하고, 컴파일러가 정적으로 모든 instruction과 data 흐름을 스케줄함

 2. TSP (Tensor Streaming Processor) 구조
	•	LPU의 기본 단위는 TSP
	•	전통적인 manycore 구조와 달리, TSP는 기능 유닛들을 종류별로 수직으로 나열한 구조 (MXM, SXM, VXM, MEM 등)
	•	스트림 기반 SIMD 연산, vector는 방향(East/West)과 stream ID를 갖고 slice 간 이동
	•	하드웨어 복잡성 최소화 → 컴파일러가 모든 병렬화와 흐름 제어 담당

 3. 컴파일러 기반 스케줄링
	•	TSP는 하드웨어적으로 instruction latency가 고정되어 있어, 컴파일러가 cycle 단위로 정확한 실행 시점 및 위치를 예측 가능
	•	compiler는 시간+공간 2차원 스케줄링을 수행
	•	stream ID, direction, instruction queue 등이 전부 컴파일 타임에 정해짐 → ‘소프트웨어 정의 하드웨어’

 4. 대규모 병렬 시스템으로 확장
	•	8개의 TSP가 하나의 노드를 구성 → 9개 노드가 하나의 랙 → 최대 145개의 랙으로 확장 가능 (10,440 TSP)
	•	각 노드는 고성능 라우터처럼 연결됨 (32포트 고차원 링크)
	•	데이터 이동, 클럭 동기화, 초기 프로그램 실행까지 모두 정적으로 맞춰짐 (HAC/SAC, DESKEW 등)

 5. 소프트웨어 정의 네트워크
	•	일반적인 네트워크처럼 back-pressure나 dynamic routing이 없음
	•	컴파일러가 data path까지 정확히 계획해, 병목 없이 데이터가 흘러가도록 설정
	•	load balancing, timing, memory access도 정적으로 해결

 6. 에러 보정 및 신뢰성
	•	retry 대신 Forward Error Correction (FEC) 사용 → 비결정성을 피함
	•	랙 당 spare 노드 보유, runtime 수준에서 failover 처리 가능

뭐랄까 이게 장점이라고 내세운 것 같은데 내가 보기엔,

1. 분기를 하면 복잡해지니까 분기하는 걸 생략했고
2. Cache를 쓰자니 마찬가지로 컨트롤이 복잡하니까 생략했고
3. instruction 한 개가 혹은 VLIW instruction에 각 slot에 들어가는 명령들의 clock cycle이 정해진 대로 돌게 되어있으니까 어떤 instruction을 썼냐에 따라 deterministic할 수 밖에 없다. 아니 deterministic하지 않은 게 이상한 거다. determistic하게 하려고 한 게 아니라 구조가 간단하게 되어있으니까 deterministic하게 된 거다.
4. SIMD다. 그러니까 하나의 instruction이 operand로 지정된 SRAM의 특정 영역의 값을 가지고 multiplier + adder의 array를 통해 연산을 하게 구성 되어있는 거다. 스케줄러 단에서 SRAM access는 충돌이 없게 처리했을테고.
5. 한 다이 위에 수많은 코어가 붙는 구조를 택하지 않은 대신 수 많은 프로세서를 보드에 박아넣는 구조를 택했다. 그래서 컴파일/스케줄링은 수 많은 프로세서들을 위해서 이루어지는 거다. 
6. 병렬 시스템을 구성할 수 있다고 하는데, 그렇게 되면 병렬로 일어날 작업을 TSP (칩) 단위로 쪼개서 스케줄링하고 데이터 이동까지 결정해서 돌려야 되는 거다. 그렇게 되면 개개의 TSP를 위한 프로그램을 별도로 다 만들어서 돌리게 되는 거다. 그러니까 one-the-fly로 scheduling하는 다른 GPU/NPU들과는 전혀 다르게 작업을 컴파일해서 모든 TSP들의 역할을 고정시켜놓으면 그 일만 해야 되는 거다.
7. software defined network라는 말은 어차피 수많은 칩들 각각에서 돌려야 할 업무를 컴파일러가 이미 지시를 내렸기 때문에 칩과 칩사이를 오가는 데이터도 전부 소프트웨어가 정의한 대로 움직인다는 소리다. 이런 얘긴 왜 썼나 몰라.
8. 에러보정을 하기 위해 FEC를 썼다는 말은 잘 이해가 안된다. 더구나 spare node가 있다는 것도 잘 이해가 안되고. 고장나거나 통신에 문제가 생길 걸 대비했다는 건데, 이것도 잘 이해가 안된다. 그 수많은 칩들 중에 누가 문제가 생길 줄 알고 나머지 놀고 있는 칩에 할당을 (real-time으로) 한단 말인건지.
9. 8개 칩이 박인 영역내지는 보드? 혹은 카드 9장으로 랙 하나가 구성된다. 잘은 몰라도 이거 굉장한 부담아닌가 싶다. 
10. TSP의 구조를 보면 multiple data가 ALU array로 된 pipeline array (2D)를 빠져나가는 식으로 되어있다. 그 모든 ALU가 하나의 공통 메모리 (SRAM block)을 공유한다고 나온다. 잘은 몰라도 엄청난 열이 여기서 발생하겠지 싶다. 80TB/s의 속도로 데이터가 빠져나간다고 (처리한다고) 하는데 대략 1GHz clock이라고 보면 int8이라고 보면 80k MAC이 있는 거라고 봐야 될 것 같고. 논문에 나온 내용을 종합해보면 ...

그만 알아보자.
