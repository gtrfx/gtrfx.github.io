---
title: "mpi사용시 load balance에 대하여"
tags: [mpi, load balance]
image: https://www.biorxiv.org/content/biorxiv/early/2018/10/11/440701/F1.large.jpg
layout: post
---

mpi를 사용하여 많은 개수의 장비를 이용해서 뽕을 뽑으려면 load balance를 해주는 것이 유리하다. 그것도 dynamic하게 말이다.

그런데 어떻게? 하는 의문이 생긴다.

가장 쉬운 방법은 처리해야 할 일을 100이라고 할 때, 그것을 모든 task들의 common variable로 놓고 각각의 task들에서 일을 마칠 때 마다 한 개씩 수를 감소시켜 0에 이르렀을 때 모든 프로세스를 종료하는 것이다. 결과적으로 일을 잘하는 머신/프로세서에서는 더 많은 일을 수행하게 되고 그렇지 못한 머신/프로세서에서는 상대적으로 작은 양의 일을 수행하게 되니까 실질적인 load balance가 이루어졌다고 할 수 있다. 일을 못하는 머신들도 그들이 할 수 있는 최대한의 기여를 할 수 있게 되는 것이다.

그런데 이것을 가능하게 하려면 일의 단위를 매우 잘게 쪼개놓아야 하고 그 잘게 쪼개놓은 작업들이 끝날 때마다 관리 프로세스에 작업이 완료되었음을 알려주어야 하기 때문에 네트워크를 이용한 데이터 소통량이 증가하게 되고 모든 작업은 계속해서 작업 중단 신호가 떴는지 아닌지 확인해야만한다. 그러나 이보다 더 나은 방법은 없다 실제로.
