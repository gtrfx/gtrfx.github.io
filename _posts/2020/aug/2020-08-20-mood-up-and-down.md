---
title: "C++: copy constructor/operator="
tags: [c++, static code analysis]
---

static code analysis tool을 써보고 있다. 역시 많은 것을 경험하는 것은 좋은 것이구나 싶다. 

별 문제 없어보이는 경우에도 copy constructor가 없다 operator=가 없다 라고 하는 경우가 있다.

class가 복제되고 치환되고 할 수 있는 기능도 있으니까 이게 정의가 안되어있으면 문제가 생길 수도 있다고 본다. 

대개 그걸 목적으로 만들어지는 클래스는 당연히 이 부분이 먼저 씌여지고 중요하게 다뤄질텐데, 그럴 이유가 없는 class라면 치환하는 것은 아무것도 써넣지 않아도 되고 copy constructor는 그냥 자기 복제를 하게 해준다든가 역시나 그냥 return *this 해주면 된다.
