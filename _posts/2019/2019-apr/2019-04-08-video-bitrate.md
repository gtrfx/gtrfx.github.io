---
layout: post
title: "Video의 bitrate와 화질"
tags: [video, bitrate, h.265]
author: "Keith"
---

Video의 bitrate가 낮을 수록 화질이 떨어지게 된다는 것은 잘 알고 있는 일인데, 정확히 얼마가 되면 어느 정도의 화질이 나온다에 대한 개념은 확실히 잘 없다. 또 흔히 잘못 알고 있는 것이 4k가 필요없으면 FHD로 촬영하는 게 좋다 (왜냐면 결과물이 작으니까)도 있고 4k라도 bitrate를 낮게 하면 좋다 (화질은 생각않고 결과물이 작으니까)라는 것이지 싶다.

촬영할 때는 기왕이면 highest bitrate로 하는 게 좋고 이것을 저장할 때 해상도를 낮추는 것이 더 좋은 결과물을 낸다. 즉, 4k에서 100Mbps로 촬영하고 그 결과물을 FHD로 하는 것이 FHD로 촬영하고 FHD로 bitrate를 줄여 저장하는 것보다 좋다.

기왕이면 H.265나 VP9으로 transcoding해서 저장하는 것이 좋은데 고속의 GPU 혹은 전용 encoding H/W가 없으면 별 수 없이 H.264로 저장할 수 밖에 없다.

대략 4k 30fps로 보면 25Mbps H.264이면 좋은 화질로 본다. 이 경우 1분이면 187MB 정도의 크기가 된다. 10분이면 1.87GB 정도 크기의 파일이 된다. H.265라고 보면 이보다 대략 절반 크기 (12Mbps)면 꼭 같진 못하더라도 유사한 수준의 화질을 얻을 수 있다.

FHD로 보면 30fps에 대략 10 Mbps 정도면 나쁘지 않은 화질을 얻을 수 있는 것으로 기대한다. 1분에 대략 75MB의 결과물이 나온다고 보면 된다. H.265로 보면 5-6Mbps면 대충 유사한 수준의 화질을 얻는다. 

인터넷에서 돌고 있는 영화들을 보면 지금도 H.264로 많이 인코딩되고 있고 1시간에 2GB정도의 크기를 갖으니까 환산해보면 대략 4.5 Mbps 정도로 encoding되었다고 보면 된다. FHD일 경우는 화질이 제법 저하되어있고 그 때문에 1280x720인 상태로 많이 유통된다. 1280x720보단 FHD H.265로 돌아다니는 것들이 화질이 훨씬 더 좋지만 인코딩의 부담 때문에 그렇진 못한 것 같다.


