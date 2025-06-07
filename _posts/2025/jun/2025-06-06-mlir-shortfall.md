---
title: "MLIR기반 하드웨어 개발론..."
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

