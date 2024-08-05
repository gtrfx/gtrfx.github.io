---
title: "pyTorch 설치해보기..."
tags: [python]
layout: post
author: "Keith"
---

pytorch는 간단하게 deep learning 관련된 실험을 할 수 있게 만들어진 python module이다. 어떤 분야에 응용을 하려고 하든 일단 python와 pytorch는 설치해줘야 간단한 실험이나마 할 수 있다.

그게 아니면 자신이 행렬 계산, 활성화함수 계산 등등을 전부 구현해야 실험할 수 있는 것이니까 이런 머리아픈 것들 하지 않으면서도 신경망에 뭘 학습시키고 학습시킨 뒤에 인식률이 얼마나 좋은가 등등을 실험할 수 있다.

그러니까 너무 낮은 레벨의 것들에 집중해서 하다보면 원리를 학습한다든가 큰 그림을 그리기 너무 어려우니 이 모듈을 쓰는 거라고 보면 된다. 마치 matlab을 쓰듯.

문제는 대부분의 text가 nvidia gpu가 달려있는 intel mac/linux/window PC를 기본 가정으로 하고 있다. 그래서 그곳에서 알려준대로 설치했을 때 별 문제가 없으려면 이런 사양의 PC가 있어야 되는 거다.

그러니까 이 조건에서 빗나가는 상황이면 나름 괜찮은 성능을 낼 수 있는 HW라도 거기에 미치지 못하는 성능을 내거나 설치시에 에러가 나도록 되어있는 거다.

내 조건을 보면 AMD GPU가 붙어있기도 하고 MacOS인데 Ryzen CPU가 붙어있기도 하고 그렇다. 또 M1 pro macbook도 있다.

요점만 말하자면,

- python에서 pytorch module을 설치하려고 보면 cuda 지원 옵션이 활성화되어있는데, CUDA 가능한 GPU가 아니면 이 부분은 삭제해야 한다.
- intel mkl이 설치되도록 되어있는데, 만일 Ryzen CPU를 쓰고 있다면 openBLAS가 설치되게 하거나 아니면 MKL_DEBUG_CPU_TYPE=5를 설정해주어야 된다.
- MacOS에 AMD GPU 혹은 M1/2/3..가 설치된 하드웨어라면 pytorch-nightly channel로부터 모듈을 가져다가 설치하는 것이 좋다.

대충 benchmark test를 해보면 m1 pro도 나름 못 쓸 수준의 하드웨어는 아닌 것으로 보여진다. 물론 최신의 NVIDIA GPU가 설치되어있다면 좋긴 하겠는데 가격이 너무 비싸서 차라리 GPU가 아니라 CPU를 openMPI로 돌릴 수 있다면 나는 차라리 이 옵션이 더 좋을 것 같다고 생각한다. 