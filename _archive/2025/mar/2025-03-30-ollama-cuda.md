---
title: "arch linux: Ollama가 NVIDIA GPU를 쓰지 않을 때..."
tags: [llm, aiml]
layout: post
author: "Keith"
---

arch linux에서 pacman으로 기본적으로 nvdia 관련 드라이버를 전부 설치하고 ollama도 설치했다면 Nvidia GPU를 자동으로 알아서 사용할 것 같은데, 그렇지 않다. 

ollama serve로 서버를 띄울 때 보면 GPU를 찾아낸 것처럼 메시지가 뜨는 것을 나와도 막상 모델을 로딩할 때 GPU로 올라가질 않은 것을 알 수 있다.

```
nvidia-smi
```

이걸로 확인해보면 ollama가 model을 로딩했는지의 여부를 잘 알 수 있다. 

그래서 해결책이 뭐냐고?

ollama를 github에서 가져다가 직접 로컬 빌드하면 잘 된다. 나도 결국 이렇게 해서 해결했다.
