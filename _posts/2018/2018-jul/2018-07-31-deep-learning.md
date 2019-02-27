---
title: "일반인의 눈으로 본 Deep Learning (2)"
tags: [deep learning, neural network]
categories:
    - computing
    - deep_learning
---

### Deep learning history

Deep learning의 역사에 대해서 잘 해설해놓은 article을 찾기 쉽지 않았는데, 우리 말로 된 인터넷 문서로는 없다고 단언하고 싶다. 

수 많은 문서를 찾아봤지만 가장 쓸모 있다 싶은 것은 아래 링크에 있는 것이다. 

[http://www.andreykurenkov.com/writing/ai/a-brief-history-of-neural-nets-and-deep-learning/](http://www.andreykurenkov.com/writing/ai/a-brief-history-of-neural-nets-and-deep-learning/)

모두 4개로 되어있는데 내용이 알차다. 적어도 자신이 적고 있는 내용이 무엇인지 이해하고 작성했다. 이외의 것들은 내용이 두루뭉실하게 씌여있거나 핵심이 빠져있는 게 대부분인데 아마도 그 글을 쓴 사람 자신이 deep learning과 neural network에 대한 이해가 부족한 것으로 보여지고, 남이 쓴 것을 (나의 아는 척을 위해) 그대로 옮겨적어왔거나 누군가가 영문으로 작성한 것을 일부만 번역해 놓은 것이라 어디가서 아는 척 하기 위한 용도인가 싶을 정도로 용어나 열거하다가 끝이 난다.

이것 저것 읽어보다 느낀 것인데, deep learning은 2010년 이후엔 엔지니어링 세계에서 일하는 사람들에겐 무슨 상식쯤 되어버린 것 같다. 소프트웨어 엔지니어들은 말할 것도 없고 말이다. 

이 역사를 읽어보는 이유는 내가 봤을 때 딱 하나다. 80년대 90년대까지 neural network가 각광을 받다가 갑자기 빙하기에 접어들었는데, 그게 왜 갑자기 지금 대 각광을 받고 있느냐, 그 이유가 무엇인가 하느냐를 파악하기 위함이다. 

내용은 간단하다. 이미 80-90년대에도 multilayer perceptron(MLP)이며 R-NN, C-NN 등등 backpropagation이며 deep learning을 위한 기본 개념들은 다 있었다. 문제는 layer가 늘어나면 leaning을 제대로 못 시킨다는 것에 있었다. 이를테면 아무리 학습을 시켜도 error를 충분히 낮게 수렴시킬 수 없었다거나 수렴을 시켰지만 그것이 진정 최적화가 된 것인지 아닌지 알 수 없고, 그렇게 학습된 network이 충분한 정확도의 인식률을 갖지 못했다는 것이 사실 더 큰 이유였다고 봐야할 것이다. 직관적으로 보면 node의 수를 늘리고 layer를 늘릴 수록 복잡한 문제를 잘 풀어낼 수 있어야 하지만, 그렇게 되면 학습을 시키는 것이 쉽지 않고 충분히 학습을 시켰다고 생각하지만 그것이 충분한지 아닌지 알 수가 없고 인식률 또한 layer와 node의 수가 늘어난 것에 비해 개선되는 경향을 발견할 수 없는 경우가 많았기 때문이지 싶다.

이것이 2006년에 와서 일대 변화가 일어나는데, 일반적으로 random value로 놓는 initial weight를 별도의 학습 방법을 통해 초기화하고 학습을 시켰더니 이른 바 local minima에 빠진다거나 망 자체가 saturate되거나 아니면 underflow가 되지 않고 매우 빠르게 그리고 인식률을 높여 학습할 수 있게 되었다는 것이다.

이것을 어떻게 해냈냐는 따로 예를 들어서 생각해보면 좋을 것 같다. 