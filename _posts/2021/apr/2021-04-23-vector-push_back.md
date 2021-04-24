---
title: "vector와 push_back()"
tags: [vector, push_back, c++]
---

vector는 C++ standard에 들어있는데 사용법이 매우 간단하고 template library라 그 활용 범위가 대단히 넓다. list라는 것도 있는데, 사실 나는 개인적으로 vector를 더 자주 사용한다. 어차피 그놈이 그놈인지라 약간의 차이만 있을 뿐.

좀 특이한 점을 들라고 하면:

1. vector에 새로운 element를 넣는 경우에 copy constructor가 호출된다.
2. 신기하게도 N개의 element가 있을 때 push_back으로 새로운 element를 넣어주면 총 N+1번의 copy constructor가 호출된다.

2번이 다소 이해하기 어려운 특징인데, 그 때문에 copy constructor를 잘 만들어두어야 할 필요가 있다.

왜? 단순한 class 같은 경우에는 사실 그럴 이유가 없다.

문제는 memory를 allocate하는 class인 경우에, 특히나 constructor에서 뭔가를 하고 destructor에서 그것을 접어주게 되어있는 경우, 또 sub class를 잔뜩 두고 있고 그들도 constructor에서 instantiate하고 외부의 설정 파라미터를 이용해서 해야 하는 경우엔 분명히 문제를 일으키게 된다.

아마도 copy constructor를 계속해서 불러대는 이유는 resizing이 가능하기 때문이 아닐까 한다. 사실 push_back도 resizing의 개념이기 때문에 그렇다. 

그럴 거면 '그냥 pointer를 이용해서 잔뜩 만들면 되지 왜 그렇게 힘들게 사냐?' 라고 할 수 있다.

내 맘이다. vector나 list처럼 STL을 쓰는 것이 전체적으로 메모리 관리를 매우 깔끔하게 할 수 있다. 

**가 난무하면 일단 화면부터 현기증과 짜증을 유발한다. asterisk가 3개 이상 나열되는 코드를 발견하면 그걸 만든 놈에게 뭐랄까 살인 충동이 일게 된다. 그렇게 하지 않을 방법은 정말 많은데 그렇게 밖에 하지 못하니까.

물론 메모리 관리를 매우 꼼꼼하게 잘 해서 아무 문제 없이 만들어놓았다면 타인에 대한 배려가 출중하다, 혹은 자신이 저질러 놓은 일에 대한 책임감이 나름 훌륭한 친구라고 생각해서 믿고 같이 일 할 수 있지만.

