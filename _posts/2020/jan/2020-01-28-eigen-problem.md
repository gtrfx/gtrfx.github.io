---
title: "Eigen problem"
tags: [eigen problem, hobby]
layout: post
---

선형대수 좀 배울라치면 이 eigenvalue를 뜬금없이 나타나서 뭐하는지도 모르고 무작정 문제를 풀어댔던 것 같은데, 그것은 아마도 가르치는 사람도 전혀 아는 바가 없었기 (교과서와 참고서에서도 뭐해쓰는지 전혀 얘기가 없으니까)에 그랬지 싶다. 공대를 다녔으니까 학부과정에 들어와서도 꽤 여러 번 마주쳤는데 그럴 때마다 이게 나름 쓰이는 곳이 많구나 하는 정도로 몇 개의 연관분야가 나타난다. 회로 분석할 때도 나오고 선형 제어를 할 때도 나오고 한다. 행렬 연산을 미방 풀이에 응용하다보니 두 개가 겹쳐 나타나는 것이다.

조금 더 학교를 오래 다니니 센서를 여러 개 붙였을 신호를 처리하는 것을 배우게 되었다. 레이더를 만들 때 쓰던 기술인데 그게 생각보다도 응용분야가 넓어져서 통신 시스템까지 연결이 되고, 지금은 5G에서 본격적으로 안테나 어레이를 쓰게 되었다는데, 받아서 분석해야 하는 신호의 성질도 다르고 응용 방법도 다르니까 마구 마구 갖다붙이긴 뭐하지만 여기서 제법 큰 행렬을 다루게 되고 eigenvalue가 뭘 의미하는지 사실 좀 따져보게 된다.

뭐냐고? 사람이 미지의 신호를 분석하는 방법은 생각보다 그리 다양하지 않다. 양도 많고 계산하기도 복잡하고 하니까. 대개 할 수 있는 것이 2차 통계를 뽑는 정도다. 2차 통계가 뭐냐고? 2차 통계라는 것은 쉽게 말해서 분산 (평균과 분산 할 때 그 분산 말이다)을 떠올리면 된다. 분산을 구할 때 제곱(^2) 계산을 하는데, 그래서 2차 통계라는 말을 쓰는 것이다. 들어오는 신호의 입구가 많아지면 이 2차 통계도 개개 별로 따지기도 하고 교차해서 따지기도 한다. 센서가 10개면 각각의 센서에 대해서 분산을 구하고 센서마다 교차해서 곱을 취해서 보는 정도를 한다 (이걸 분산이라고 하지 않고 특별히 공분산이라고 한다).

2차 통계를 관찰할 때 그렇게 공분산을 계산해놓으면 NxN 행렬이 되고 이것을 eigen value/vector로 구분해버리면 신호의 성질을 대충 규명해볼 수 있다. 그냥 아주 간단하게 우리 귀(2개의 센서로 구성)를 생각해보면 양쪽 귀로 들어오는 소리가 연관성이 아주 높으면 우리는 이 소리를 mono라고 하게 되는데 이때 공분산의 eigenvalue를 계산하면 유의미한 값 한개와 0을 얻게 된다. 대충 개념이 올 듯 하다. 같은 소리인데 양쪽 귀로 들어오는 크기가 다를 수도 있고 위상차(미세한 시간차) 혹은 긴 시간차가 있을 수 있는데, 모두 다 그렇게 해석이 된다. 쓸만한 분석 방법이란 생각이 들 것이다. (말이 잠깐 새는데 우리가 이 신호를 강제로 스테레오로 만들어주려면 위상차를 고정적으로 가져가지 않고 시간에 따라 빠르게 변화시키는 방법을 택한다. 그래서 귀가 속아 넘어가게 한다.)

컴퓨터로 eigen value룰 계산하는 것은 예전부터 중요한 문제였던 것 같다. 사실 레이더로 들어오는 신호를 분석하는 일인데 돈이 좀 많이 들어갔을까 하는 생각을 하게 된다. 무기 산업이란 게 돈이 엄청나게 들어가고 벌리고 하는 것이니까 그랬지 싶은데, 수학자만 갈궈서 될 일도 아니고 여러 분야를 골고루 갈궈야 되는 것이니 그렇게 해서 미국에서 이런 분야를 전부 다 잘 하게 될 수 밖에 없었겠구나 하게 된다. 들어가는 돈이 워낙 많았을테니까 삥땅치는 이들이 있었어도 발전은 되었을 듯 싶다. 우리나라처럼 얼마 안되는 연구비를 일부 학교를 뺀 나머지 모든 대학이 비슷한 비율로 가져가는 시스템에서는 책임자 혼자 슈킹하기에도 부족했겠지 싶고. 그래서 차라리 몰아주라고 하는지도 모르겠다. 나머지 학교에서는 학생들이 울며겨자먹기로 다들 자비로 공부하게 될테니 애매하게 자비로 공부하러 학교가서 앵벌이짓 할 일도 없었겠지 싶다. 

본론으로 돌아와서 이걸 어떻게 계산하는지 호기심이 발동해서 열심히 찾아본 결과 믿을 만한 결과는 오직 LAPACK 뿐이었고 나머지는 대개 LAPACK의 fortran interface를 다른 언어와 연결해주는 정도였다. python의 module도 이걸 이용하고 있고 it++이란 라이브러리도 그렇고 octave 같은 것은 말 할 필요도 없고 말이다. MATLAB는 알 수 없는데 MATLAB에서 LAPACK이나 BLAS의 낱개 함수들을 제공하지 않는 걸 보면 (일부러 그런 것인지는 모르겠지만) 자체적으로 뭔가를 가지고 있는 듯 하다.

eig를 풀어내는데 여러 가지 방법이 있다고 되어있긴 하는데, 공분산을 분해하려는 게 목표인 경우, 또 복소수 신호를 다룬다고 보면 hermitian matrix를 분해하는 문제로 좁혀지고 LAPACK에서 보여지는 해법은 일반 Hermitian matrix를 tridiagonal matrix로 줄여놓고 (줄여놓는다는 게 0 아닌 element의 개수를 줄이는 것이다) 거기서 부분부분 QR(gram-schmidt)을 해서 eigen vector와 eigen value를 모두 얻어내는 것이다. 

이게 LAPACK에서 보면 zheev로 시작해서 zhetrd, zungtr/zungrq/... 이런 식으로 간다. 포트란으로 작성된 CPU의 마이크로 코드 같다. 각각의 함수 이름은 CPU instruction에 해당한다고 볼 정도로 참으로 잘게 쪼개져있다. 

왜 이렇게 하느냐? 이게 컴퓨터에게 시켜도 가장 빠르기 때문이다. 이걸 이제 다음 단계로 발전시키는 것을 생각해보려한다.