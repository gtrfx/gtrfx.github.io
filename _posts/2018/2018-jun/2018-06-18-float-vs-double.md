---
title: "Float vs. Double"
categories:
    - computer
---

floating point number를 다루는 type이 일반적으로 두 가지가 있다. float와 double이다. 이것 말고도 long double이라는 타입이 있긴 하다. 비교를 하자면 float는 4 byte로 floating number를 표현한다. 32bit에 해당하는데, 이걸 두 배로 늘린 것이 double 되시겠다. 8byte를 쓴다. long double은 10byte (80bits)를 쓴다.

예전엔 floating point number를 처리하는데 float가 대세였다. 예전이란 게 20년도 더 전 얘기다. 그 때부터 컴퓨터를 했다면 double로 처리하면 많이 늦어서 잘 안썼다. 이름 자체가 더블 아닌가? 패티가 두장 들어있는 더블 (치즈) 와퍼도 아니고 더블더블도 아니고 그리고 항상 특별 대우를 해줘야 한다고 생각하고 무겁다고 생각했는데, 어느 시점부터는 float를 전혀 쓰지 않고 double이 대세가 되었다. 사실 floating point number를 쓰는데 float면 되지 않겠냐 할 수 있다. 뭐 얼마나 더 정확해지려고 구태여 더블더블 해야 되냐고.

그런데 IIR filter 처럼 안정성이 중요한 경우에 float로 하면 발산하는 경우가 왕왕있었다. 필터 자체는 안정되게 디자인 되었는데 그것을 floating point로 처리하면서 pole의 위치가 불안정한 위치에 놓이게 되었다 이렇게 해석하면 되지 싶다.

메모리 용량은 그렇다치고 계산속도도 float가 빠르지 않을까 생각할 수 있는데, 이 부분은 기존 명령어 셋을 이용해서 처리하는 게 아니라 전담 처리 하드웨어를 사용해서 처리하기 때문에 double/long double 처리 하드웨어가 있느냐 없느냐에 따라 달라지는데 지금 시대가 예전처럼 i386, i387이렇게 코프로세서가 붙는 시절이 아니라 하나에 다 집적되는 시절이다 보니까 애매해지게 된 것이다.

무슨 소리냐면 float로 하면 double보다 더 느려진다는 것이다. 그럼 long double은? float보다 두 배 느린 것으로 나타난다. double은 float보다 대략 1.5배 정도 빠르다. 인텔프로세서에서 그런데 32bit arm으로 가지고 가니 float가 빠르다. 생각보다 모바일용 arm은 속도가 거의 10배도 더 느리다. arm7h에서 테스트해본 결과 long double과 double은 비슷하게 나오고 float는 1.5배 정도 빠르다.

정리하면
- 군소리말고 floating point처리는 double을 써라. 충분히 정확도 높고 빠르다.
- 32bit arm에서 double이 float보다 좀 느렸다. 64bit arm에서 한번 테스트해봐야 할 것 같다.


