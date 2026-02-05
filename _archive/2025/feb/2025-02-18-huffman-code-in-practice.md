---
title: "Huffman code in practice..."
tags: [life]
layout: post
author: "Keith"
---

Huffman code는 내 기억상엔 information theory를 배우는 학부 과정에서 숙제로 해갔던 기억이 있다. 

완전히 망각한 상태에서 재미삼아 새롭게 만들어봤는데, priority_queue를 쓰면 굉장히 빠르게 만들 수가 있었다.

문제는 huffman tree를 어떻게 저장하고 어떻게 다시 복원하느냐였는데, 어쩔 수 없이 압축률을 희생하면서 쉽게 만들 수 있는 방법을 택했다.

즉, (character, code lenth, code (variable size))의 순서쌍을 이용해서 저장하고, 복원할 때는 code 부분을 이용해서 binary tree를 만들어놓는 방법을 택했다.

압축도 잘되고 복원도 잘 되는데, 복원됐을 때의 파일 크기를 기록하지 않는 덕택에 마지막에 워드를 하나 더 쓰거나 하는 문제가 있긴하다. 

또 하나의 문제는 귀찮음 때문에 priority_queue를 쓰고 vector와 같이 dynamic memory를 썼다는 거다. 그래서 파일 크기가 커지면 압축 속도가 느려지는 문제가 있다. 최악의 경우 원래 파일 사이즈와 같은 결과를 얻게 된다는 사실을 이용해서 미리 메모리를 잡아놓고 작업하면 사실 속도가 조금 더 빨라질 수 있을 거라고 본다.

어쨌든 1-2시간 들여서 뭔가를 만들어놓은 것 치고는 나름 동작을 하고 있으니 뭔가 동기 부여를 위한 작업으로는 괜찮은 시작이지 싶다.