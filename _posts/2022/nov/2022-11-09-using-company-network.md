---
title: "답답한 회사 네트워크 쓰기.."
tags: [proxy]
layout: post
---

회사 안에 많은 컴퓨터들이 있고 외부망과는 구별되는 주소를 가지고 있고 하다보면 내부에 있는 장치들이 외부로 인터넷 접속을 하는 것을 막기 위해서 외부 접속이 가능한 서비스 (이를테면 Wifi)와 이와는 구별되는 내부망을 따로 두게 된다.

문제는 이 구분이 좀 불분명하게 된다는 것이다. 왜? 내부에 있는 컴퓨터 장치들도 인터넷에 엄청나게 의존하고 있어서 자체적으로 업데이트를 해야 할 일이 있고 하다 못해 시간 정보를 가져와야 할 수도 있고 알게 모르게 외부와 접속을 아예 끊어버리면 제대로 동작하지 않는 서비스들도 있다. 따라서 어쩔 수 없이 어떤 주소 대역은 열어놓고 어떤 것은 막아놓고 하게 된다. 대개는 https를 통해서 접속되는 트래픽을 회사에서는 컨트롤 하려고 한다. 무슨 일이 생기더라도 그 문제는 해당 접속을 시도한 주체 자체에 한정시키기 위해서 인증서를 따로 발급해서 스스로 책임을 지게 한다는 뭐 그런 거다. 

그러니까 회사에서 나눠준 컴퓨터를 쓰게 되면 그 인증서를 늘 가지고 다니면서 인터넷에 접속하게 되니까 문제가 없는데, 인증서가 없는 경우에는 접속이 불가하게 되거나 다른 방식을 통해서 인증서를 강제로 받게 한다. 대개 Wifi 접속을 하는 경우가 그렇다. wired 접속을 할 때에는 아예 외부망에 거의 접속할 수 없게 하거나 아니면 인증서가 달라서 실제로 접속할 수 없게 만든다. 

그래서 어떻게 하면 좋냐고? 

회사에 드나들 때마다 새로 어딘가에 들어가서 인증서를 발급받아서 쓰기엔 좀 피곤하다. 더구나 네트워크를 둘로 구분해서 제공하는 경우, 이를테면 유선은 내부망, 무선은 외부망으로 접속하게 해놓았다면 분명히 내부와 외부를 동시에 접속해야 한다면 반드시 routing 조건을 조정해야 한다. 즉, 어떤 주소 대역에서는 내부망에 연결된 인터페이스를 쓰고 어떤 대역은 외부망으로 연결되는 라우터 주소로 나가게 해야 한다. 이걸 매번 해주려면 정말 피곤하다. 더구나 자리를 이동하면서 사용하다보면 주소 대역도 달라져야되니 더 불편하다.

그러면 회사에 공용 기계 하나에 아예 인증서를 받아버리고 그 기계를 프락시로 활용해서 쓰면 아주 편리하다. 내가 할 일은 회사에 왔을 때 해당 프락시에 socks로 터널링을 해버리면 되니까. 어차피 나밖에 쓸 사람이 없기 때문에 혹여 내가 뚫어놓은 구멍때문에 골치 아플 일도 없다. 회사 관리 시스템이 엄중해서 이런 것 까지 잡아낼 일도 없고.

정리하면,

- 귀찮게 인증서와 routing 정보를 매번 관리하고 갱신하려면 귀찮다. 
- 공용 기계 하나에 인증서와 router 정보를 잘 설정해놓고 이 기계로 socks proxy를 이용해서 통신하자.
