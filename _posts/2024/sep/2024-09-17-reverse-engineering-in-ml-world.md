---
title: "ML 시대의 reverse engineering?..."
tags: [aiml]
layout: post
author: "Keith"
---

ML이 사실상 대부분의 자연계/인문계의 문제를 풀어주는 도구로서 등장하고 그것이 확고히 자리를 잡아가는 시절인데, 그렇게 되다보면 어떻게 해야 남의 ML 모델을 가져다 나에게 효과적으로 사용할 수 있을지에 대한 문제가 생겨날 수 밖에 없다.

이를테면 그 옛날 회로도를 베껴다 뭔가를 만들 듯, 지금은 모델을 가져다가 베껴써야할 텐데 그렇게 되면 특허권이라든가 리버스 엔지니어링은 어떻게 해야할까 하는 문제가 생기는 거다.

이를테면 누군가가 자신들의 문제를 해결하기 위해서 사용했던 모델을 입수했다고 하자. 그럼 도무지 이 모델을 어떤 용도로 사용했을지 어떻게 알 수 있을까?

LLaMa3에게 물어보면 이렇게 알려준다.

When you only have an ONNX (Open Neural eXchange) file, it can be challenging to determine the major purpose of the machine learning (ML) model without additional information. However, here are some steps you can take to gather more information:

1. **Inspect the ONNX file**: You can use tools like `onnx` or `onnx-viewer` to inspect the ONNX file and get an idea of the model's architecture, input/output shapes, and other metadata.
2. **Check the model's documentation**: If the ONNX file was generated from a specific library or framework (e.g., TensorFlow, PyTorch, or scikit-learn), you can try to find the original documentation or code that generated the model. This might provide insight into the model's purpose.
3. **Use online tools**: There are online tools like `onnx-visualizer` or `mlflow` that can help you visualize and understand the model's architecture. These tools can provide insights into the model's layers, weights, and other components.
4. **Run the model**: If you have the necessary dependencies and libraries, you can try running the model with sample inputs to see what kind of output it produces. This can give you an idea of the model's purpose, such as classification, regression, or object detection.
5. **Search for related code or models**: If you have access to the codebase or repository where the ONNX file was generated, you can search for related code or models that might provide more context about the model's purpose.
6. **Contact the original developer**: If you're unable to find any information through the above methods, you can try contacting the original developer or the team that created the model. They might be able to provide more information about the model's purpose.

Some specific things you can look for in the ONNX file to get an idea of the model's purpose:

* The number and types of input/output tensors
* The presence of specific layers (e.g., convolutional, recurrent, or attention layers)
* The model's architecture (e.g., sequential, parallel, or hierarchical)
* The presence of specific activation functions or loss functions

Keep in mind that without additional information, it might be challenging to determine the model's purpose with certainty. However, by following these steps, you can gather more information and make an educated guess about the model's purpose.

글의 분량이 제법 되지만 내용은 사실상 일반적으로 할 수 있는 것들을 요약한 것에 불과하다. 이것도 생각하기 힘들었다면 뭐 좀 도움이 되긴 하겠지만. 

여기서 onnx 파일 같은 것은 내용물이 xml 같지 않고 그냥 binary로 되어있고 onnx visualizer라고 하는 것은 사실상 netron을 의미하는 것이라 전체 넷 구조와 그 안에 있는 각각의 넷에 weight가 어떻게 되어있는지 볼 수는 있다. 글쎄 그걸 본다고 이 모델이 뭐하는 모델인지 알 수 있을까? 

그 다음 할 수 있는 것은 onnx runtime이라는 모듈을 받아다가 실행해보는 것이다. 실행한다고 해서 알 수 있는 것은 뭐랄까 랜덤한 텐서를 넣어주고 뭐가 나오는지를 확인하는 정도랄까? 입력을 계속 이런 저런 형태로 변화시켜 넣어보고 나오는 결과의 변화를 확인하는 수 밖엔 없다. 나머지는 개인의 경험 데이터 베이스에서 입력에 대한 출력 패턴을 확인하면서 매칭을 시켜보는 수 밖에 답이 없다.

