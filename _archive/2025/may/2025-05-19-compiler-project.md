---
title: "compiler 관련..."
tags: [hobby]
layout: post
author: "Keith"
---

취미로 만들고 있는 컴파일러에 관련된 내용을 까먹지 않기 위해 적어놓는다.

일반적인 compiler의 최적화 과정: (예 LLVM/clang)
1. frontend optimization: dead code pruning, constant folding (상수 미리 계산해서 확정하기), inline expansion
2. LLVM IR optimization: LLVM IR로 변환 후 진행함, SSA(Static Single Assignment) 형식을 따라감    
- optimization passes
    - analysis pass: 코드를 변경하지 않고 분석만 함 (alias analysis, loopinfo, ...)
    - transform pass: 코드를 변형해서 최적화 (loop unroll/..), GVN, InstCombine
    - utility pass: 디버깅/시각화를 위한 요소들을 추출함

static scheduling:    
- 가지고 있는 자원을 최대로 활용하면서 수행시간을 최소로 만드는 것이 주 목표
- HLS 혹은 FPGA (혹은 manycore processor)에서의 자원 최적화와 비슷:
   - critical path (처리 시간이 가장 긴 data path, slack이 가장 작은 node/graph) 순서 대로 자원을 할당
   - scheduling failed: 
      - 주어진 자원으로 원하는 deadline을 맞추지 못하는 경우
      - scheduling 도중 모든 자원을 소비

내가 만들고 있는 compiler의 처리 과정:
1. 해야될 일을 수행하는 과정에서 IR 수준으로 mapping하여 기록함: 메모리에 기록하는 과정은 순차적이나 병렬화가 되지 않을 것이므로 SSA는 하지 않음
2. 특정 memory 영역을 중복 access하면 모두 삭제함
3. 연산의 의존도를 확인해서 DAG를 만들어 놓음. 연관성이 있으면 모두 child가 되고 없으면 새롭게 parent가 됨. 서로 독립된 graph는 병렬화가 가능함 (하드웨어 제약 사항이 없다면)
4. graph 단위로 slack을 계산함. 
- slack이 작은 graph를 우선적으로 schedule함 (slack의 크기에 따라 sort함): 결과적으로 slack이 큰 것들은 나중에 빈 자원에 할당될 가능성이 높아짐  
- graph의 구성요소: 
   - cycle (node별 예상 cycle 계산, slack 계산용)
   - slot: 처리될 resource의 index --> 차후에 이루어질 schedule을 고려
   - parent/child(ren): 부모/자식 node
5. schedule: multiple pass로 구성. 
- 처음엔 pipelining을 고려하지 않고 시작하고 그 다음부터는 파이프라인을 고려해서 시도해서 최종적으로 수행 cycle이 가장 작은 schedule을 선택함   
- slack이 작은 graph 순서로 자원을 할당시켜 봄.   
   - 자원 할당에 문제가 없고 할당시 모든 자원을 최대한 효과적으로 할당하는 경우를 우선으로 schedule을 함
   - schedule 되는 과정에서 graph가 자원에 할당되면 cycle과 할당 자원 정보를 갱신함
   - 모든 graph가 schedule되면 작업을 중단함
   - 결과적으로 slack이 작고 할당이 용이한 graph 부터 schedule이 됨.
- 갱신된 graph를 통해서 slack을 다시 계산함. 그리고 다시 자원을 할당하는 과정을 반복함. 
- 모든 graph의 schedule이 완료되면 종료. 아니면 계속 자원 (computing resource, cycle (time slot))을 할당
- 추후의 최적화 과정은 생략

아래의 

System architect의 Key tools:
- Pipelining
- Locality & caching
- Parallelism
- Out-of-order execution
- Prediction (or speculation)
- Indirection
- Amortization
- Redundancy
- Specialization
- Focus on the common case