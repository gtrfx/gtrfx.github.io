---
title: "arch linux와 NVIDIA gpu..."
tags: [cuda, aiml]
layout: post
author: "Keith"
---

arch linux를 잘못 업데하다가 드라이버가 죄다 꼬여서 부팅도 안되는 상태에 이르렀다.

어쩔 수 없이 OS까지 재설치 해야한다.

### OS 재설치에 이은 드라이버 재설치

CUDA를 쓰려면, 그것도 최신 GPU로 CUDA를 arch linux에서 쓰려면 좀 복잡하다.

다음을 pacman으로 잘 설치하면 문제 없이 된다.

nvidia-open-dkms

대개 nvidia-dkms를 설치하라고 권하는데, 이것은 proprietary driver로 예전 모델만 적용된다.

설치가 완료되면 nvidia-smi를 실행했을 때 내 GPU의 상태가 제대로 보고 되어야 한다. 잘 안되면 재부팅 한 번 해보고.

만일 이게 안되면 계속해서 위에 정리한 작업들 중에서 빼먹은 것이 있는지 나에게 맞지 않는 것이 있는지 찾아내서 다시 해줘야 한다.

### conda 설치

conda로 python/pytorch를 사용했다면 일단 conda를 설치하고 pytorch는 홈페이지에 가서 최신의 것을 받아와야 한다.    
conda로 pytorch-nightly 같은 데서 받아온다고 해서 최신의 GPU를 쓸 수 있는 게 아니다. 

일단 재설치했다고 해서 모든 게 아무 문제없이 굴러가지 않는다. 꽤나 많은 것들이 사용 중에 설치되고 업데이트 되고 했기 때문에 최소한 하루는 이것 저것 챙겨주는데 소요된다.

### 결론

피치 못하는 상황이 아니라면 (arch) linux는 업데 하지 말자. 특히나, 복잡한 하드웨어를 달고 있는 시스템은 업데할 때마다 드라이버 때문에 문제가 일어나니까.