---
title: "Back-to-Linux: 리눅스로 돌아오다"
layout: post
tags: [linux, docker, kvm]
---

이 위중한 코로나 시국에 나는 열심히 쓰던 MacOS를 버려두고 우분투로 왔다. 이제 3일 정도 지났지만 아직까진 매우 만족스럽다.

왜??

속도가 너무 빨라져서..

생각해보면 인생의 어느 시점 이후로는 빠른 컴퓨터를 가져야 한다라는 생각을 버린 듯 하다. 

어렸을 땐 늘 최신의 CPU로 되어있는 PC를 조립해서 사용했는데, 내 돈으로 컴퓨터를 구입하지 않게 된 시점 이후로는 관심을 두지 않았고, 그렇게 그렇게 내가 사용하는 컴퓨터가 최신의 그것과 거리를 제법 두고 있어도 상관없다 생각했었으니까.

작년에 맞춘 새로운 PC도 따지고 보면 발표된지 1년 반도 넘은 것을 가져다가 조립을 했으니까. 막상 조립을 하려고 견적을 찍어보면 절대적인 액수에 있어서도 어렸을 적 내가 사용하는 것들보다도 가격이 낮게 나온 것에 놀랐을 정도다. 그 시절 물가는 지금보다 훨씬 낮았으니까 그 당시로 치면 지금 사용하는 PC의 수준은 초보자들이나 (왜 초보자에게 사양이 낮은 PC를 주었는지는 이해할 수 없지만) 쓰는 수준의 가치도 없는 수준인데, 성능은 정말 이루 말할 수 없을 정도로 좋으니까 할 말이 없다.

그냥 단적인 비교로 예전 같으면 5-6시간을 걸어두고 시켜야 간신히 다 해낼 일을 지금은 앉은 자리에서 대략 5-6분이면 다 해낼 수 있을 정도다. 기계도 좋아졌지만 일을 시키는 사람 역시 이러한 세상에 빨리 적응을 했기 때문이기도 하지만.

리눅스의 KVM은 돈을 받고 파는 가상머신이 아니지만 그것들보다 훨씬 좋고 빠르고, 수 많은 리눅스의 변종을 돌릴 수 있게 해주는 docker는 native linux kernel위에서 돌 때 가장 빠르다. 물론 말하나 마나지만. 이것을 윈도우즈나 MacOS위에서 돌리려면 귀찮은 일들 뿐만 아니라 '느려터짐'에 익숙해져야 한다. 더구나 그것이 애플이 지원하지 않는 AMD CPU일 경우에는 훨씬 더 크다. 

그러나 Linux는 CPU를 차별하지 않는다. 비록 GUI 화면은 아주 세련되지 못하더라도 일을 하는 데 있어서 이렇게 안정적으로 잘 받쳐주는 OS는 세상에 또 없다. 쓸데 없는 화려함과 럭져리함을 추구하지 않으면 아주 검소하도고 조촐하게 그렇지만 아주 실속있게 내가 원하는 일을 끝마칠 수 있게 해준다. 

생각해보면 왜 내가 꼭 MacOS를 고집해야 했을까 하는 생각을 하게 된다. 

난 매일 같이 Final Cut이라든가 Logic을 쓰고 있지 않는데. 그저 GUI가 좋아보이니까 거기에 안주하고 있었을 뿐이다. 그렇지만 컴퓨터 본연의 일을 시키는 것에 있어서는 그다지 기민하지 못하다. 아주 간단히 사로 다른 OS 위에서 흔한 benchmark 앱을 돌려보면 다 나온다. 리눅스에서 가장 빠른 결과가 나온다. MacOS에서 가장 느린 결과를 보여준다. 그래도 다만 그것이 리눅스와 유사한 BSD라는 것에서 출발했기에 GUI보다 터미널에서 더 일을 빨리 끝마칠 수 있는 내 입장에선 더 좋았을 뿐이다.  또 (내가 평가하기에) 이 세상에서 가장 좋은 메일 클라이언트가 기본 앱으로 들어있기에 안주했던 것이다. 이 메일 클라이언트로는 답장을 매우 빨리 작성할 수 있을 뿐더러 파일들 드랍해서 보내기에도 좋고. 그림을 붙여서 보내기에도 아주 좋게 되어있다. 생각해보면 Mail.app의 역할이 대단했구나 깨닫게 된다. 

그렇지만 세상은 또 한번 변해서 platform independent한 작업환경을 web browser 상에서 제공해주고 있다. 메일에 문서를 떨궈 보낼 필요 없이 그냥 웹 브라우져 상에서 문서를 편집해서 공유하면 되기 때문에 사실상 그런 화려하고 멋진 앱으로 무장하고 있지 않은 리눅스에게는 호재가 된다. 요새 누가 사용하지도 않는 무거운 앱들을 모두 설치해서 들고 다니는가 말이다. 웹 앱들이 그것들을 모두 대체했다. 구태여 필요하다면 가상 머신 위에 설치해서 살짝 살짝 쓰다가 지워버리면 그만이다. 그래서 KVM처럼 빠른 가상 머신이면 효과가 더 크다. MacOS위에서 돌아가는 패럴랠즈도 좋지만 아쉽게도 인텔 CPU를 위해 만들어져서인지 그다지 빠르지 않다. Docker 또한 가상머신 위에 리눅스 커널을 돌려서 움직여야 되고 파일 시스템이 이질적이다보니까 실행속도가 심히 떨어진다.

빨리 결과를 내야 하는 일들을 하기 위해서 2-30대 컴퓨터를 병렬로 동원해서 일을 하던 때가 있었다. 지금은 달랑 1대의 컴퓨터를 쓰지만, 컴퓨터가 빨라진 것만큼 사람도 변해서 그때보다 더 빠른 결과를 낼 수가 있다.  그게 말이 되냐고? 말이 된다. 물론 같이 일하는 대다수의 사람들은 그렇게 컴퓨터를 써 본적도 없고 자신이 알고 있던 방법을 끝까지 고집해서 가니까 또 머리보다 입을 놀리는 시간이 많아서 말도 안되게 느린 결과를 내지만. 어차피 사람마다 시간은 다르게 흘러가는 것 아니겠는가? 태어나고 죽는 시간이 다르고 이 세상에 머물고 가는 시간도 각자 다 다른데 말이다. 