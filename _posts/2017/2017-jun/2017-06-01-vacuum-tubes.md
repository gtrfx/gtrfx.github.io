---
layout: post
title: "Vacuum Tubes"
author: "Keith"
---
# 진공관

진공관은 단자가 몇 개인가로 구분한다.

### 쉽게 이해하기

진공관은 열전자 방출 현상 - 뜨거워진 금속의 음극에서 전자가 튀어나오는 현상 - 을 이용한 소자이다. 오직 음극에서 전자가 탈출하기 때문에 전류의 흐름을 일정하게 할 수 있다. 즉, 다이오드로 이용이 되는 특징을 이용한 것이다. 여기에 음극에서 양극으로 이동하는 공간에 다른 전극을 집어넣으면 3극관 4극관 ... 이 되는 것이다. 다시 말해서 다이오드가 트랜지스터가 되고 하는 것이다. 

따라서, 극이 두 개 뿐인 2극관은 우리가 아는 diode와 같은 구실을 하고, 3극관부터는 사실상 transistor와 유사한데, 전류의 흐름을 결정하는 핀이 여기에 더 달라붙으면 4, 5극관이 된다. 

4/5극관에서 나머지 극을 묶어버리거나 고정된 전압으로 두게되면 사실 3극관과 다를 바가 없는데, 4/5극관은 전류를 많이 흘릴 수 있는 관에서 많이 보여지고 있어서 전력 증폭을 하는 데 많이 쓰인다고 이해하면 될 듯 하다. 

### transistor와 다른 점

트렌지스터와 다른 점을 꼽아 보라면 다음과 같다.

- 관 내부가 진공이다.

인간이 만들었기 때문에 완벽한 진공은 아니지만, 공기가 거의 없다. 공기가 거의 없어야 히터와 음극이 타버리지 않고 오래 쓸 수 있다. 

- 시동을 걸어주기 위해 예열을 해야 한다. 

그래서 진공관에는 히터 단자가 있다. 이것은 백열 전구를 생각하면 된다. 직류든 교류든 적정 수준의 전압을 걸어 전류를 흘려주어야만 증폭 혹은 정류 소자로서 동작을 한다. 금속이 열을 받아야 전자를 내뿜기 때문이다. 

- 높은 전압을 걸어주어야 한다.

높은 전압을 걸어주어야 열을 받아 금속으로부터 뛰쳐나온 전자가 이동을 한다. 높은 전압으로 이루어진 전기력이 작용한 공간을 전기장 (자기장 처럼 생각하면 됨)이라고 한다. 전자들이 -극에서 뛰쳐나와 +극으로 이동한다. 전압 차가 클 수록, 또 극과 극간의 거리가 짧을 수록 이동시키려는 힘이 커진다. 상식적으로 자석을 생각하면 쉽게 이해할 수 있다.

따라서, 진공관 회로에서는 높은 전압 (플레이트 전압이라고도 하고 B+라고도 부른다) 을 만들어주는 부분과 히터에 공급하는 전원을 만들어주는 부분이 항상 따라다닌다. 히터애 걸어주는 전압과 흐르는 전류는 진공관마다 다르다. B+는 직류이고 벽에서 들어오는 전압보다 높기 때문에 승압을 하고 정류를 하는 과정을 거친다. 정류 과정에 C가 들어가기 때문에 이 부분이 위험 요소가 된다. 즉, 고전압이 C에 충전되어있기 때문에 회로에 함부로 손을 대면 안된다.  

### 2극관 (Diode)

말 그대로 정류하는 용도로 쓰인다. 관의 모양은 크지만 흘릴 수 있는 전류의 크기는 - 전자를 금속에서 열받아 튀어나오게 만든 뒤에 진공속에서 이동시켜야 하기 때문에 - 얼마되지 못한다. 크기도 크고 부품 값도 턱없이 비싸고 히터도 달아야 되고 하는데도 이 물건을 쓰는 이유는 그 힘없는 특성을 이용하려 하기 때문이다. 전원으로 치면 출력 임피던스가 낮다는 의미인데, 그것은 이것을 전원으로 쓰는 회로에서 전류를 많이 끌어오려고 하면 공급 전압이 떨어지고 회로가 불안정해지는 그런 성질을 원할 때 이 물건을 쓴다. 

### 3극관 (Triode)

![triode](/assets/images/triode.png) ![triode](triode.jpg)

3극관은 transistor와 사실상 같은데, 차이점을 들라면 음극관(cathode)에서 양극관(plate)로 이동하는 전자의 흐름을 방해하는 전극(grid)로 흘러들어가는 전류의 양이 지극히 작다는 이점이 있다. 즉 grid 전극의 전압 변화로만 P->C로 흐르는 전류의 양을 제어할 수 있어서 입력 임피던스가 매우 큰 증폭기를 만들 수 있다. 이 얘기는 무슨 말이냐면 triode가 들어간 증폭기의 입력으로부터 거의 아무런 전류도 끌어오지 않아서 입력에 미치는 영향이 거의 없다는 장점이 있다는 밀이다. 

그러나, 진공관의 한계상 많은 전류를 흘릴 수 없고 전자가 도체가 아닌 진공속을 이동해가야 하기 때문에 전류를 빠르게 스위칭 할 수는 없다.

### 4극관/5극관 (Tetrode/Pentode)

![pentode](/assets/images/pentode.png)

3극관과의 차이점은 P->C로의 전류 흐름을 제어하는 grid 전극이 많다는 것이고 전류의 흐름을 많이 가져갈 수 있어서 전력 증폭에 용이하다는 이점이 있다. 
