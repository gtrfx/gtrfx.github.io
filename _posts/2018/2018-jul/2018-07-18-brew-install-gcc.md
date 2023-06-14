---
layout: post
title: "brew install gcc..."
tags: [gcc, g++, brew, MacOS, openmp]
categories:
    - computer
author: "Keith"
---

i5 랩탑에서 brew install gcc 하면 대략 200분이 넘는 시간동안 컴파일한다. 

결과물로 컴파일해보니 clang+LLVM보다 거의 2배 빠르다. 나름 보람이 있다. openmp도 지원한다. 4개 thread를 벌일 수 있는 PC에서 openmp를 돌리니 고작 2배 밖에 빨라지지 않는다. 그래도 빨라진다는 게 어딘가?

귀찮게 thread 개수 구해서 그만큼 fork하고 그만큼 loop를 unroll하고 결과 모아다가 더하고 할 필요가 없다. 자기가 알아서 해준다. 물론 코드 몇 줄 넣어서 남아도는 load만큼 process 벌려서 multithread하는 것보단 효율이 떨어지지만 openmp로는 내가 해야할 일이 거의 없다.

clang+LLVM은 뭐하는 놈인가? 원래의 clang이 지원하는 openmp도 Xcode에 따라오는 clang으로는 안된다. 

Xcode는 Eclipse와 달라서 컴파일러를 임의로 조정하기 쉽지 않다. 이래 저래 복잡해진다. 

processor가 좀 많으면 openmp는 쓸만한 가치가 있어보인다.

gcc도 버전이 낮은 것이 문제인지 오히려 openmp를 활성화하면 속도가 절반으로 떨어진다. 16 core짜리에서 돌렸는데 이 지경이라 별 수 없이 gcc-8.1.0 로컬 빌드 중이다.

그래도 얼마나 좋은 세상인가?? mpich 돌리고 골치 아플 일 없으니. 적어도 core가 30개가 넘어가면 구태여 귀찮게 mpich를 돌려야 할 이유는 없다. 물론 동일한 성능의 이런 장비가 수십대가 있다면 그 장비들을 괜히 놀리느니 mpich를 쓰는 것도 의미가 있다. 그런데 core간 성능도 들쭉 날쭉 하고 많은 사람들이 서로 다른 job을 벌여야 된다면 SGE 이런 것도 다 귀찮고 간단하게 openmp만 써도 노성비 (노동량 대 성능비)가 월등하다고 본다.

아..mpich로 30대 grid를 굴리던 게 10년도 더 된 일이라니, 그 때 그 장비들 다 어디갔을까 궁금하다. Xeon dual processor 였지만 프로세서당 4개의 thread를 벌일 수 있고 (지금 i5 수준이었다 생각해보니), dual processor 였으니까 대당 8개의 thread를 벌였으니까 통 240개 process를 벌이면 나름 좋은 결과를 얻었던 기억인데 지금은 어딘가에서 폐기 시점을 바라보는 애물단지가 되어버린 것 아닌가 하는 생각도 들고. 

요약하면..

빠른 실행을 원한다..싶으면..

- g++ 8.1을 빌드해서 써라..
- 더 빠르게 하고 싶으면 openmp..
- 더 속도를 내고 싶으면 system load를 체크해서 thread수를 조정하는 multithreading 해라.. (pthread)
- 더 속도를 내고 싶다면 mpi


