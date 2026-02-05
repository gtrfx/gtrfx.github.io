---
title: "CUDA card vs Apple Silicon..."
tags: [study]
layout: post
author: "Keith"
---

CUDA card는 얼마나 빠를까 싶어서 RTX5070ti를 구입해서 가지고 놀고 있다.

간단한 코드를 가지고 m4 mac mini 대비 성능 비교를 해보면

(5000,5000) 난수 발생 시키기 100번 반복:

------
7950x + CUDA (RTX5070ti, pytorch: cuda)

CPU Time: 65801.54 us      
GPU Time: 125.37 us

------
M4 mac mini (pytorch: mps)

CPU Time: 162527.00 us    
GPU Time: 53.12 us

------

이해하긴 어렵지만 이런 결과가 나왔다.

layer 6개짜리 transformer에 21k짜리 텍스트 학습.

60 iterations:

-----
M4 mac mini (mps): 75 sec     
RTX5070ti:  8.5 sec

------

layer 12개짜리 transformer에 21k짜리 텍스트 학습.

60 iterations:

-----
M4 mac mini (mps): 106 sec     
RTX5070ti:  13.7 sec

------

Apple silicon의 GPU의 개수만큼 성능이 linear하게 증가하게 되는지 알 수 없으나 그렇다고 하면
CUDA card의 설치 번거로움이나 시스템의 벌키함 이런 걸 따져보면 그냥 mac studio를 장만하는 것도 나쁘지 않은 선택이라고 본다.

위 결과는 mlx가 아니라 mps로 돌린 결과라 mlx의 성능이 더 잘 나올 수도 있다는 것을 감안해야 한다. 대략 8-9배 정도의 차이가 나고 있는데, m4 max의 GPU 개수가 40개 (4배)인 걸 생각하면 이상적으로 따져봐도 대략 2-2.5배 정도 시간 차이가 날 것으로 예상된다.

큰 모델을 돌려야 되는 경우 5090을 선택해야 하는데, 5090의 가격은 이미 m4 max의 중간 정도 옵션을 넘어선지 오래다. m4 max mac studio로 128GB 정도 선택하면 시중에 돌고 있는 5090 장만하는 수준의 돈이 들어간다.

같은 일을 수행하더라도 5070ti은 굉음을 내는 반면 mac은 조용하다. 가격/구입의 용이함 때문에 어쩔 수 없이 5070ti라도 두개를 달아서 하는 방법도 있긴 한데, 이 역시도 전력 소모를 생각하면 엄청난 낭비다.

m4 max mac studio에서 binned version이 아닌 GPU 40개가 붙어있는 것은 대략 2,500불에 구할 수 있다. 관세 전쟁 때문에 어떻게 가격이 바뀔지는 모르지만.

여전히 좀 애매하긴 한데, GPU를 과하게 써야 하는 상황이면 임대해서 사용하는 게 답이고 그게 아니면 (게임을 하지 않는다면) 5070ti도 좀 과하지 않나 싶다. 5090은 말할 것도 없고.