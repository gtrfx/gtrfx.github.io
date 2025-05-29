---
title: "torch-mlir output type...."
tags: [mlir]
layout: post
author: "Keith"
published: false
---

torch로 만들어 둔 모델이 있다고 하면 다음과 같은 방법으로 MLIR을 만들어 낼 수 있다.

```
import torch
import torch.export
from torch_mlir import fx

...
...

exported_program = torch.export.export(model, (dummy_input,))
mlir_model = fx.export_and_import(
    exported_program,
    dummy_input,
    output_type=fx.OutputType.LINALG_ON_TENSORS,
)
```

# `torch_mlir.fx.export_and_import` Output Types

```python
from torch_mlir.fx import OutputType
```

| Output Type | 설명 | 특징 및 용도 |
|-------------|------|---------------|
| `OutputType.TORCH` | Torch dialect | PyTorch의 연산 표현을 유지하며 MLIR로 변환됨. 분석과 변환에 용이함. |
| `OutputType.LINALG_ON_TENSORS` | Linalg on Tensors dialect | MLIR의 중간 표현으로 최적화와 하드웨어 mapping에 유리. <br>Back-end target 최적화의 출발점으로 자주 사용됨. |
| `OutputType.STABLEHLO` | StableHLO dialect | Google의 JAX/XLA와 호환되는 dialect. <br>TPU 등 특정 환경에 최적화된 backend용. |
| `OutputType.TOSA` | TOSA (Tensor Operator Set Architecture) dialect | ARM 중심 생태계에서 사용하는 dialect. <br>Quantization 친화적이고 임베디드 시스템용. |
| `OutputType.MHLO` | MHLO (MLIR-HLO) dialect | XLA 기반 HLO 표현. <br>StableHLO와 유사하지만 더 유연함. |
| `OutputType.NATIVE_LINALG` | Native Linalg dialect (on buffers) | 메모리 버퍼 기반 Linalg 표현. <br>메모리 관리와 관련된 IR을 포함. hardware-oriented. |

---

## 추천 사용 예

- **MLIR 연구 및 커스텀 compiler 개발** → `LINALG_ON_TENSORS`
- **XLA 호환성 추구 (TPU)** → `STABLEHLO` 또는 `MHLO`
- **ARM 임베디드 타겟팅** → `TOSA`
- **PyTorch 연산 보존/디버깅 목적** → `TORCH`
- **실제 lowering 및 메모리 계획 필요 시** → `NATIVE_LINALG`