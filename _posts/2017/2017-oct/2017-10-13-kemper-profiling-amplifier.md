---
layout: post
title: "Kemper Profiling Amplifier"
categories:
    - project
    - audio
    - music
author: "Keith"
---

가끔씩 KPA를 떠올릴 때마다 Kemper가 존경스러워질 때가 있다. 이 사람의 내력을 보면 집안이 오르간 제조 사업을 했고 스스로도 나름 DSP에 관련한 지식도 좀 있고 한 사람이다. 가업을 물려받아 해야겠는데 오르간이 계속 잘 팔리지는 않으니 뭔가를 해야 할까 하다가 기타 앰프를 만들어 팔까 했다던데, 이미 모델링이 대세인 시절이라 앰프도 만들어보면서 이것을 어떻게 상품화해야 할까 고민하는 중에 회로도 잘 모르겠고, 모르는 걸 상품화하는 것도 더 어려운데, 그것을 모델링까지 해야겠으니 진작에 circuit level에서 accurate한 모델링은 포기해야겠다 맘먹고 무식한(?) 접근 방식을 시도했다가 그게 대박이 터진 경우라고 볼 수 있다.

얼마나 많은 매출을 올리고 있는지 알 수는 없지만 KPA 포럼에 가서 사람들이 올리는 글들을 보면 이 제품에 대한 맹신도(?), 숭배자들이 꽤나 많음을 알 수 있다. 그 믿음은 사이비 미신을 믿는 것을 능가한다 볼 수 있다. 이들 개개인도 따져보면 제법 배우기도 많이 배웠고 나름 오디오/음악 깨나 한다는 사람들이다. 그러나 정작 모든 비밀을 안고 있는 켐퍼가 입을 열지 않으니 이들은 2000불이 넘는 상자안에 대단한 신기술이 숨어있어서 요술을 부린다고만 알고 있다. 제품이 나온지 거의 10년이 다 되어가는 지금에도 말이다.

세상에 누가 스스로 제품을 창안해서 만들어냈는데 그 사용자들이 그 제품에 대해서 숭배하고 온종일 매달려지내고 그것으로 부속 사업들을 만들어서 열심히 비지니스까지 하고 있다고 생각하면 '아 뭐 이럴거 까지야..' 하는 생각도 들겠지만 어쨌든 재미있다고 할 것 같다. 경제적으로야 어떻게든 제품 개발자에게 이득이 돌아갈 수 밖에 없는 상황이니 어느 단계를 넘어서면 사실 땅짚고 헤엄치기 상황이 되겠지만.

실용주의가 대단한 사람이라 그런지 알고리즘의 본질이라든가 스펙은 전혀 바꾸지 않은 채 저비용으로 확장할 수 있는 것들 (class D power amplifier)만 해서 적당히 우려먹고 있다가 페달형 리모트 컨트롤러를 만들어낸지도 얼마되지 않았다. 그 정도로 사실 느릿 느릿해도 사업에는 전혀 지장이 없는 상황이고, 사용자의 수는 계속 늘어나서 정말로 엄청난 양의 앰프 프로파일링 데이터가 쌓이게 되었다. 

이 기술의 알맹이는 아무도 공개하지 않았고, 크리스티안 켐퍼가 특허로 만들어놓은 내용을 봐도 사실 어떻게 만들었는지 잘 알기 어렵다. 원리적인 내용을 상당히 변형해서 변호사라든가 기술에 대해서 잘 모르는 사람들이 이해할 수 있는 수준으로 만들어놔서, 되려 이것을 통해서 원래 어떻게 만들어놓은 것인지 알기 더욱 어렵게 만들어놨다.

그런데, 앰프 프로파일링 데이터를 열어보면 그 해답이 나오게 된다. 앰프 프로파일링 데이터는 sysex로 되어있다. 그러니까 MIDI 장치간 주고 받는 데이터 중에서 음표와 관련되지 않은 파라미터들을 주고 받을 때 쓰는 형식을 빌어 표현해놓은 것이다. 그것을 그대로 파일로 저장해놓은 것이라 MIDI sysex를 해독하는 방법으로 열어봐야 보인다. 또 나름 보안성을 생각해서 그 sysex를 열어봤다고 해서 그것들이 전부 무엇을 뜻하는지 알 수 없게 해놓았다. 즉, 패치의 이름이라든가 이펙트의 파리미터 값들은 그냥 볼 수 있게 해놓았지만 프로파일링 데이터는 그냥 열어볼 수 없게 기기 자체에 키가 있고 외부에서 적용한 키와 연계해서 나머지 데이터를 decrypt할 수 있게 해놓았다.

요새 컴퓨터를 좀 하는 사람들에게 이것은 별로 어려운 일이 아니니, 그 내용을 모두 다 헤집어 꺼낼 수 있다. 

그 결과를 보면 256 포인트 데이터를 두 벌 가지고 있음을 알 수 있다. float type의 실수이다. 이것을 그대로 관찰하면 frequency response로 보이는데 실제로 그렇지 않다. 이것을 그냥 단순한 frequency response라든가 time domain IR로 보기엔 무리가 있다. 이것도 한 번 꼬아놓은 것이라 그냥 적용하려고 하면 원하는 결과를 얻을 수 없다. 여기에 사용된 연산은 별 것 아니지만 여기서 언급하지 않겠다.

어쨌든 그것들을 조합해보면 KPA는 단순히 두개의 frequency domain의 filter mask를 이용해서 앰프의 특성을 가져다 놓은 것이다. 앰프가 dirty channel이 아닌 clean channel일 경우에 사용하는 filter mask는 오직 하나가 된다. 바로 여기서 쉽게 답이 나온다. 두 개의 freq mask사이에 뭐가 놓이게 될지 말이다. 

이 사람이 처음에 앰프를 블랙박스로 놓고 어떤 생각을 했을지 접근해보면 답은 쉽게 나온다. 클린 채널의 경우 앰프에서 아무런 distortion이 없다고 가정하면, 기타 - 앰프 - 마이크로 이루어지는 신호 경로상에서 앰프 또한 일종의 EQ 역할을 하고 있는 것에 불과하기 때문에 전체적인 신호 모델은 하나의 EQ에 불과하게 된다. 

알고리즘은 지극히 간단하고 크리스티안 캠퍼라는 사람의 앎의 폭에서 나올 수 있는 수준의 것이다. 비선형 시스템을 모델링하기 위해서 어려운 series를 가져다 parameter estimation을 한 것도 아니고 앰프에 집어넣은 신호가 어느 레벨에서 깨지더라만을 알아내서 그것을 그가 생각하는 간단한 모델에 연결해 놓은 것이다. 이 모델이 절대로 정확한 모델링 방법이다라고 할 수는 없다. 

그러나 아무리 SW적으로 진공관을 모델링한다 하더라도 연산량은 생각보다 많고 근사하는 방법을 단순화시켜도 역시나 많은 연산량을 피해갈 수 없다. 그러나 켐퍼의 방법은 EQing 2번과 한번의 찌그러뜨리기로 끝난다. 생각해봤는데, 이렇게 연산이 간단해서 제품단가도 엄청나게 떨어뜨릴 수 있다는 장점 말고도 이펙터 시스템 자체의 latency도 크게 줄일 수 있기 때문에 연주자 입장에서는 모델링 방법이 아무 허접하다 한들 만족도는 더 높을 수 밖에 없다. 

진공관 앰프를 회로와 소자레벨에서 모델링하는 사람들의 입장에서 KPA의 모델을 바라보면 어설프기 짝이 없지만, KPA의 숭배자들을 보면 단순 무식한 것일 수록 사람들은 잘 매료되고 빠져나오지 못함을 알 수 있다. 어렵고 심오하면 할 수록 끌어들이기 어려울 뿐 아니라 이내 그 한계를 깨닫고 빨리 도망쳐나오게 된다. 

크리스티앙 켐퍼의 아이디어와 상품화된 물건을 보면 볼 수록 이 세상을 살아가면서 스스로 부족하다고 느껴서 쌓아놓은 지식이며 능력은 모두 불필요한 것임을 느끼게 된다. 간단하고 직관적일수록 의미를 갖는다. 간단한 아이디어 하나로 히트 상품을 만들고 그것을 그다지 열심히 업데이트 하거나 기능 개선을 하지 않고도 잘 버티고 있다. 쓸데없이 너무 많이 알고 배울 수록 그런 접근에서 멀어지게 된다. 오히려 나보다 더 능력있는 누군가에게 발목잡힐까 불안에 떤다. 더 많이 배우고 알면 더 넓고 어려운 일을 해결할 것이라고 생각하지만, 오히려 그 앎과 배움이 어떤 것이 불가능하다라는 핑계를 대는데 응용되어지는 것이다. 아예 아무것도 모르고 시작했다면 될 것이라는 희망이라도 갖고 바보처럼 매달려나 봤을텐데 말이다. 여기에 입까지 발전하게 되면 손을 놀리려 하지 않게 된다. 즉, 입만 놀려서도 먹을 수 있는데, 힘들게 손과 몸이 고생할 이유가 없다고 생각할테니까 말이다. 

흔히들 세상에서 놀라운 물건들을 만들어낸 이들의 학력이 생각보다 높지 않음을 보고 의외라든가 원래 똑똑해서 그랬다거나 생각하는 것은 맞지 않는 해석이라고 본다. 세상의 대부분을 구성하는 사람들의 눈 높이에서 뭔가를 생각하고 만들지 않는 이상엔 대히트작이 나오긴 어렵다는 것이다. 간단하고 단순할 수록 좋다. 바로 눈앞에서 뭔가가 해결되어야 속 시원한 것이다. 아무리 그럴싸한 이유를 대고 이론을 읊조려 봐야 달나라 이야기에 불과하고 내 눈앞에서 일어날 수 있는 일이면 뭐든 일어나게 해줘야 히트하는 것이다.