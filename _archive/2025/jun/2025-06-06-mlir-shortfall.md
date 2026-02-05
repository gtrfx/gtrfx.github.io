---
title: "컴파일러기반 하드웨어 개발론..."
tags: [life]
layout: post
author: "Keith"
---

다 좋은데 MLIR로 lowering을 지원해주는 것이 torch/onnx 정도라는 거다. 

그 외의 커스텀 프로세서 설계에 적용하려면 내가 dialect를 만들어 넣어야 되고 lowering/optimization path도 내가 만들어야 된다.

그리고 DSL에서 MLIR를 하는 과정도 내가 만들어야 된다. (DSL 프론트엔드?)

그래도 뭔가 컴파일러 작업이니까 text parsing을 해서 MLIR lowering을 하긴 좀 그렇다.

lex - syntax - sema (AST) 작업은 해줘야 한다.

JIT도 만들어줘야 한다. IR level에서 verification을 해줘야 할 것 아닌가?

그런데 아쉽지만 이건 좀 포기해야 할 것 같다. IR 단계가 잘 실행되었는지는 눈으로만 확인하고 직접 숫자로는 확인하지 못한다.

IR을 가져다가 ISA와 mapping하고 scheduling하고 optimize한 뒤에야 검증이 가능하다.

뭔가 아직은 좀 시기 상조라는 뜻인 것인지.

아주 기본적인 내용들만 mlir-opt에 의해서 도움 받으려고 하지만 이 역시나 쉽지 않다.
많은 것도 아니고 matmul 같은 데서 일어나는 forloop라든가 complex number처리와 관련된 conj, hermitian transpose 따위를
MLIR로 내려주기만 해도 된다. inv를 하는 과정을 구체화 해달라거나 하는 것도 아니다.

오직 되는 것은 AI와 관련된 일부 행렬 연산 (실수의 matmul, gelu/relu 같은 것들?)이 전부다. 
이해가 안되는 게 torch-mlir 프로젝트 자체는 꽤나 큰 편이다. 

고작 python에서 실행되는 torch의 complex matrix 연산 정도 구현이 안되어있다는 게 이해가 되질 않는다.

이 말은 결국 C/C++레벨에 있는 것을 별도의 dialect로 올려놓고 그것을 MLIR opt로 처리되길 희망하거나
사실 그 경우는 해당 dialect와 관련된 처리에 대해서도 mlir에 추가해서 도움을 받아야 하니 역시 쉬운 일이 아니다.

다시 말해서 커스텀 HW를 설계하는 경우 MLIR의 도움을 받기는 쉽지 않다. 

다루는 대상이 어떤 것이냐에 따라, AI처럼 실수 행렬을 다루면 어느 정도 도움을 받을 수 있고, 그게 아니라면 MLIR/LLVM 둘 다로 부터도 도움을 받을 수가 없다.

일단 다루는 수를 간단하게 만들고 (이를테면 fp16, int16), 이것을 C/C++로 만들어서 LLVM결과를 구해서 뭔가 backend를 생각해 보는 것은 가능하다.
그렇다고 해도 HLS에서 하던 것처럼 bit 단위 수준의 최적화 따위를 기대하긴 어렵다. 