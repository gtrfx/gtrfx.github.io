---
layout: post
title: "i7 8700 H.265 transcoding"
tags: [h.265]
author: "Keith"
---

거의 한달 동안 테스트 해본 것 같은데, 결론은 이렇다.

1) 4k H.264를 H.265로 transcoding할 때 20fps/s 정도의 속도가 나온다. FHD면 대략 80 fps 정도 나오는 것으로 보여진다.
2) 이 때 processing element는 2-3개 정도를 쓴다 (12개 중에서).

Quicksync에 어느 정도 load가 걸리는지는 performance meter에서 나타나지 않으니 알 수 없지만 이것을 100%로 가동했다고 보고 2-3개 정도의 thread는 quicksync에서 하지 않는 트랜스코딩과 관련된 나머지 연산들을 수행하는 것이 아닐까 추정된다.

X265를 돌려볼 수도 있는데 속도가 대략 절반으로 떨어진다. 시스템 부하는 80% 가까이 치솟는 것 같다. 확실히 quicksync가 있는데 x265를 쓸 이유는 없는 것 같다. 최적화를 더 잘해놨다고 하는데 bit rate를 좀 더 쓰면 그 정도는 충분히 커버된다. 어차피 H.265까지 써서 압축을 하겠다는 마당에 data rate 좀 더 쓰는 게 대수인가?

모니터로 보면 트랜스코딩의 결과물이 그다지 썩 좋아보이진 않는데 (data rate가 낮아서) 4k TV로 보면 멀쩡하게 나온다는 것도 좀 신기한 일이다. 

FHD의 경우 못해도 5Mbps 정도는 되어야 봐줄만 한 것 같다. 그 아래는 3Mbps 정도는 되어줘야 할 것 같고. 

그 기준으로 보면 4k 10분짜리를 8Mbps로 인코딩했다고 보면 600 x 1MBps가 되니까 대략 600 MB 쯤 나오게 된다. FHD는 절반정도로 잡아주면 300 MB. 화질은 그냥 눈으로 봤을 때 크게 거슬리는 것이 없는 정도의 수준이라고 보면 된다. 

대략 인터넷에 돌아다니는 미디어들이 대략 1280 x 720p이고 1시간짜리 영화를 1.5GB 정도로 본다고 치면 대략 4-500 kBps (2.4-4Mbps)로 놨다고 볼 수 있으니까 티비에 놓고 보면 어색한 점을 찾기 어렵지만 모니터에서 보면 좀 어색한 수준의 화질이라고 보면 된다.

그것만 봐도 내용이 중요하지 화질은 적당히 손해봐도 그만이라고 본다. 
