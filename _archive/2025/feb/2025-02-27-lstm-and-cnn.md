---
title: "딥러닝에 대해서 간단히 이해를 해볼까..."
tags: [life]
layout: post
author: "Keith"
---

옛날엔 기껏해야 MLP (지금으로 치면 그냥 linear layer)가 고작이고 이걸 어떻게 이어붙이냐에 대해서 RNN 정도 나와있었던 것 같다.

사실 CNN이 나오면서 NN으로 인식을 구현하기가 좋아졌다는 사실이 알려졌고 RNN을 보다 구체화한 LSTM이 time-series 처럼 어떤 맥락이 있는 시퀀스에 대한 인식도 가능한 것을 알게 되었고.

이게 LLM으로 커지게 된 것은 다들 알고 있는 논문 "Attention is all you need"에서 나온 transformer 구조이다. 왜 특별하냐면, 기존의 망에서는 언어가 가지는 맥락에 의해서 그것이 time-series 같은 거라 흔히 생각할 수 있는 RNN/LSTM을 적용하던 것에서 떠나서 새로운 구조를 제시했기 때문이다.

먼저 transformer라는 것은 이 논문에서 보여주고 있는 망의 구조에 명명한 것인데, 이걸 이해하기 위하여 몇 가지 개념들을 더 알아봐야한다.

- self-attention

그러니까 문장 내에서 각각의 단어들이 갖는 dependency를 보는 것이다. 여기서 attention이라는 것은 그냥 관심이라는 뜻 보다는 어떤 weight를 관심을 두고 봐야 하는지에 대한 것이다. 즉, 어떤 문장이 입력되었다고 하면 그것 중에서 어떤 것이 중요한 의미를 띠고 있느냐 (그러니까 여기서는 단어와 단어간의 연관성을 의미한다) 를 알아봐야한다는 것이다.

- multi-head attention


- positional encoding

transformer 구조에서는 RNN/LSTM처럼 어순에 대한 인식을 하는 기능이 없어서 단어의 위치에 대한 정보를 고려하는 별도의 encoder가 요구된다.

- feedforward neural networks

self-attention mechanism을 처리한 뒤에 나온 결과들은 full-connection layer를 통과하게 된다.

- encoder-decoder structure

encoder는 입력 시퀀스 (문장) 을 처리하고 decoder는 출력 시퀀스 (응답)을 만들어낸다고 보면 된다.

transformer 구조가 혁신적인 이유는 기존의 RNN/LSTM으로 구성된 넷이 처리가 순차적으로 이루어져야 하기 때문에 병렬화가 어렵다는 문제를 극복해냈다는 것이다. 다시 말해서 입력시퀀스가 순차적으로 처리되면서 중간 결과가 이전의 결과에 의존하고 있게 되면 병렬화가 어렵다는 문제가 생기는데, 이것은 단어와 단어들간의 순서를 나타내는 정보가 들어가서 그것을 feed forward network이 처리하게 되기 때문에 병렬화를 할 수 있게 되는 거다.

더구나 처리하는 과정에 존재하는 많은 weight 중에서 의미가 있는 것들만 끄집어내어 처리하게 되면 연산량과 메모리 소비 둘 다 줄일 수 있고 transformer 구조를 사용하게 되면 이 attention, 즉 어떤 것을 유심히 봐야하는지, 그러니까 유의미한 것들만 뽑아내어 처리하는 능력을 끌어올릴 수가 있다.

인코더는 간단하게 self-attention을 따져보고 그것을 feed forward network을 통과시켜 그 결과를 내보내는 구조이다. 디코더는 마찬가지로 인코더에서 출력한 값을 받아서 self-attention을 따져보고 다시 encoder-decoder attention층을 지나 full connection NN을 지나 출력을 내보내는 구조로 되어있다.

self-attention을 계속해서 따져보는 과정에서 유의미한 것들만 계속해서 추려내고 그것으로 원하는 결과를 얻도록 학습하게 되는 그런 구조가 된다. 더 자세히 말하자면 요지만 알아서 추려내는 기능. 이게 사람보다 기계가 더 잘 할 수 밖에 없는 것이 사람보다 더 많은 데이터를 학습하고 그것이 어느 정도 쌓이게 되면 그 경향성이 더욱 더 확고해지기 때문이라고 생각한다. 수 많은 데이터를 통해서 어떤 통계를 얻게 되면 어쩌다 outlier가 나와도 별 다른 영향을 주지 못하는 것처럼 말이다.

LLM에 사람이 엉터리 질문을 하더라도 찰떡같이 잘 알아듣고 원하는 결과를 내보내는 특징을 보여주는 이유가 바로 이 attention을 잘 구현해놨고 충분한 학습을 통해서 사람 말을 알아듣는 확고한 기준이 세워졌기 때문이라고 본다.
