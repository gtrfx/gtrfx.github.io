---
title: "안드로이드 폰으로 스테레오 레코딩 하기.."
tags: [stereo recording]
---

이 무슨 엉뚱한 이야기를 하고 있느냐 할 것 같은데, 안드로이드 폰이 스테레오 오디오를 다룰 수 있고 OS에서 stereo audio가 기본인데 무슨 말을 하는 것이냐 할 것 같지만, 신기하게도 playback sound는 stereo로 설정되어있는 반면 recoding으로 일반적으로 허용되는 것은 mono가 기본이라 stereo로 하려면 별도의 작업을 해주어야 한다. 

왜? 폰에 달려있는 마이크가 일반적으로 mono이고 전화통화라든가 네트워크 보이스 채팅도 대부분 mono로 되고 있기 때문에 이것이 일반적인 것이 되지 않았나 싶다.

따라서 일부러 stereo recording을 하겠다면 USB OTG를 이용해서 외장 USB interface를 쓰거나 아예 USB 연결이 가능하도록 되어있는 (스테레오) 마이크를 쓰거나 해야한다. 또 일반 audio recorder를 쓰면 mono로만 녹음이 되기 때문에 stereo recording이 가능한 app을 찾아야 한다.

대부분의 비디오 레코더도 mono audio input에 맞춰져있다. 일부러 stereo recording을 하겠다면 이것을 가능하게 해주는 레코더를 찾아야 한다. open camera의 일부 옵션이 이것을 지원하는데, 문제는 '안된다' 라는 것이다. 

stereo USB audio interface를 OTG로 연결하고 open camera에서 외장 audio (mic)를 설정하고 audio channel을 stereo로 설정하면 recording을 제대로 완료할 수가 없다. 대부분 stereo audio recording은 잘 되더라도 video recording에서 문제가 생긴다.

너무 고민하지 말고 단념하자. 시간을 쓸데없이 허비한 경험자의 조언이다.
