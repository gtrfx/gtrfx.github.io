---
title: "Carvin V3 Amplifier"
---
# Carvin V3 Amplifier

![image](63d87de6b43ce6a7a1c18d480153f894.jpg)

Carvin V3 100W amplifier head이다. 가격이 $899로 3채널 100W 앰프 헤드치고는 상당히 매력적인 가격이다. 

Carvin에서 기타와 앰프 말고도 pro-audio도 만들고 있는 이유 때문인지 메뉴얼을 읽어보면 옛날 앰프 회로도를 단순 짜집기하는 수준의 기술로 먹고 사는 회사와는 질적으로 다른 것을 알 수 있다. 

사양을 보면 5개의 12AX7과 4개의 EL34를 쓰고 있다. 이 가격대에서 생각하기 힘든 MIDI가 지원됨 (채널 선택, effect loop1/2 on/off, boost on/off)을 또한 알 수 있다.

3개의 채널 중 2개는 드라이브용 채널이고 1개는 클린 채널로서 다른 3채널 앰프 헤드에 비해 큰 차이가 없음을 알 수 있다. 그러나, 각각의 채널에 몇 가지 기능을 추가하여 타사 앰프와의 차별화를 꾀하고 있다.

0) High Impedance Input

입력 임피던스가 보편적인 1 Meg ohm이 아닌 2.2 Meg Ohm이다. 일부 앰프의 회로를 보면 하울링을 막기 위해 입력단에 cap을 걸어주는 경우도 종종 있는데, 여기서는 전혀 사용하지 않고, 부품의 레이아웃을 통해 불필요한 oscillation을 막는다고 한다.

1) 1Meg Ohm Tone Stack

2 종류의 Tone Stack이 있는데 모두 1 Meg ohm짜리 pot을 사용한다고 한다. 여기에 맞추어 cap의 값도 다르게 설계한 모양이다. 

2) Drive Channel gain structure (intense/normal/thick)

gain pot을 지나 distortion stage로 넘어가는 신호의 증폭률과 EQ를 선택하여 드라이브 채널의 음색을 결정함

3) Clean Channel gain structure (bright/normal/soak)

1)과 마찬가지로 초단에서 다음 단으로 넘어가는 신호의 증폭률과 cap을 덧대는 부분을 switching하여 음색을 bright하게 혹은 gain을 더하여 빈티지한 디스토션을 얻을 수 있게 한다.

Effect loop는 parallel + serial의 2 종류로 구성된다. 또한 사용하는 출력관의 개수를 조정하여 출력을 100W/50W로 조정할 수도 있게 되어있다 (출력 트랜스포머도 그에 맞추어 설계되어있는지는 알 수 없다).

5개의 12AX7 중, 1개는 default로 class AB 출력단을 구성하기 위한 phase splitter로 쓰이고, 1개의 12AX7이 effect return을 담당하고, 0.5개의 12AX7이 effect send를 담당하므로, 음색을 결정짓는 순수한 프리앰프의 기능을 담당하는 12AX7은 2.5개이다.

2.5개의 12AX7으로 클린 채널과 하이게인 채널을 운영하려면 초단이 공유되는 것으로 보여진다. High gain일 때의 noise나 oscillation을 고려하면 첫번째 12AX7은 절반만 사용하게 되므로, 오버드라이브 채널에는 공히 3개의 증폭단, 클린채널에는 2개의 증폭단으로 구성된다는 계산이 나온다. 최근의 하이게인 앰프가 4개 이상의 증폭단을 쓰는 것을 감안하면 최종단을 cathod follower로 마감하지 않았다거나 effect send와 최종단을 공유하게 했다거나 하는 계산이 나온다.

여기에 이 엠프헤드는 스피커 시뮬레이터를 장착한 line out 단자도 제공한다. 이 line out은 출력단에서 얻어지는 결과를 가져다가 active filter를 구성해서 만들어 낸 것인지 아니면 preamp단에서 얻어온 것인지는 회로도가 있어야 알 수 있겠다. 하루 빨리 회로도를 구해봐야겠다.



