---
title: "Hyperthreading"
tags: [cpu, hyperthreading]
---

Intel에서 Hyperthreading이 가능한 processor가 처음 나왔을 때를 기억하면 동일한 시간에 처리할 수 있는 일의 양이 2배가 된다로 막연히 생각했던 것 같다. 그러니까 물리적인 코어 개수가 1개이지만 마치 2개가 된 것처럼 돌릴 수 있다고 말이다. 그도 그렇것이 OS 상에서도 물리적인 코어의 수를 N개라고 하면 성능을 크게 해치지 않는 수준에서 thread는 2N개를 늘릴 수 있도록 해놨다. 무슨 말이냐면 16개 core를 쓸 수 있는 CPU에서 thread를 32개를 벌려놓으면 개개의 thread가 100%의 CPU occupancy를 보인다는 것이다. 이보다 더 많은 thread를 벌리면 모든 thread의 CPU 점유율이 100%아래로 떨어지게 된다.

Hyperthreading이라는 말의 의미를 잘 살펴보자면 die size를 크게 늘리지 않는 연산장치들을 2배로 늘려서 마치 물리적인 core가 2개인 것처럼 하겠다는 것이다. 다시 말해 memory처럼 die size를 크게 늘리는 자원들은 2개의 pipeline이 서로 공유하고 연산기처럼 크기가 크지 않은 것을 2계통으로 만들어서 compiler의 최적화 능력에 기대보자는 것이다. 당연히 두 개의 파이프라인이 서로 공유하는 자원이 쫑이 나지 않게끔 잘 스케줄링하는 것은 컴파일러의 능력에 달려있다. 그러나, 일반적인 경우 FPU 같은 것들은 core당 1개씩 있기 때문에 hyperthreading을 하더라도 2개의 처리기가 공유해버리기 때문에 처리 속도가 별로 늘어나지 않는다. 신기하게도 OS에서는 어떻게든 이 2계통이 서로 다른 thread에 의해 사용 중에 있다면, 그리고 FPU가 2개의 thread에 의해서 공유되고 있다고 하더라도, CPU 사용률을 100%로 표기한다. 사용자는 여기에 쉽게 속게 된다. 16 core인데 개개의 thread가 모두 FPU를 쓰고 있다고 하면 16개 이상의 thread를 벌리면 성능에 손해를 입게 되지만 OS 상에서는 32개의 thread를 올려도 문제가 없는 것처럼 표기 되니까 속게 된단 거다. 16 core라면 아무리 hyperthreading이 된다고 하더라도 FPU를 쓰는 연산이 많다면 16개 thread를 벌릴 때 가장 효율이 높다. 어거지로 32개 thread를 벌려놓더라도 성능의 이점은 발견하기 어렵다.

반면 정수연산만 시킨다고 하면 얘기는 달라진다. hyperthreading이 적용된 processor에서는 정수연산처리기를 core당 2개 가지고 있는 것이기 때문에 분명히 성능상의 이득이 커진다. 

FPU는 언제 쓰냐고? double/single precision floating point 연산을 하게 되는 경우에 쓴다. double/float 따위 아예 못 쓰게 해버리면 되는 거다.