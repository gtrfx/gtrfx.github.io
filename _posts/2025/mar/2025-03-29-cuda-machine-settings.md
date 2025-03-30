---
title: "CUDA machine setup했다..."
tags: [aiml]
layout: post
author: "Keith"
---

냉큼 5070 ti를 사다가 arch linux가 설치된 머신에 붙여봤는데 한방에 되질 않았다. 누군가 우분투를 설치하면 조합이 좋다길래 또 팔랑귀에 냅다 우분투를 올려봤는데 무슨 문제인지 로그인도 잘 안되고 컴퓨터가 오동작을 해서 두번 설치했다가 지우고 다시 arch linux로 왔다.

dkms 드라이버를 다시 빌드해야된단다. NVIDIA에 들어가서 드라이버를 빌드해주는 스크립트를 받아와서 linux header를 모두 설치해서 드라이버 빌드 성공했고 마침내 python에서 cuda가 인식 되는 것을 확인했다. 총 소요시간은 구입 30분, 하드웨어 설치 30분 (이거 VGA 전원 두 개 끌어다 써야 해서 케이스를 제법 뜯어야 된다), 소프트웨어 설치 2시간 (삽질 + OS 3번설치 + 또 삽질) 총 3시간 들었다.

이제는 얼마나 빨리 잘 돌아가는지 확인하기 위해서 집과 회사에서 remote로 동작시키는 방법을 연구해야 한다. 

pytorch가 특별히 좋다라고는 말을 못하겠지만 이렇게 편한 게 지금까지 없으니까. 거기에 cuda를 붙이면 이렇게 편할 수 밖에 없으니.

뭐가 되었든 NVIDIA GPU를 안쓸 수 없는 상황이다.

그러나, linux 설치하고 이거 저거 하다보면 솔직히 Mac이 얼마나 좋고 편한지 알게 된다.

conda로 설치하면 최근 제품은 지원이 안된다. pytorch site에 가서 선택하면 nightly 버전을 pip으로 설치하는 커맨드를 알려준다.

일단 설치 내용은 이렇다: 
```
>>> torch.cuda.device_count()
1
>>> torch.cuda.device(0)
<torch.cuda.device object at 0x77e88b0429f0>
>>> torch.cuda.get_device_name(0)
'NVIDIA Graphics Device'
```

아주 간단한 벤치를 돌려보면 5070 ti CUDA에서 걸리는 시간이 pytorch-mps에서 돌리면 대충 15배 정도 나온다. 복잡한 걸 아직 안돌려봐서 모르지만 보나마나 이것보다 훨씬 더 날 것으로 보여진다.

colab에 가서 무료로 제공되는 T4를 가지고 돌렸더니 대충 8배 정도 걸리는 걸로 나온다. MLX는 안 돌려봤지만 잘 해봐야 7-8배쯤 나올 것 같다.
