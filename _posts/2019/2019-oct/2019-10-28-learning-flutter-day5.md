---
title: "Learning Flutter: Day 5"
tags: [flutter]
---

다른 언어에 대해서 (일반적으로 알려진 다른 언어들과의) 차이점을 통해 공부하는 것은 사실 시간이 별로 들지 않는데 역시나 Dart는 그렇지 않은 듯 하다. 언어의 측면에서는 일반 OOP 언어들과 차이가 없지만 framework을 이용해야 하기 때문에 그 framework이 원하는 대로 맥락을 따라가 주어야 되기 때문에 이 부분이 학습의 거의 95% 이상이라고 보여진다.

다른 이들이 만들어놓은 framework 또는 foundation을 그대로 가져다 사용하는 방법은 일반적으로 다음과 같다.

- 누군가 만들어놓은 class가 잔뜩 있다. 대개 include (import: python 류의 언어들)한다.
- 사용자가 자신의 앱을 만들 때는 해당 class를 내 class로 상속받고 그 안에서 virtual function에 해당하는 것을 override하는 것이 대부분이다.

5일 째에 들여다보는 app의 구조는 다음과 같다.

- void main()이 app의 entry point가 된다 (C/C++에서 유래된 것인가 갸우뚱하게 됨)
- 엄밀히 말하면 main class의 runApp function을 부르는 것이다. runApp은 Widget의 pointer로 function(subroutine) call 을 하는 것이다. 
- Widget은 State를 두고 있지 않느냐 있느냐에 따라서 StatelessWidget과 StatefulWidget로 나눠진다. 
- runApp이 부르는 각각의 클래스의 대표 function은 각각 build, createState가 되는데 사용자의 프로그램은 override function를 통해 연결되게 된다.

즉, State의 여부에 따라 아래의 두 가지의 형태 중 하나가 된다. 차이점은 State가 없으면 곧바로 build로 연결이 되는데, 있으면 createState로 연결이 된다는 것이다. 둘 다 다 build로 연결되면 쉽고 편할텐데 말이다. 

```
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ...
    }
}
```

```
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
    @override
    _MyState createState() => _MyState();
}

class _MyState extends State<MyApp> {
    @override
    void initState() {
        ...
    }
    @override
    Widget build(BuildContext context) {
        return ...
    }
}
```

State가 없는 걸로 만들었다가 State가 있는 Widget을 붙이기도 하고. 어찌되었든 화면에 표시되는 무엇인가는 대부분 다 Widget이고 이게 앱의 (개념상으로) 최소의 구성요소가 된다. 그 State라는 것은 해당 Widget에 뭔가를 기록할 수 있게 해놓은 저장요소/상태변수(이건 좀 공학적인데?), 그러니까 해당 Widget의 발자취가 필요하다고 할 때 그 발자취, document라고 하면 document, record라고 하면 record가 되는 것이다.

OOP가 그렇듯이 계속해서 상속받아서 내려가면 depth가 계속 증가하게도 되고 하는데, 사실 이것에 민감한 저급 언어들은 그런 걸 다 따지고 있어야 하니까 머리가 복잡해지는 면이 있다. 그러나 Dart는 java라든가 python같은 요새 언어라서 그런 depth가 아무리 깊어져도 이것들을 실행하는 vm이 알아서 garbage collection을 하니까 그런 것에 연연하지 않고 할 수도 있을 듯 하다. 그리고, 이런 언어에서 프로그래밍하는 습관을 따라가다보면 별로 신경쓰지 않아도 알아서 garbage collection이 잘 되게끔 프로그램을 작성하게 될 거라 본다.

그 이유는 그 state를 갱신하거나 하는 것에 관해서 함수를 별도로 override해야 하고 이 때의 variable을 구간별로 제대로 명시해줘야 하기 때문에 어쩌다(?) 제대로 쓰레기 수거가 안되게끔 될 가능성이 크게 줄어드는 거라 본다.
