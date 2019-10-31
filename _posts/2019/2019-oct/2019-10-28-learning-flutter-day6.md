---
layout: post
title: "Learning Flutter: Day 6"
tags: [flutter]
---

오늘은 간단히 Scaffold라는 클래스를 하나 보도록한다. 내가 이해하는 바 이것은 일반적인 앱의 전형적인 모양을 이루게 해주는 클래스다 라고 본다.

지난 번에 이어 MaterialApp 위젯에서 Scaffold를 부르면 아주 기본적인 앱의 겉 모양새를 갖추게 해준다.

Scaffold는 대충 앱의 일반적인 다음의 구성 요소들을 가지고 있다.
- appBar: 타이틀이 등장하는 상단의 바
- body: 앱의 내용
- bottomNavigationBar: 하단의 네비게이션을 위한 바 (아이콘/설명)

이 외에도 다른 요소들이 있긴 하나 초보단계에서 빈번히 쓰는 것들은 이것이 대부분이다 싶다.

body에 대한 것은 다음에 다루기로 하고 대충 아래와 같이 만들어 볼 수 있다. 물론 NavigationBar에 있는 아이콘과 다른 요소들을 어떻게 연결하는 것도 천천히 해보기로 하고 이번에는 이 구조만 익히면 될 것 같다.

대충 1주일만에 오직 에디터의 힘만 빌어서, 아무것도 없는 상태에서 적어도 뼈다귀만 있는 앱이라도 만들 수 있게 되었다. 그것도 웹앱/안드로이드앱/iOS앱/...으로 말이다. 머리에 아무것도 없던 상태에서 이 정도까지 진화하였으니 엄청난 진화라 할 수 있지 않은가? 비록 앱 중간에 'Help!'라고 밖에 쓸 줄 모르는 지경이긴 하지만 말이다. Dart라는 python/java/c가 뒤섞인 참으로 쉽게 다가갈 수 있는 언어와 flutter라는 프레임웍을 사용해서 object C라든가 android studio만을 가지고 작업했다면 도달할 수 없는 정도의 완성도를 가진 앱을 만들었으니까 참으로 놀라운 학습 진도라고 볼 수 있다 이만하면. 

일단 지금의 목표는 일단 daap 클라이언트를 만들어보는 것인데 잘 될지 모르겠다. 

```
Widget build(BuildContext context)
  {
      return MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('School'),
        ),
          ],
          ),
          appBar: AppBar(
            title: const Text('This is my app'),
          ),
          body: 
          Center(
            child:
            CupertinoActionSheet(
              title: Text('Help!'),
              ),
          ),
        ),
      );
  }
```