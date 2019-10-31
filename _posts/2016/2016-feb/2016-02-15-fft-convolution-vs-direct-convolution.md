---
layout: post
title: "FFT convolution vs Direct Convolution"
---

이런 비교를 하는 글이 인터넷에 여러 개 있는데, overlap and add를 이용하는 경우에 대한 비교가 없기에 적어본다.연산이 대략 얼마정도 소요되는지만 계산해 보도록 한다.입력 샘플 $L$ 개와 coefficient $N$개가 있다고 하면,* Direct convolution의 경우는 $LN$ 회 MAC* FFT convolution의 경우는 $2N \log N$ + N + $L-1$따라서, $L=32$, $N=512$인 경우를 잡아보면,* Direct Convolution: 16384 operations* FFT convolution: 9757 operations연산과정의 꼼수를 좀 더 써보면 FFT에서는 L이 N에 비해 작으면 작을 수록 연산 회수를 더 줄여볼 수 있고, Direct convolution의 경우는 coefficient가 대칭인 경우 1/2에 가깝게 줄여볼 수 있다. 

