---
title: "도대체 tracker가 뭐하는 건가?"
tags: [tracker, internet]
---

내가 본격적으로 인터넷과 HTML 등등을 제대로 접하게 된 것이 90년대 말이었던 것으로 기억한다. 당시는 여기 저기 널려있던 조그만 회사들이 인터넷으로 뭔가를 개발해보겠다고 하던 시절이었는데 단지 고등학교 학생이었던 나를 아르바이트로 고용해서 제법 보수를 많이 쳐주었던 기억이 난다. 더구나 일을 해가면 일을 맡긴 이들이 그 내용을 이해 못하던 시절이었으니까 대충 엉터리로 해가도 문제 없었긴 하지만, 지금이나 그 때나 난 여전히 고지식했으므로 최선을 다해서 일을 해갔던 기억이다.

그 때 내가 알게 된 것들이 대개 cookie라든가 session이라든가 하는 것이었는데, 이것은 계정같은 것을 서버에 만들어두고 마치 서버에 로긴하듯이 웹 서버를 굴릴 수 있게 하는 일종의 도구였다. 신기한 것은 브라우저들이 자신들의 정보를 접속시에 늘상 알려주고 있었다는 것이고 ip address는 사실상 그것이 어디서 출발한 것이었든 나름 자신의 출처를 잘 알려주고 있었다는 것이다. 

tracker라는 것의 개념도 아마도 이 시절에 출발했던 것 같은데, 아마도 그 이전에 얼마나 많은 사람들이 어떤 웹 사이트에 접속하고 무슨 일을 하는지 통계를 내는 것이 꽤나 값어치 있는 것들이었기에 서버 측면에서는 어떤 사용자들이 접속하고 있는지 통계를 내기도 하고 referrer 라는 정보를 제공하는 경우에는 어느 사이트에서 해당 사이트로 넘어왔는지에 대한 정보도 알 수 있었다. 또 접속하는 브라우저에서는 어디에 접속했는지 이력을 가지고 있을 수 있었고 받아놓은 쿠키들을 통해서 어디서 어떤 쿠키를 받았는지도 알 수 있었다. 사실 그것들을 전부 다 로그로 받아놓고 틈나는 대로 분석해서 뭔가 의미있는 통계를 얻을 수 있었지만 당시에는 귀찮아서 하지 않았긴 한데, 인터넷을 통한 사업도 번창하고 그 때 얻어놓았던 데이터들을 의미있게 활용할 수 있다는 사실을 깨닫게 된 이후에는 이 분야가 전문성을 띠고 발전했던 것 같다.

이것을 fingerprinting, 그러니까 사람으로 치면 지문찍기? biometric information을 취득하여 그것을 활용하는 것? 이라고 하는 듯 하다. 그러니까 내 browser가 어떤 site에 접속할 때 전달하는 여러 가지 정보, 또 해당 사이트가 java script를 이용해서 몇 가지 패턴의 출력을 내 보내고 그 때의 결과를 feedback 받을 수 있는 구멍(?)을 잘 이용해서 타인이 시도한 접속에 비하여 일종의 unique한 정보를 얻게 되는 것이다. 

일단 이게 가능해지면, 해당 사이트는 수많은 접속이 시도되고 있다고 하더라도 그것들을 개별화할 수 있고 그것을 통해서 개별화된 통계를 얻어볼 수 있기 때문에 일단 이득을 볼 수 있다. 다시 말해서 인터넷에 열려있는 특정 사이트 혹은 페이지에 접속하는 이가 정확히 누구인지는 몰라도 브라우저가 전달하는 정보를 통해 타인의 접속과 확실해 구분할 수 있고, 그래서 특정 접속에 대해서 어떤 일을 하는지 감시(?)할 수 있게 되는 것이다. 

말이 좀 길었는데, 쉽게 말해서 google analytics처럼 접속한 사용자의 행태를 보다 구체적으로 알 수 있게 되는 것이다. 해당 사이트에 접속하는 수많은 접속 시도를 개별화할 수 없다면 고작해야 얻을 수 있는 통계는 언제 얼마나 많은 접속이 이루어지는지, 어떤 페이지에 많은 조회가 있었는지 정도의 개략적인 통계만을 얻을 수 있다. 그러나 브라우저 정보를 이용해서 그 수많은 접속 중에 특정 이가 시도한 접속만을 개별화시킬 수 있으면 접속한 이들에 대한 고유한 통계를 얻을 수 있게 된다. 언제 주로 접속하는지, 어떤 사이트를 경유해서 들어온 것인지, 또 다른 사이트에서 취득된 통계까지 이용하면 나이가 몇 살인지 선호하는 컨텐츠나 라이프스타일 등등을 함께 비교적 정확하게 알아낼 수 있다. 

이것은 클라이언트 입장에서는 해당 사이트가 브라우저와 시스템, 또 시스템의 상태등등을 특정할 수 있는 정보를 취득하는 javascript가 보여지는가 아닌가를 토대로 알 수 있다. 또는 이것을 해당 사이트를 대신해서 조사해주는 기관을 강제로 연결하게 하는 링크가 붙어있는지 여부를 검사해서도 알 수 있다. 우리는 그것을 tracker라고 한다. 일반적으로 잘 알려진 사이트에는 이 tracker가 꽤 많이 붙어있다. 광고 배너에도 붙어있고 정말 수 많은 곳에 붙어있다. 그렇게 트래킹 당하지 않으려면 다양한 방법이 있는데, 사람에 따라 이것을 중요하게 생각하기도 별 대수롭지 않은 문제로 보기도 하기 때문에 다르긴 한데, 내 경험을 놓고 보자면 아무리 인터넷으로 내 자신을 노출시키지 않으려 애써도 인터넷을 끊지 않는 이상에는 결국엔 노출될 수 밖에 없단 거다.

특히나 사람들에게 많이 알려진 facebook, instagram 같은 것들은 대놓고 엄청나게 tracking을 하고 있고 구글링을 하다 보면 흔히 걸리는 낚시성 사이트에 들락거리기만 해도 매우 쉽사리 fingerprinting을 당하게 된다. 그나마 좀 최근의 브라우저들이 그런 것을 각성하여 적절히 노출 수위를 조정하고 있고 private mode라고 해서 아예 이전에 접속 기록이 없는 것처럼 만들어서 브라우징 할 수 있게도 하지만, 결국엔 다 드러나게 되어있다. 물건을 구입한다든가 인터넷 뱅킹을 하겠다고 하면 private mode로 굴려서 쓰기 쉽지 않기 때문이다. 인터넷에 수많은 사이트가 로그인을 해야만 제대로 동작하게 되어있고 여기에 짝을 이루는 패스워드가 너무 많아서 private mode만을 쓰기가 쉽지 않은 것이다.

또 tracker를 막아주는 plugin들 역시 사용자의 데이터를 수집하고 뭘하는지 훤히 들여다볼 수 있기 때문에 아무도 모르게 인터넷에서 뭔가를 한다는 것은 있을 수도 없는 일인 것이다.

그래서 어쩌라고?

- 인터넷에서 브라우징을 하면 나는 아무리 애써봐야 노출될 수 밖에 없다. 단지 나란 사람을 특정할 수 없을 뿐, 그것이 어떻게든 내가 사용하고 있는 어떤 브라우저를 통해서 이루어진 접속이란 것은 특정할 수 있다. 
- 이것을 피하려면 방법은 뻔하다. 
   - VPN을 써서 최종 접속지를 바꾸는 방법 혹은 그것은 randomize하는 방법. 또 tracker의 주소를 모두 모아다가 차단하는 방법. 그러나 tracker는 계속 생겨나고 있고 tracking하는 기술도 (애진작에 포화했겠지만) 여전히 점점 진화하고 있다.
   - 웬만하면 private (incognito) mode로 브라우징 하는 것도 괜찮다.
   - tracker의 주소를 모두 blacklist로 만들어놓는, 또 그 리스트를 주기적으로 갱신하는 개인용 dns를 사용하는 방법도 있다.
   - 아예 인터넷 브라우징 전용으로 VM을 쓰는 방법도 있다.

이런 과정은 뭐랄까 빈틈이 없이 이루어져야 한다. 얕은 빈틈이라도 보이게 되면 그 즉시 fingerprinting 당하고 서버는 그 결과를 브라우저에 cookie로 박아넣어서 VPN을 쓰든 뭘하든 빼박상태로 만들어버리곤 한다. 다시 말해서 ip address를 수시로 바꾸고 browser의 type/OS 같은 정보를 계속 randomize한다고 해도 빈틈이 보였을 때 결정적인 fingerprinting을 당해버리면 다 무용지물화 되는 수가 있다. 

이런 것에 매우 집착하는 이에게는 하나의 빈틈이라도 보이지 않으려면 몹시 힘이들지만, 서버측에서 사용자를 모니터링하는 입장에서는 잔기술 하나만 잘 걸어두어도 그 모든 노력이 수포로 돌아가게 할 수 있으니까, 또 정보를 원해서 받아가는 것이 클라이언트인 내 쪽이 되기 때문에 어떻게든 숨길 수가 없어지는 것이다. 그러니까 내 눈이 타인에게 노출되지 않을 수 없고서 그 타인을 들여다볼 수 없는 것과 같다. 