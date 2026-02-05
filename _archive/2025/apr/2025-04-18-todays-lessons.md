---
title: "오늘의 학습 내용(4/18/2025)..."
tags: [study]
layout: post
author: "Keith"
published: false
---

**verilog 실습**:    
- SRAM module:     
inout port 동작 실험을 통해 확인, synthesis 결과는 tri-state port 때문에 매우 지저분함. 내부 모듈로 사용할 때는 쓸데없는 게이트를 낭비하면서 bidirection일 이유가 없음.

**computer architecture**:       
- RISC-V architecture 학습:     
RISC-V는 성능이 특별히 뛰어나다든가 앞서간 아키텍쳐를 갖고 있다기 보단 open source로 누구든 가져다 쓸 수 있는 장점 때문에 널리 알려졌다고 봐야지 싶다.
향후 컴퓨터 아키텍쳐를 가르칠 때 사용하기 좋은 모델이라고나 할까. 또 verilog/Chisel implementation을 쉽게 구할 수 있어서 자신의 FPGA에 구현해 넣기 편하다. 문제는 이젠 소규모 기업에서 칩을 찍어낸다는 것 자체가 비용상의 문제로 사실상 불가능해졌고 FPGA를 쓰더라도 그안에 modern architecture의 CPU를 합성해넣는다는 것이 (적어도 내가 보기엔) 별로 실용적이지 못하다는 것이다. FPGA가 비약적으로 발전해서 32bit RISC를 한 구석에 넣는 게 아무런 부담이 없는 일이라면 모를까. 그런 의미에서 차라리 ZYNQ처럼 성능이 괜찮은 ARM core가 내장된 SoC type의 FPGA가 훨씬 더 매력적으로 보여진다.

**오늘 본 책들**:
- FPGA EDA란 책 읽어봄:     
내용은 굉장히 많은데 뭐가 도움이 되는 부분인지 찾기가 힘들었다.
- LLVM17:    
일반적인 컴파일러 방법론을 학습하기 위해서 읽어 봄. 일단 중간 챕터까지 읽어봄. LLVM으로 자기 언어를 만들었을 때 컴파일러(front/middle/backend)를 어떻게 해야할지 등등에 대해 알려줌.
컴파일러의 일반 체계는 다음과 같음. 
   - lexer --> parser --> sema --> IR generation --> IR optimize --> code generation     
다루는 내용이 굉장히 많지만 나한테 유용한 것은 못 찾겠음.
- 

**잡용어/앱들**:     
- DSL: domain specific language
- Reveal.js: HTML로 발표자료 만들기 (별로)
- Marp: 이거 조금 괜찮음.
- LLVM JIT(lli): LLVM IR을 주면 JIT가 돈다.

**잡소리 적어보기**:   
> 경험적으로 보면 프로그램을 모두 내손으로 작성한다기 보단 일련의 함수들과 type/template을 정의해서 일반적인 컴퓨터 언어의 형태로 구현하고, 각각의 함수들에서 실질적으로 일어나는 일들을 IR의 형태로 기록하고, 그 결과를 가지고 optimize/code generation을 하는 것이 내가 보기엔 빠른 approach로 보여진다.    
다시 말해서 언어를 정의해서 parsing하고 syntax/semantic을 파악해서 맞는지 틀린지 찾아내고 하는 것은 내가 봤을 때, 매우 귀찮은 작업으로 보여진다.   
이를테면 내가 정의한 함수가 있고, 그것이 정해진 일을 하는데, 이를테면 단순히 + operator를 썼지만 vector나 matrix/tensor의 합을 계산하도록 되어있다면, 예상되는 결과를 출력시켜서 reference로 삼게 하고, 이때 이루어지는 low level 연산작업들을 주어진 규칙에 따라 모두 기록하게 되면, 사실상 이것은 내가 정의한 언어로 프로그램을 작성한 것이나 다를 바가 없다. 이것을 IR로 놓으면 나머지는 target H/W에 최적화하는 작업만 남게 된다.

이와 관련하여 검색해보면 다음의 프로젝트들이 걸린다. 그러니까 이것들은 초반기의 lexer/syntactic/sementic analysis 단계가 빠진, DSL(domain specific language)의 형태로 구현된 프로그램에서 생성한 IR을 가지고 backend (optimize/code generation)을 하게 된다.
- TVM: ML
- MLIR: ML
- TACO

이들 IR이 특별히 CUDA라든가 그 외의 GPU에 쓰이게 될 최종 코드가 뛰어난 성능을 발휘하게 한다는 것 보단 일종의 학술적/실험적인 연구라고 봐야지 싶다. 
LLVM을 쓰더라도 아직 사람이 최적화해놓은 라이브러리에 당하진 못한다. MLIR의 경우는 여러 번의 lowering을 통해서 Triton(NVIDIA)이라든가 업체별 backend processor를 통해서 최종적인 코드를 얻기는 했었다고 한다.

**MLIR**:    
논문 읽기. 