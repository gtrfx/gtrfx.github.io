---
title: "초고속 연산기 프로젝트..0"
tags: [highspeed, array]
---

일단 프로젝트 시작해본다. 서론이나 배경 같은 거 쓰느라 힘빼지 말고 핵심 위주로만.

#### 왜 초고속 연산기가 필요한가? DSP라든가 CPU가 있는데?

DSP나 CPU로 빠른 계산을 하는 데는 한계가 있다. 어떤 한계가 있을까?

- 정확도에 한계가 있다. Floating point 연산이라고 하더라도 mantissa의 크기가 얼마인지, 또 어떻게 normalize를 하느냐에 따라 매우 작은 값이지만 아쉽게도 놓쳐서 전체적인 정확도가 떨어질 수 있다.
- 행렬연산 같은 것을 하기엔 내부에 버퍼/캐쉬가 좀 작다. 외부의 데이터를 읽어오느라 귀중한 사이클을 빼앗긴다.
- 계산장치의 수에 한계가 있다. 행렬연산 같은 것을 무조건 SIMD로 한다고 효율을 높일 수가 없다. 계산결과가 다시 이용되어 쓰이는 경우가 많아서. 단지 동일한 행렬연산을 여러 개 동시 수행한다면 모를까.
- DSP는 조건 분기라든가 복잡한 컨트롤이 가능한 만큼 파이프라인이 깨지면서 효율이 급강하하는 일이 발생한다.

#### 그럼 어떻게 해야 초고속 초정밀 계산이 가능할까?

일반적인 방법론으로 다음을 설계해 볼 수 있을 것 같다.
- data path
  - 연산기 로직
  - source와 destination에 대한 mux
- control path
  - 외부에서 program을 읽어와서 replay할 수 있도록 함.
    - data source/destination, 연산기 로직을 control, 연산 결과에 대한 routing을 모두 하나의 instruction으로 만듬
    - 외부 메모리의 종류, 해당 메모리를 access할 때의 address도 포함

사실 별 게 없다. VHDL로 설계하면 연산기 자체와 control logic은 instruction만 잘 설계하면 간단하게 꾸려진다.

여기에 정확도를 높이기 위한 trick들을 생각해본다면,

- Floating point arithmetic unit을 별도로 설계한다. 
  - 정확도가 낮아도 되는 연산은 mantissa의 크기가 작은 것으로 여러 개를 쓸 수 있도록 한다.
  - 필요에 따라 mantissa가 큰 unit도 별도로 둔다.
  - normalization을 미리 수행해서 중요한 부분을 놓치지 않도록 배려한다. 최종 결과에만 적용한다.

또 연산기의 모든 자원을 최적으로 이용하기 위해 program은 적절히 최적화가 되어야 한다. 그러니까 control path와 내부 메모리를 잘 활용해서 매 clock 외부로부터 data를 읽어들이지 않고도 거의 모든 연산을 zero-wait으로 수행할 수 있게끔 해야 한다. 그러니까 별도의 scheduler/optimizer가 필요하다. 

결국, 초고속 계산이 가능하게 되는 이유는
- 조건 분기를 없에고 오직 정해진 address에서 부터 instruction을 매 clock 읽어와서 동작시킨다.
- 모든 instruction을 수행할 때 연산기 자윈이 놀게 되지 않게끔 연산과정을 최적으로 scheduling된다. 그 어떤 경우든 pipeline이 풀가동되게 한다.
- 병렬로 동작하는 다수의 연산기를 가지고 있다.
- zero wait로 data를 access할 수 있도록 모든 데이터를 미리 가져다놓을 수 있는 충분한 memory를 가지고 있다.

