---
title: "torch-mlir 설치하기..."
tags: [mlir]
layout: post
author: "Keith"
---

## **MLIR과 PyTorch 연동: PyTorch MLIR 설치 가이드 및 고려 사항**

MLIR을 활용하는 데 있어 **PyTorch는 현재 가장 적합한 DSL(Domain-Specific Language) 중 하나**로 평가받고 있습니다. 그러나 PyTorch MLIR을 성공적으로 설치하는 과정은 때때로 복잡할 수 있습니다. `pip`을 통한 설치가 원활한 경우도 있지만, 그렇지 않을 경우 상당한 시간을 소모하게 됩니다.

다년간의 경험을 바탕으로, 안정적인 PyTorch MLIR 설치를 위한 핵심 사항과 권장 빌드 절차를 정리했습니다.

---

### **PyTorch MLIR 로컬 빌드 권장 절차**

다양한 설치 시도 끝에 얻은 결론은 다음과 같습니다.

1.  **독립 LLVM 설치 지양**: 일부 가이드에서 LLVM을 별도로 설치하도록 권장하지만, 이는 불필요하며 버전 불일치로 인한 문제를 야기할 수 있습니다. **LLVM은 별도로 설치하지 않는 것을 강력히 권장**합니다. 이로 인해 발생할 수 있는 시간 낭비를 줄일 수 있습니다.

2.  **Python 3.11 환경 준비**: 빌드를 위해 **Python 3.11** 환경을 준비합니다. 구체적인 설치 방법은 사용자의 운영체제 및 환경에 따라 다를 수 있습니다.

3.  **가상 환경(venv) 설정**: 깨끗하고 독립적인 개발 환경을 위해 **`venv`**를 활용하여 새로운 가상 환경을 구축하고 활성화합니다. 이후 필요한 모든 파이썬 모듈을 이 환경에 설치하며, `pip` 자체도 최신 버전으로 업그레이드하는 것이 좋습니다.

    ```bash
    python3.11 -m venv my_mlir_env
    source my_mlir_env/bin/activate
    pip install --upgrade pip
    ```

4.  **`torch-mlir` 레포지토리 클론**: GitHub에서 `torch-mlir` 레포지토리를 클론합니다. 이때 **`--recursive` 옵션을 사용하여 모든 서브모듈을 함께 가져와야 합니다.** `llvm-project` 역시 이 서브모듈에 포함되어 있습니다.

    ```bash
    git clone --recursive [https://github.com/llvm/torch-mlir.git](https://github.com/llvm/torch-mlir.git)
    cd torch-mlir
    ```

5.  **필수 파이썬 바인딩 설치**: 빌드 프로세스가 원활하게 진행될 수 있도록 **`nanobind`**와 **`pybind11`** 라이브러리를 `pip`으로 설치합니다.

    ```bash
    pip install nanobind pybind11
    ```

6.  **CMake 기반 빌드**: `torch-mlir` 레포지토리의 루트 디렉토리에서 `cmake`를 사용하여 빌드 환경을 설정하고 빌드를 시작합니다. `ninja` 빌더 사용을 권장합니다.

    ```bash
    cmake -GNinja -Bbuild \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DLLVM_ENABLE_ASSERTIONS=ON \
      -DPython3_FIND_VIRTUALENV=ONLY \
      -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
      -DLLVM_TARGETS_TO_BUILD=host \
      externals/llvm-project/llvm \
      -DLLVM_ENABLE_PROJECTS=mlir \
      -DLLVM_EXTERNAL_PROJECTS="torch-mlir" \
      -DLLVM_EXTERNAL_TORCH_MLIR_SOURCE_DIR="$PWD"

    cmake --build build
    ```
    **참고**: 이 과정에서 **`llvm-project`가 `torch-mlir`과 함께 빌드**됩니다. 이는 별도로 LLVM을 설치하지 말아야 하는 핵심적인 이유입니다. `torch-mlir`에 최적화된 LLVM 버전이 자동으로 포함되어 빌드되므로, 버전 불일치로 인한 오류를 방지할 수 있습니다.

---

### **빠른 설치를 위한 대안 (CPU 전용 환경)**

만약 CUDA 지원이 필요 없고 CPU 환경에서만 PyTorch MLIR을 사용해도 무방하다면, 다음 `pip` 명령어를 통해 비교적 간편하게 설치할 수 있습니다.

```bash
pip install --pre torch-mlir torchvision \
  --extra-index-url [https://download.pytorch.org/whl/nightly/cpu](https://download.pytorch.org/whl/nightly/cpu) \
  -f [https://github.com/llvm/torch-mlir-release/releases/expanded_assets/dev-wheels](https://github.com/llvm/torch-mlir-release/releases/expanded_assets/dev-wheels)
```

어차피 MLIR을 얻는 것이 최종 목표가 아니고 llvm IR을 얻거나 다른 HW용도로 compile을 할 예정이라면 llvm을 어쩔 수 없이 사용해야 하는데, 이땐 torch-mlir과 llvm의 버전이 잘 맞아야 문제가 없이 원하는 일을 수행할 수 있다. 하도 빨리 업데가 진행 중인 프로젝트라 되던 pass가 안되기도 하고 이름이 변경되기도 해서 예상치 못한 결과가 나올 수도 있으니 기왕이면 로컬빌드를 하는 것도 나쁘지 않다고 본다.

llvm project을 빌드해야 하다보니 생각보다 빌드 시간이 꽤 길다.
