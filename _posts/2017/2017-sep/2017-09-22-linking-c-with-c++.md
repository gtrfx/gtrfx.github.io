---
layout: post
title: "C object를 C++ object와 linking할 때"
categories:
    - learning
author: "Keith"
---

C source file을 C++ project에 링킹하는 것은 컴파일러가 알아서 해주는 일이 아니다. 아무 생각 없이 C++ 함수에서 C file에 정의된 함수를 부르면 컴파일은 가능하지만 (prototype이 들어있는 header를 include 하므로) linking은 되지 않는다. C와 C++ 함수의 symbol이 다르기 때문이다. C++에서는 함수이름을 이른마 mangling한다. 다양한 클래스에서 동일한 이름의 function name을 쓸 수 있는 상황이다보니 구분을 위해서 매우 독특한 문자열로 바꿔버린다.

따라서 이것을 가능하게 하는 방법은 다음과 같다.

- C source file을 모두 C++로 바꿔서 컴파일 하는 방법
- CPP에서 C file header (prototype)을 include할 때 extern "C"를 적어주는 방법

즉 아래와 같이 해서 문제가 생겼다면

```
#include "c_header.h"
```

다음과 같이 하는 것이다.

```
extern "C" {
#include "c_header.h"    
}
```

