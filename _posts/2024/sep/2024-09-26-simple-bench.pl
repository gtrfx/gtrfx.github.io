---
title: "pytorch를 돌릴 때의 간단한 벤치..."
tags: [aiml]
layout: post
author: "Keith"
---

내가 CUDA gpu를 가지고 있지 않고 해킨을 쓰고 있지만 ryzen을 쓰고 있는 이유로 누릴 수 있는 하드웨어의 이득에 한계가 있어 간단히 테스트 해봤다. 엄밀히 말해서는 GEMM을 어떻게 잘 구현했는가를 보는 것이라고 할 수 있을 것 같다.

```
import time
import torch

device = "mps"

torch.manual_seed(1234)
TENSOR_A_CPU = torch.rand(5000, 5000)
TENSOR_B_CPU = torch.rand(5000, 5000)

torch.manual_seed(1234)
TENSOR_A_MPS = torch.rand(5000, 5000).to(device)
TENSOR_B_MPS = torch.rand(5000, 5000).to(device)

# Warm-up
for _ in range(100):
    torch.matmul(torch.rand(500,500).to(device), torch.rand(500,500).to(device))
    
start_time = time.time()
torch.matmul(TENSOR_A_CPU, TENSOR_B_CPU)
print("CPU : --- %s seconds ---" % (time.time() - start_time))

start_time = time.time()
torch.matmul(TENSOR_A_MPS, TENSOR_B_MPS)
print("MPS : --- %s seconds ---" % (time.time() - start_time))
```

일단 m1 pro (macbook)에서 테스트해 보면 다음과 같다. 생각보다 mps가 제법 빠르다.

```
CPU : --- 0.15439677238464355 seconds ---
MPS : --- 0.003412008285522461 seconds ---
```

5950x on Linux (only with CPU)
```
CPU : --- 0.18170909677238464355 seconds ---
```

7950x on MacOS (only with CPU)
```
CPU : --- 0.11949491500854492 seconds ---
```

전체적으로 보면 7950x까지 가봐야 그다지 성능 이득을 볼 수가 없고 GPU를 동원해야 뭔가 의미있는 성능 개선 효과를 볼 수가 있다. MacOS에서는 Metal을 다소 무시하는 경향이 있는데, 그럴 이유는 없다고 보여진다.

Ryzen이라 MKL을 쓸 수 없다는 아쉬움이 있고 해킨이라도 GPU를 활용한 metal layer를 쓸 수 있으니까 이 또한 한 번 생각해봐야지 싶다. 어차피 Mac에서 CUDA를 쓰는 것은 쉽지 않은 일이니까.

뭐 보이는 바와 같이 위의 예제는 그냥 난수를 발생시키고 행렬 연산을 시키는 것이니까 전반적인 성능 (중요한 게 학습 성능이지 싶은데)의 평균값은 아니지만 대부분의 layer에서 하는 일이, 그 중에서 비중이 큰 것이 행렬 곱셈이다 보니 그렇게 된다고 본다.

그런데, Apple에서 내놓았다는 MLX라는 게 있다. torch mps보다 빠르다.

이게 그 결과다. m1 pro에서 같은 맥락으로 테스트한 거다. CUDA에 비할 수는 없겠지만, 그렇다고 1k가 넘어가는 CUDA를 달아서 시스템을 구성할 게 아니라면 괜찮지 싶다.
어차피 MacOS를 쓰면서 CUDA를 같이 굴릴 수도 없으니 이게 방법이지 싶다. 예제를 비교해보면 Ryzen을 써서 하는 것보다 좋으면 좋았지 나쁘지 않다. 
```
CPU : --- 0.16413402557373047 seconds ---
MPS : --- 0.0030901432037353516 seconds ---
MLX : --- 9.5367431640625e-07 seconds ---
```

그런데 잘 보면 MLX에서는 float32까지 지원되고 앞서의 cpu/mps의 경우에서는 double로 계산한 것이다. 

동등하게 비교하기 위해서 둘 다 다 float32로 바꿔서 실험하면 다음과 같이 나온다.

```
CPU : --- 0.15943288803100586 seconds ---
MPS : --- 0.0029489994049072266 seconds ---
MLX : --- 9.5367431640625e-07 seconds ---
```

결과의 차이가 없다. CPU만 double(float64) 연산이 가능하고 나머지 GPU를 사용하는 경우는 float32까지 허용한다. 대개의 경우 double까지 가야할 이유가 없으니 GPU로 하면 되고
그런 의미에서 apple silicon을 쓰면 MLX를 쓰는 것이 바람직하구나 싶다. CUDA보단 느리지만 그래도 CPU보단 월등히 빠르니까.

pytorch로 할 수 있는 것은 mlx로 거의 다 할 수 있다. 다만 좀 약간의 적응이 필요하긴 한데, general한 DL을 하는 데는 별다른 어려움이 없다. 

이래서 어차피 유의미한 성능차이가 없는데 가격만 비싸고 전력만 오지게 먹는 x86 PC를 GPU와 함께 조립하는 것 보단 역시나 M4 pro mac mini를 사는 것이 나름 의미가 있지 싶다. 아니..꼭 사야겠다.
