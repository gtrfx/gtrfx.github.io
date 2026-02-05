---
title: "오늘의 학습 내용(05/22)..."
tags: [life]
layout: post
author: "Keith"
---

MLIR과 LLVM-IR과 관련하여 씨름 중.

- MLIR을 직접 lowering하는 게 좋을까?
- MLIR을 LLVM-IR로 lowering하고 LLVM middle-end를 사용해서 최적화 한 뒤에 LLVM backend를 따로 만들어서 최종 결과를 얻어야 할까?

**결론:** HW로 최적화해서 별도로 구현하는 부분은 custom dialect를 등록해서 LLVM lowering이 되지 않게 하고, 나머지는 모두 LLVM의 optimization pass의 효과를 보도록 가공하면 됨.

이것은 DSL 수준에서는 할 수 없고 MLIR이 단게적으로 lowering pass를 거치는 과정 중에 pass하나를 추가해서 custom op 혹은 함수로 치환해야 함.

이렇게 하면 LLVM의 모든 이점은 살리고 나의 customized HW도 살릴 수 있게 된다.

