---
title: "Accurate Plate Follower C Model (3)"
---
# Accurate Plate Follower C Model (3)


이번 포스팅에서는 지금까지의 포스팅에서 빼먹은 내용을 골라 채워넣기를 해봐야 할 것 같다.




1) 미방 풀기




미방을 time series로 근사하는데는 여러 가지 방법이 있는데, 그 중에서 다음에 대해서만 얘기하기로 한다.




- Forward/Backward Euler Method




I=C dV/dt의 꼴에서 미분텀을 sampling interval동안의 변화율로 대체하는 방법이다. 가장 간단한 (그러나 오차가 가장 큰) 방법이다. 결과만 적어보면







 (Forward Euler Method)







 (Backward Euler Method)




즉, 적분을 어떤 값으로 취하느냐에 따라 Forward/Backward로 나눠진다.




- Trapezoidal Rule




I=C dV/dt의 꼴에서 양변을 시간에 대해 적분하더라도 등호가 성립되는데, 적분을 사다리꼴의 면적으로 대체하는 방법이다. 이 방법은 Bilinear Transform과 일치한다. 일단 결과만 적는다 (해석은 쉽게 할 수 있다)







 (Ts: sampling interval)




- Runge Kutta (RK): 고차의 수치적분의 대표적인 방법인데, 수식이 길어서 생략한다.




2) C가 달라붙는 경우의 접근 방법




쉬어가는 페이지로 해를 찾는 방법에 대해서 얘기했다. C가 달라붙는 경우에 대해서도 얘기를 했고. C가 달라붙는 경우는 C의 특징, 즉 전압의 시간에 대한 미분값이 전류로 나타나기 때문에 하나의 미분 방정식으로 회로수식이 씌여지는 것 까지도 얘기했다. 여기서 이 미분방정식 수식을 일반적인 time series로 바꾸면 해석이 쉽게 끝난다. 이 때 미방을 적분으로 만들어 풀 때, 근사적인 방법을 사용하게 되는데, 대체적으로 다음과 같이 나눈다.




- 회로를 KCL/KVL로 풀면 미방이 얻어지는데 그것을 numerical integration(1)에 설명)으로 대체하는 방법

- 회로를 Laplace domain에서 해석한 뒤에 그것을 bilinear transform하는 방법




충분히 높은 sample rate로 진행한다고 보면 first order numerical integration (Euler method)로 하더라도 큰 문제는 없다. 




3) Parasitic Cap의 해석




Parasitic Cap과 다른 여타의 cap이 같이 붙어있는 경우를 분석하려면 쉽게 식이 쪼개지지 않는다. 수식의 중심을 Vpk, Vgk를 계산하는데 두고 있기 때문이다. 중심을 조금 옮겨서 Cap의 양단간 voltage를 먼저 계산하고 그것을 Vpk, Vgk로 가져가는 식으로 끌고가면 생각보다 간편하게 해결 된다.





