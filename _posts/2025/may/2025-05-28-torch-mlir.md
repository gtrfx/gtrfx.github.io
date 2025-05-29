---
title: "Torch MLIR..."
tags: [mlir]
layout: post
author: "Keith"
published: false
---

꽤나 오래 걸렸다. 이거 하나 설치하느라. 완벽하게 설치는 안됐고 그냥 기본 기능이 돌아가는 것만 확실하게 확인하고 llvm lowering까지 성공했다.

오늘까지 총 5일을 소모하고 이제 본 궤도에 올라가는 거다. 

```
```

일단 아래와 같은 파이프라이닝을 해서 llvm으로 lowering을 한다.

```
mlir-opt \
   --pass-pipeline="builtin.module( \
   one-shot-bufferize{bufferize-function-boundaries},  \
   buffer-deallocation-pipeline, \
   func.func( \
            convert-linalg-to-loops, \
            convert-scf-to-cf, \
            convert-arith-to-llvm \
        ), \
   convert-func-to-llvm, \
   finalize-memref-to-llvm, \
   convert-index-to-llvm, \
   convert-cf-to-llvm, \
   reconcile-unrealized-casts, \
   canonicalize, \
        cse \
        )" \
   my_torch_model.mlir 
```

```
mlir-translate --mlir-to-llvmir
```

내가 응용하려고 하는 방향으로 진행하기에 지금 발견된 문제들은 
- loop unroll
- parallelization(ILP): 이것은 backend에서 수행해야 한다.

