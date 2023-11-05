---
layout: post
title: "Plate Follower Modeling: Load capacitance/Load Resistor"
author: "Keith"
---


일반적으로 common cathode model에서 load capacitance/load resistor에 의한 증폭률 및 HPF의 cut-off freq를 계산하는데,




대부분의 기타앰프에서 이 cut-off freq가 매우 작다. 




그 이유는




1) load resistor가 매우 크다.

2) dc blocking cap의 값은 작다.




즉, dc만 blocking할 뿐 대부분의 주파수 성분을 다음 단으로 고스란히 가져온다. 




오히려, cathode에 붙여놓은 cap과 resistor 때문에 발생하는 HPF가 cut off freq가 높다 (유효함).




cathode의 ac bypass를 위해서 붙여놓은 cap의 용량은 꽤 큼, 그러나 cathode resistor가 대부분 크지 않음 (DC bias 때문에). 




Load resistor의 1/100수준이므로 cathode cap이 크더라도 상대적으로 cut off freq가 높히 잡힘. 




이게 좀 중요한 이유는 하이게인 앰프에서 저음이 다음 단으로 많이 전달되면 엄청나게 뭉개져서 제대로 시뮬레이션이 되지 않기 때문임.








