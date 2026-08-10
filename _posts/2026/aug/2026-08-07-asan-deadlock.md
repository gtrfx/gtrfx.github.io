---
title: "Address sanitizer와 보안소프트웨어..."
tags: [life]
layout: post
author: "Keith"
---

회사에서 받은 맥북에는 이런 저런 보안소프트웨어가 깔려있다. 그 덕택에 M4 pro이지만 그다지 빠릿하지 못한 느낌을 갖는 건 일반적이지만, 그 때문에 제대로 일을 못하겠는 건 좀 참기 힘들다.

MacOS에서는 valgrind가 없어서 일부러 linux machine으로 가져가서 실행하는 경우가 많은데, 그나마도 안되면 memory leak을 찾기 위해서는 어쩔 수 없이 -fsanitizer를 이용하게 된다.

문제는 회사 보안 소프트웨어가 이것의 활동을 방해한다는 거다. 일단 fsan을 걸고 빌드하고 실행하면 아무런 일도 일어나지 않지만 load는 load대로 먹고 그대로 deadlock이 걸린 상태가 된다.

한마디로 이 머신에서는 개발 비슷한 거라도 하지 말란 얘기다. 

중복실행도 잘안되고 multi-threaded app에서도 뭔가 문제가 있는 듯한 반응이 나온다.

c++ 레벨에선 아무 것도 하지 말고 그냥 조용히 python 이나 돌리고 있어야 하는 거다. 
