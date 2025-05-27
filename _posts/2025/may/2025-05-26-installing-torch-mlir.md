---
title: "torch-mlir 설치하기..."
tags: [mlir]
layout: post
author: "Keith"
---

MLIR을 굴리기 가장 좋은 DSL이 지금은 pytorch인 것 같다. 

그래서 어쩔 수 없이 설치 해야하는데 이게 pip으로 잘 설치되는 경우도 있고 아닌 경우도 있다.

이틀간 수도 없이 설치해본 결과 얻은 결론은 이렇다.

- 혹자는 llvm을 따로 가져다가 설치하라는데 이것을 할 필요가 없다. 아예 하지 마라.
- python 3.11을 가져다가 설치함 (설치 방법은 상황에 따라 각각 다 다름)
- venv로 새로 환경을 꾸리고 필요한 모듈을 가져다 설치한다. pip도 upgrade하고.
- torch-mlir을 github에서 가져다 clone함. 이때 submodule도 다 가져와야 됨. 여기에 llvm-project도 포함이 된다.
- nanobind와 pybind11을 설치해야 아래의 빌드가 문제 없이 진행된다. pip으로 설치하면 된다.
- 다음을 이용해서 cmake로 빌드환경을 꾸린다. 보시다시피 ninja로 설치되는 상황이다.
```
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
- 이때 LLVM과 같이 빌드가 된다. 그래서 llvm을 따로 가져다 설치하지 말란 거다. 그러면 버전이 matching이 안되서 원하지 않는 결과가 나온다 (그래서 시간을 엄청 까먹었다.)

Linux와 MacOS는 이렇게 설치하면 별 문제없이 설치된다. 또 내 환경이 특별히 CUDA가 필요없고 cpu로도 상관없는 상황이라고 한다면 아래와 같이해서 쉽게 설치가 된다.
```
pip install --pre torch-mlir torchvision \
  --extra-index-url https://download.pytorch.org/whl/nightly/cpu \
  -f https://github.com/llvm/torch-mlir-release/releases/expanded_assets/dev-wheels
```

어차피 MLIR을 얻는 것이 최종 목표가 아니고 llvm을 얻거나 다른 HW용도로 compile을 할 예정이라면 llvm을 어쩔 수 없이 사용해야 하는데, 이땐 torch-mlir과 llvm의 버전이 잘 맞아야 문제가 없이 원하는 일을 수행할 수 있다. 하도 빨리 업데가 진행 중인 프로젝트라 되던 pass가 안되기도 하고 이름이 변경되기도 해서 예상치 못한 결과가 나올 수도 있으니 기왕이면 로컬빌드를 하는 것도 나쁘지 않다고 본다.

llvm project을 빌드해야 하다보니 생각보다 빌드 시간이 꽤 길다.
