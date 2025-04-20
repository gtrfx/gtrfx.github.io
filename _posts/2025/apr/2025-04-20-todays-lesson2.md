---
title: "오늘의 학습 내용(4/20/2025)..."
tags: [study]
layout: post
author: "Keith"
---

Computer vision with PyTorch:
- 이미지 인식에 대한 대략적인 모델 학습
- Conv2D-RELU-MaxPool2D-Conv2D .... - MLP - ReLU - Softmax 식의 모델 구조
   - MaxPool이 정보량을 줄여 중요한 feature만을 획득
- ResNet (shortcut/residual (bypassed) path? 존재) 구조 학습
   - layer의 수가 많을 때 초기 layer의 output이 사라지거나 backward로 적용될 때 gradient가 사라지는 문제 해결.
- Transfer learning: LoRA처럼 기존 학습된 model에 새로운 인식 기능 추가.
- CNN + Transformer
- CLIP(Contrastive Language-Image Pretraining)
- SAM (Segment anything model): 요새 사람들이 좋아하는 기능 중 하나 (윤곽선 따기)
   - image encoder - prompt encoder - mask decoder
- Diffusion model: 재미있긴 한데 계산량이 어마어마하다.
    - Convolution
    - Timestep embedding
    - Attention blocks
    - ResNet blocks
    - Downsampling
- Stable diffusion: VAE (encoder/decoder)레이어를 추가해서 그림을 축소한 뒤 (latent space) diffusion 적용, 다시 그림을 키움.
