---
layout: post
image: /assets/images/ff31ba1b02d60ee0af63972ae4d7c470.jpg
title: "Bilinear Transform"
---

아날로그 필터를 디지털 필터로 옮겨오는 것 중에 가장 쓸만한 방법이 Bilinear transform이다. 
그러니까, 원래의 아날로그 필터를 가장 수식적으로 근사하게 가져오면서도 실제로 implement했을 때 복잡도도 가장 낮으면서도 원래의 아날로그 필터 특성을 잘 살릴 수 있는 방법이란 말이지.
그런데, 이것은 ![image](/assets/images/ff31ba1b02d60ee0af63972ae4d7c470.jpg) 로 놓고 풀어야 될 식을 근사해서 ![image](7958ac1f3678455f04756a34d85b715c.jpg) 로 만들어놨단 말이다. 자세한 근사식은 알아서 계산하시면 되고..
어쨋거나 이 근사식 때문에 아날로그 필터를 디지털 도메인으로 옮겨오는데 다소 오차가 있다는 말이다.
그러나 어차피 귀로 들을 거라면 구분 쉽지 않으므로 패쓰!

