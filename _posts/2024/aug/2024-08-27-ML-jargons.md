---
title: "ML 용어 간략 정리..."
tags: [machine learning]
layout: post
author: "Keith"
---

내 분야에만 갇혀있었더니 업계의 용어 및 약어가 엄청나게 늘어났다는 사실을 알게 되었다. 그냥 약어가 눈에 익혀져있는 걸로 끝나는 게 아니라 이게 정확히 어떤 개념을 표현하려고 하는지를 알아야 진정 안다고 할 수 있으니까 일단 썰을 붙여보자.

**MLP (Multi-Layer Perceptron)**:

* A type of neural network that consists of multiple layers of interconnected nodes (neurons) that process inputs and produce outputs.
* Each layer applies a non-linear transformation to the input data, allowing the network to learn complex relationships between inputs and outputs.
* MLPs are commonly used for classification, regression, and function approximation tasks.

이것은 사실상 초기에 나왔던 신경망의 구조 되겠다. 하나의 layer는 입력을 가지고 어떤 linear transform (matrix multiplication)을 한 뒤에 activation function (tanh, sigmoid, ReLU 등등)으로 비선형 함수에 매칭해서 비선형성을 더해주고 다음 layer로 넘어간다. 입력은 그것이 어떤 정보이든 일렬로 늘어선 (flattened) node들을 통해서 들어오게 된다.

**NLP (Natural Language Processing)**:

* A subfield of artificial intelligence (AI) that deals with the interaction between computers and human language.
* NLP involves the development of algorithms and statistical models that enable computers to process, understand, and generate natural language data.
* NLP tasks include text classification, sentiment analysis, language translation, named entity recognition, and text summarization.

NLP는 자연어 (인간이 사용하는 언어)를 처리하는 과정이라고 볼 수 있다. 

**LSTM (Long Short-Term Memory)**:

* A type of Recurrent Neural Network (RNN) architecture designed to handle the vanishing gradient problem in traditional RNNs.
* LSTMs are particularly well-suited for modeling sequential data, such as speech, text, or time series data, where the relationships between inputs and outputs depend on the order in which they occur.
* LSTMs use memory cells to store information for long periods of time, allowing them to learn long-term dependencies and patterns in data.

In ML terms, these concepts can be combined in various ways to build powerful models for NLP tasks. For example:

* A simple MLP can be used for text classification, where the input is a bag-of-words representation of the text and the output is a class label.
* A more advanced model might use an LSTM to model the sequential structure of text data, followed by a MLP to classify the output.
* A state-of-the-art model might use a combination of techniques, such as word embeddings (e.g., Word2Vec, GloVe), attention mechanisms, and LSTMs, to build a sophisticated NLP model.

장 단기 기억 이라고 번역하는 것 같다. 

#### Architectural Terms:

**AlexNet**:

* A deep neural network architecture developed by Alex Krizhevsky, Ilya Sutskever, and Geoffrey Hinton in 2012.
* AlexNet is a convolutional neural network (CNN) that won the ImageNet Large Scale Visual Recognition Challenge (ILSVRC) in 2012, achieving a top-5 error rate of 15.3%.
* The architecture consists of five convolutional layers and three fully connected layers, with a total of over 60 million parameters.
* AlexNet is notable for its use of convolutional neural networks for image classification, which was a departure from traditional approaches that relied on hand-crafted features.

화상 인식을 하는 NN 구조 중 하나다.

**ReLU (Rectified Linear Unit)**:

* A type of activation function used in neural networks.
* ReLU is a simple and efficient activation function that maps all negative values to 0 and all positive values to the same value.
* ReLU is often used as a replacement for traditional sigmoid or tanh activation functions, as it is faster to compute and less prone to vanishing gradients.
* ReLU is commonly used in deep neural networks, including AlexNet, to introduce non-linearity and improve the model's ability to learn complex patterns.

**NPU (Neural Processing Unit)**:

* A type of hardware accelerator designed specifically for neural networks.
* NPUs are optimized for matrix multiplication and other operations that are common in deep learning, allowing them to perform these tasks much faster than traditional CPUs.
* NPUs are often used in data centers and edge devices to accelerate the processing of neural networks, reducing the time and energy required to train and deploy models.
* NPUs can be used to accelerate a wide range of neural network architectures, including AlexNet, and are particularly well-suited for applications that require high-performance and low-latency processing.

1. **Convolutional Neural Network (CNN)**:
	* Input: Image data (e.g., RGB images)
	* Layers:
		+ Convolutional layer (e.g., 32 filters, kernel size 3x3)
		+ Activation function (e.g., ReLU)
		+ Pooling layer (e.g., max pooling, kernel size 2x2)
		+ Flatten layer
		+ Fully connected layer (e.g., 128 units)
		+ Output layer (e.g., 10 units for classification)
2. **Recurrent Neural Network (RNN)**:
	* Input: Sequential data (e.g., text, speech, time series)
	* Layers:
		+ RNN layer (e.g., LSTM or GRU)
		+ Dropout layer (e.g., 0.2 dropout rate)
		+ Fully connected layer (e.g., 128 units)
		+ Output layer (e.g., 10 units for classification)
3. **Autoencoder**:
	* Input: Input data (e.g., images, text)
	* Layers:
		+ Encoder (e.g., convolutional layer, followed by fully connected layer)
		+ Bottleneck layer (e.g., 128 units)
		+ Decoder (e.g., fully connected layer, followed by convolutional layer)
		+ Output layer (e.g., reconstructed input data)
4. **Generative Adversarial Network (GAN)**:
	* Input: Noise data (e.g., random vectors)
	* Layers:
		+ Generator (e.g., fully connected layer, followed by convolutional layer)
		+ Discriminator (e.g., convolutional layer, followed by fully connected layer)
		+ Output layer (e.g., generated data or classification output)
5. **Transfer Learning**:
	* Input: Pre-trained model (e.g., VGG16, ResNet50)
	* Layers:
		+ Pre-trained convolutional layers (e.g., 13 layers)
		+ New fully connected layer (e.g., 128 units)
		+ Output layer (e.g., 10 units for classification)

#### NPU examples:

1. **Tensor Processing Unit (TPU)**:
	* Designed by Google, the TPU is a custom-built NPU for accelerating machine learning workloads.
	* The TPU architecture consists of a matrix multiplication unit, a memory hierarchy, and a control unit.
	* The TPU is optimized for matrix multiplication and other operations common in deep learning.
2. **Google Tensor Processing Unit (TPU v3)**:
	* The TPU v3 is a more recent version of the TPU, with improved performance and energy efficiency.
	* The TPU v3 has a higher matrix multiplication capacity, a larger memory bandwidth, and a more efficient control unit.
3. **NVIDIA Tensor Core**:
	* The Tensor Core is a custom-built NPU designed by NVIDIA for accelerating deep learning workloads.
	* The Tensor Core architecture consists of a matrix multiplication unit, a memory hierarchy, and a control unit.
	* The Tensor Core is optimized for matrix multiplication and other operations common in deep learning.
4. **AMD Instinct**:
	* The Instinct is a custom-built NPU designed by AMD for accelerating machine learning workloads.
	* The Instinct architecture consists of a matrix multiplication unit, a memory hierarchy, and a control unit.
	* The Instinct is optimized for matrix multiplication and other operations common in deep learning.
5. **Xilinx Zynq UltraScale+ MPSoC**:
	* The NPU is optimized for matrix multiplication and other operations common in deep learning.


#### ResNet:

ResNet is a deep neural network architecture that is designed to ease the training process and improve the performance of deep neural networks. The key innovation of ResNet is the introduction of residual connections, which allow the network to learn much deeper representations than previously possible.

**Residual Connections:**

In a traditional neural network, each layer learns a new representation of the input data by applying a series of transformations (e.g., convolution, pooling, activation functions). However, as the network gets deeper, the gradients used to update the weights during backpropagation become smaller, making it harder to train the network.

ResNet introduces residual connections, which allow the network to learn residual functions instead of learning the entire function. This is done by adding the input of a layer to its output, which creates a shortcut connection. This allows the network to learn the difference between the input and output of a layer, rather than the entire function.

**ResNet Architecture:**

The ResNet architecture consists of several residual blocks, each of which contains several convolutional layers, batch normalization layers, and ReLU activation functions. The output of each residual block is added to the input of the block, creating a shortcut connection.

The ResNet architecture can be summarized as follows:

* Input: Image data
* Convolutional layer: Applies a convolutional operation to the input data
* Batch normalization layer: Normalizes the output of the convolutional layer
* ReLU activation function: Applies an element-wise activation function to the output of the batch normalization layer
* Residual block: Applies a series of convolutional layers, batch normalization layers, and ReLU activation functions to the output of the previous layer
* Shortcut connection: Adds the input of the residual block to its output
* Output: The output of the final residual block is the final output of the network

**Advantages of ResNet:**

ResNet has several advantages over traditional neural network architectures:

* **Deeper networks:** ResNet allows for much deeper networks than previously possible, which leads to better performance on image recognition tasks.
* **Easier training:** ResNet is easier to train than traditional neural networks, as the residual connections help to alleviate the vanishing gradient problem.
* **Improved performance:** ResNet has achieved state-of-the-art performance on several image recognition benchmarks, including the ImageNet Large Scale Visual Recognition Challenge (ILSVRC).

**Applications of ResNet:**

ResNet has been widely used in several applications, including:

* **Image recognition:** ResNet has achieved state-of-the-art performance on several image recognition benchmarks, including ILSVRC.
* **Object detection:** ResNet has been used as a feature extractor in object detection architectures, such as Faster R-CNN.
* **Image segmentation:** ResNet has been used in image segmentation architectures, such as U-Net.
* **Natural language processing:** ResNet has been used in natural language processing tasks, such as language modeling and text classification.


#### Encoder and Decoder

In Machine Learning (ML), an encoder and a decoder are two essential components of a neural network architecture, particularly in sequence-to-sequence models. Here's a brief overview of their purposes:

**Encoder:**

The encoder is responsible for:

1. **Input Processing**: The encoder takes in input data, such as text, images, or audio, and processes it into a numerical representation.
2. **Feature Extraction**: The encoder extracts relevant features from the input data, which are then used to generate a condensed representation of the input.
3. **Contextualization**: The encoder contextualizes the input data, capturing the relationships between different parts of the input.

The encoder's output is typically a fixed-size vector or a sequence of vectors, which is then passed to the decoder.

**Decoder:**

The decoder is responsible for:

1. **Generation**: The decoder generates output data, such as text, images, or audio, based on the encoded representation provided by the encoder.
2. **Sequence Generation**: The decoder generates a sequence of output tokens, one at a time, conditioned on the previous tokens and the encoded representation.
3. **Probability Estimation**: The decoder estimates the probability of each output token, given the previous tokens and the encoded representation.

The decoder's output is the final generated output, which can be a sequence of tokens, an image, or an audio signal.

**Sequence-to-Sequence Models:**

In sequence-to-sequence models, the encoder and decoder work together to perform tasks such as:

* Machine Translation: translating text from one language to another
* Text Summarization: summarizing long documents into shorter summaries
* Image Captioning: generating captions for images
* Speech Recognition: transcribing spoken audio into text

The encoder processes the input sequence, and the decoder generates the output sequence, one token at a time, conditioned on the encoder's output and the previous tokens.

In summary, the encoder extracts relevant features from the input data and contextualizes it, while the decoder generates output data based on the encoded representation.

#### Transformer:

In Machine Learning (ML), a transformer is a type of neural network architecture introduced in 2017 by Vaswani et al. in the paper "Attention Is All You Need". It's primarily designed for sequence-to-sequence tasks, such as machine translation, but has since been widely adopted in many other areas of natural language processing (NLP).

**What is a Transformer?**

A transformer is a type of encoder-decoder architecture that relies entirely on self-attention mechanisms to process input sequences. It's called a "transformer" because it transforms the input sequence into a continuous representation that can be used for various downstream NLP tasks.

**Key Components:**

1. **Self-Attention Mechanism**: This is the core component of the transformer architecture. It allows the model to attend to different parts of the input sequence simultaneously and weigh their importance. This is different from traditional recurrent neural networks (RNNs), which process sequences sequentially and have recurrence connections.
2. **Encoder**: The encoder takes in a sequence of tokens (e.g., words or characters) and outputs a sequence of vectors, called "keys," "values," and "queries." These vectors are used to compute the self-attention weights.
3. **Decoder**: The decoder takes the output of the encoder and generates the output sequence, one token at a time. It uses the self-attention mechanism to compute the output token probabilities.

**How it Works:**

1. The input sequence is first embedded into a vector space.
2. The encoder processes the input sequence using self-attention mechanisms, generating a sequence of vectors.
3. The decoder generates the output sequence, one token at a time, using the self-attention mechanism and the encoder's output.
4. The output token probabilities are computed using the self-attention weights and the decoder's output.

**Advantages:**

1. **Parallelization**: The transformer architecture can be parallelized more easily than RNNs, making it much faster to train and evaluate.
2. **Scalability**: Transformers can handle longer input sequences and larger models than RNNs.
3. **Performance**: Transformers have achieved state-of-the-art results in many NLP tasks, including machine translation, text classification, and question answering.

**Applications:**

1. **Machine Translation**: Transformers have been widely used in machine translation tasks, achieving state-of-the-art results.
2. **Text Classification**: Transformers have been used for text classification tasks, such as sentiment analysis and spam detection.
3. **Question Answering**: Transformers have been used for question answering tasks, such as SQuAD and TriviaQA.
4. **Language Modeling**: Transformers have been used for language modeling tasks, such as predicting the next word in a sentence.

In summary, the transformer is a powerful neural network architecture that has revolutionized the field of NLP. Its self-attention mechanism and parallelization capabilities make it an ideal choice for many sequence-to-sequence tasks.