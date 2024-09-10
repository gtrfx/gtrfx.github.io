---
title: "NPU는 어떻게 구성되어있는가?..."
tags: [aiml]
layout: post
author: "Keith"
---

NPU라고 해서 Neural Processing Unit이라고 명명해서 GPU나 CPU와도 구별지어 이야기하는 것 같다. 

사고의 기준을 과거에 기준해서 생각하면 GPU도 그렇고 NPU라고 하는 것도 뭔가 쓸데없이 과다한 계산과정을 인위적으로 도입해서 컴퓨터를 고생시키는 개념이구나 하고 생각할 수 있다 (내가 그렇다). 그런데 그 옛날 timer라든가 gpio 모듈이 별도의 칩으로 되어있다가 지금은 모든 microcontroller에서도 아주 기본적인, 그것도 모듈이라고 불리기도 뭐한 단순한 요소가 되었듯, 지금은 스마트폰의 AP라고 불리우는 microcontroller에서 기본적인 모듈로 전부 다 들어왔다. 이미 apple M1이 나왔을 때부터 그런 모양새를 일찌감치 봐왔다. 그래서 local로 LLM도 돌리고 하는 세상이 되어버린 거다.

사실 겨우 timer/gpio만 붙이고 있던 microcontroller가 저가 제품을 주름 잡을 때, 그것보다 살짝 좋은 것들은 나름 SIMD engine을 가지고 있었던 것도 있고 USB interface와 ethernet MAC까지 가지고 있었으니까 말이다. 사고의 기준을 어디에 잡느냐에 따라 멍청해지는 것은 순식간이구나 하게 되는 거다 (내가 좀 그렇다).

NPU는 구성요소가 간단하다. 왜? 나머지는 모두 소프트웨어가 해야 하기 때문이다. 

neural network이란 게 기본 요소를 따지고 들어가자면 구성이란 게 너무 간단해서 행렬 계산, 사실 그것도 GEMV - 그러니까 행렬과 벡터의 곱 - 또는 GEMM (Matrix x Matrix)을 잘 계산하고 그 결과를 activation function (대략 업계에서는 3가지, ReLU, tanh, sigmoid)에 mapping하는 최소의 구성을 기본으로 해서 이것을 확장시킬 수 있는 routing 기능을 하는 것으로 구성되는 것이다. 다시 말해서 multiplier array + routing module (controller + local memory) 둘로 구성되어있다고 보면 된다. 

GEMV/GEMM는 얼마나 많은 multiplier를 심어놓느냐에 따라 그 성능이 결정되겠지만, 그 각각을 체울 데이터를 외부에서 가져와야 되기 때문에, 또 원하는 시점에 바로바로 load할 수 있어야 하기 때문에 그냥 얼핏 생각하면 multiplier만 많으면 되는 거 아냐? 할 수 있겠지만 여기 있는 데이터를 저쪽으로 이동시키고 등등의 일이 더 많아서 사실은 interconnnection하는 logic들의 비중이 더 높아질 수 밖에 없다. 

이를테면 내가 module 하나에 64 x 64 matrix와 64 x 1 vector 곱을 계산할 수 있도록 multiplier array를 설계했다고 하더라도 이 값들을 읽어다가 loading하고 control하는 logic이 더 복잡하게 구성될 수 밖에 없다. 왜냐하면 내가 해야하는 network이 늘 64로 구성되는 logic으로 딱 떨어지지도 않고 network의 구성이 그냥 MLP으로 되지도 않고 resnet이니 RNN(LSTM, GRU)이니 하는 다양한 구조가 될 수 있으니 말이다. 그것들이 cascaded로 연결되는 구조의 network이고 모든 multiplier를 최대한 가동시키려고 하면 생각보다 운영하는 것이 쉬울 수가 없다.

이를테면 대개 NPU의 성능을 그 안에 multiplier의 개수와 clock speed의 곱으로 해서 OP 혹은 FLOP 등의 수로 표현하는데, 일반적인 경우에서는 아무리 잘 스케쥴링을 하더라도 효율이 90% 정도 되는 것도 바라기가 어렵다. 스케줄링을 잘 해서 연산과정의 한 가운데에서는 효율이 최대에 이르게 할 수도 있겠지만, 연산과정이 시작되서 ramping up을 하거나 마지막으로 연산을 끝내고 마지막 결과들을 밖으로 뽑아내는 경우는 당연히 효율이 크게 떨어지게 된다. 

어쨌거나 이런 일들은 다 소프트웨어가 해줘야 하기 때문에 그만큼이나 쉽지 않다. 더구나 데이터를 어디서 어디로 옮길 수 있느냐 선택할 수 있는 방법을 얼마나 마련해놨느냐에 따라서 스케줄링 효율이 얼마나 날 수 있을지가 결정 되는 거다. 

그 때문에 그 옛날 GPU에 들어있는 multiplier들을 사용자가 자신의 목적대로 이용할 수 있도록 CUDA라는 것을 만들어놓은 덕택에 NVIDIA는 이 시절 빛을 보고 있는 것 아닌가. 

