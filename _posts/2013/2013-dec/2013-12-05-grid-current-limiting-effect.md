---
layout: post
title: "Grid Current Limiting Effect"
author: "Keith"
---


이미 Triode에 대해서 언급한 바대로 대부분의 전류는 캐소드와 플레이트 사이를 흐르고 그 원인은 뜨거워진 캐소드에서 튀어나온 전자가 캐소드와 플레이트간의 큰 전압차로 인해 발생하는 전기장 (Electric Field)때문이라고 얘기했다. 여기에 망(Grid)처럼 생긴 전극하나를 더 넣어서 전자의 흐름을 제어할 수 있게 만든 것이 Triode 삼극관이라고 했다.




삼극관 회로의 가장 흔한 유형을 Common cathode (증폭단의 입력/출력이 모두 cathode 전극을 공통으로 함) 혹은 plate follower (plate 단자에서 따온 전압을 출력으로 한다) 라고 했다. 이 회로는 캐소드 전극의 전압과 그리드 전극의 전압을 적정 조건으로 맞추면 (바이어스 하면) 정해진 양의 전류가 플레이트와 캐소드간에 흐르게 되는 것을 이용해서 입력 그리드 전극의 전압 변화를 플레이트-캐소드간의 전류변화를 이용하여 그 결과를 플레이트 저항에 나타나도록 하는 방법으로 증폭을하게 된다.




기타 앰프에서 이용하는 삼극관의 성질은 크게 2가지라고 볼 수 있다.




1) cut off

2) grid current limiting




1)의 cut-off은 그리드 단으로 입력되는 전압이 너무 낮아서 플레이트와 캐소드간의 전류가 거의 흐르지 않게 되는 경우를 말한다. 입력신호는 이 수준에서 클리핑되는데, 거의 하드 클리핑된다고 보면 된다.




2)의 grid current limiting은 그리드-캐소드간 전압이 0볼트를 넘어가게 되면 캐소드의 전자가 그리드로 끌려들어가 전류가 흘러버리는 상태가 되어 그리드 전압 자체가 더 올라가지 못하는 현상을 말한다. 즉 입력 단의 전압이 올라가면 그것을 증폭소자가 반영하여 증폭해야 하는데, 입력단의 전압이 올라가는 만큼 전류가 흘러들어가게 되어 올라간 전압분이 그리드 저항에 나타나버리는 현상을 말한다. 이것은 대략 그리드 전압에 비례하여 증가한다고 보고 있고 입력 전압 증가분에 비하여 그리드 저항이 클 수록 더 느리게 증가하는 특징이 있어서 일종의 soft clipper효과를 가지고 있다고 본다.




기타 앰프는 이 두 가지 효과를 이용하여 찌그러짐을 얻는데, 대개의 증폭단이 바이어스 전압을 -2볼트 정도에 맞춰두고 있어서 클리핑은 -4볼트 이상에서 발생하고 grid limiting current에 의한 grid distortion은 0볼트 근처가 되므로 사실상 클리핑과 입력단 디스토션이 반반 일어난다고 볼 수 있다. (그것을 고려하여 바이어스를 -2 볼트 근방에 맞춘 것이다).




Soldano의 SLO 회로가 나오기 전까진 대부분 파형의 +/-부분이 비슷하게 증폭되어 찌그러짐을 얻었다고 보면, 이 회로가 나온 뒤에는 3번째 증폭단에서 그리드 바이어스를 hard clipping이 일어나기 직전의 -4 볼트 정도에 가져다 두어 엄청난 찌그러짐을 얻는 방법을 이용하게 되었다. 바로 그 다음단에서는 grid 저항을 큰 값으로 두어서 앞단에서 찌그러뜨리지 못한 나머지 파형을 grid current limiting 효과를 이용하여 크게 찌그러뜨린다. 마크씨리즈를 제외한 대부분의 하이게인 앰프는 저항값하나 바꾸지 않고 이 2개의 증폭단을 그대로 채용하고 있다. 따라서 사운드의 뉘앙스가 거의 같다.











