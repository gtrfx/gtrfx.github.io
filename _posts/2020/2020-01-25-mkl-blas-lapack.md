---
title: "MKL vs. BLAS vs. LAPACK"
layout: post
tags: [mkl, blas, lapack]
---

아마도 Octave라든가 scientific library 같은 것들을 build해 본적이 있다면 잘 알만한 용어(?)들이다.

1) MKL (Math Kernel Library)

이것은 인텔에서 만든 일반적인 수학계산을 하는 함수들의 라이브러리다. 아래 얘기할 BLAS/LAPACK도 이 안에 포함되어있다고 보면 된다. 상용 프로그램이고 오직 intel CPU에서만 돌게 되어있다. CPU ID를 옵션으로 주는데, CPU 별로 가용 instruction이 다르므로 그에 맞춰 최적화했다는 것이다. 이것 외에도 deep learning을 위한 함수, FFT 등등을 포함한다. AMD 프로세서의 경우 "MKL_DEBUG_CPU_TYPE=5"로 세팅하면 사용할 수 있다고 하는데, 이런 옵션이 언제까지 존재할지는 모르는 일이므로 당장엔 수학계산상에서 AMD 프로세서가 우위를 가지고 있다라는 것을 보여주는데 intel MKL이 사용되어지고 있다.

2) BLAS (Basic Linear Algebra Subprogram)

이것은 선형대수 (벡터/행렬연산)를 위한 아주 기본적인 함수들의 집합이 되겠다. 별 것 없을 것 같지만 제법 내용이 많다. 대부분 우리가 쓰는 행렬 연산 함수는 LAPACK에 있고 그게 BLAS의 함수들을 불러 실행하므로 BLAS가 얼마나 최적화되어있느냐가 최종적인 성능을 결정짓는다고 보면 된다. intel MKL을 사용하지 않는 경우 

3) LAPACK (Linear Algebra Package)

본격적인 선형대수 계산 (예를 들면 각종 decomposition(factorization) - SVD, eigenvalue/vector)을 위한 함수 모음집 되겠다.

이것들도 사실 회사의 본격적인 매출과는 상관없는 순수 R&D를 통해 개발되어야 하는 것들이라 돈 좀 있는 회사들은 closed source로 유상으로 제공하기도 하고 (대표적으로 intel MKL, ...) 오픈소스로 보급이 되기도 한다. 

대개 이들의 성능비교는 matrix의 크기를 증가시켜가면서 얼마나 많은 연산을 동시에 수행할 수 있는지를 측정하는 것으로 한다. 그러니까 얼마나 병렬화가 가능하냐 하지 않느냐를 보는 것이다. 따라서, 아주 간단한 행렬 연산이라도 for loop를 돌려서 연산을 시켜놓으면 한번에 element 한개에 대한 연산밖에 못하는데, 이걸 병렬화시켜서 뭐 이를테면 core 개수를 가져와서 그 core 개수만큼 병렬화가 가능한 것들은 그렇게 시켜놓고, 또 core 별로 SIMD 명령어 (MMX라느니 AVX2, SSE2 등등으로 명명되어있다)를 쓸 수 있으면 써서 최대한 벌려놓으면 좋은 성능을 내는 라이브러리로 평가받는 것이다. 

fortran/C 컴파일러가 이런 일을 대신해주진 않는다. CPU에 따라서 SIMD 명령을 더 사용하게끔 컴파일을 해주긴 하지만 일부러 thread를 늘려서 처리하게 해준다거나 하는 일은 하지 않는다. 일부러 그렇게 만들어주어야 한다. 이를테면 처리해야할 데이터의 양이 몇 개의 core로 처리해야 최적인지 예측해보고 그 결과에 맞춰서 thread를 벌려서 처리하게 하고, 나중에 결과를 종합하는 작업까지 해주게 해야 한다. 따라서, 컴파일러도 우수해야 하고 SIMD/multithread 노가다를 잘 해놨다면 좋은 성능이 나오고 아니면 아닐 것이란 게 그냥 딱 보이지 않는가?

