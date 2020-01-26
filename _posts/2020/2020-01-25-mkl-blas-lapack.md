---
title: "MKL vs. BLAS vs. LAPACK"
layout: post
tags: [mkl, blas, lapack]
---

아마도 Octave라든가 scientific library 같은 것들을 build해 본적이 있다면 잘 알만한 용어(?)들이다.

1) MKL (Math Kernel Library)

이것은 일반적인 수학계산을 하는 함수들의 라이브러리다. 이거 원래 기본 라이브러리에 포함된 거 아니냐 할 수 있는데, 그렇기도 하지만 최적화된 것을 별도로 만들어놓고 무상으로 혹은 유상으로 제공하고 있다. BLAS/LAPACK도 이 안에 포함되어있다고 보면 된다. 

2) BLAS (Basic Linear Algebra Subprogram)

이것은 선형대수 (벡터/행렬연산)를 위한 아주 기본적인 함수들의 집합이 되겠다. 별 것 없을 것 같지만 제법 내용이 많다. 

3) LAPACK (Linear Algebra Package)

본격적인 선형대수 계산 (각종 decomposition(factorization) - SVD, eigenvalue/vector)을 위한 함수 모음집 되겠다.

이것들도 사실 회사의 본격적인 매출과는 상관없는 순수 R&D를 통해 개발되어야 하는 것들이라 돈 좀 있는 회사들은 closed source로 유상으로 제공하기도 하고 (대표적으로 intel MKL, ...) 오픈소스로 보급이 되기도 한다. 

그런데, 딱 보면 컴파일러가 아주 우수하다든가 누가 핸드메이드 코드 (그러니까 SIMD instruction들 찾아서 잘 매칭시켜주는) 노가다를 잘 해놨다면 좋은 성능이 나오고 아니면 아닐 것이란 게 그냥 딱 보이지 않는가?

예전에 빌드해본 사람은 알겠지만 BLAS나 LAPACK 같은 것들 컴파일하려고 보면 gfortran 같은 걸 불러내서 계산하고 있는 것을 보게 될 것이다. 도대체 FORTRAN이란 게 어느 시절 언어인가 싶지만 gcobol? 은 구경하기 어렵지만 gfortran은 그 흔한 gcc build에 보면 따라오는 것을 아주 흔히 볼 수 있으니까 신기한 일이 아닐 수 없다.

HPC 세계에서 MKL/BLAS/LAPACK은 기본적으로 floating point 연산을 하는 것으로 되어있으니 그렇게 한다지만 사실 들여다보면 최적화를 위하여 다양한 type에 대한 function이 모두 따로 존재한다. 이를테면 integer 따로 4 byte float, 8 byte floating point용 함수들이 모두 따로 존재하는 것이다. 실제로 CPU instruction들도 별개로 존재하니까 그럴 법하다만.

내가 아는 상식으로는 integer로 계산하는 것이 floating point 대비 훨씬 빠를 것으로 보이는데, 정말로 아이러니하게도 8 byte floating point number로 계산하는 것이 가장 빠른 결과를 내는 경우도 있다. 4 byte float, 4 byte integer 보다도 빨리. 그러니까 라이브러리/컴파일러/CPU가 한통속이 되어 8byte를 밀어주고 있는 것 아닐까 하는 생각까지 든다. 

혹시 궁금하면 시도해봐라. 내 말이 틀린지 아닌지 그냥 바로 보게 될 것이다. 

물론 gate 수를 아껴야 돈을 버는 산업계에서 floating point 연산은 (좀 럭져리한) DSP 안에나 있는 것일 뿐이다. 왜? integer로 계산하는 게 당연히 게이트/메모리/속도/소비전력 등등에서 당연히 빠르기 때문이지. integer라고 하면 이해가 안되고 finite precision 혹은 fixed point라고 해야 이해가 되는 사람도 있을테니 integer와 같은 의미로 써놓은 것이라 이해하기 바란다. 

반론 있다면 댓글 달아보셔!!