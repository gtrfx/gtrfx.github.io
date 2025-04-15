---
title: "오늘의 학습 내용..."
tags: [study]
layout: post
author: "Keith"
---

**오늘 들여다 본 내용들:**
- vivado 시작해보기:     
간단한 모듈 v와 sv로 만들어보고 sv로 test bench만들어서 simulation 해 보기: 아주 잘된다. synthesize해보면 v나 sv나 차이가 없는데, 기본적으로 v를 요구하고 v일 때는 sv의 예약어를 쓸 때는 에러가 난다. 실무의 세계에서는 v에 sv예약어도 넣고 하는데, 여기서는 좀 엄격하다. 역시 synthesize 같은 걸 고려해서 그런가 verilator 대비 한참 느린 구석이 있어보인다.   
- computer architecture:     
Henessy & Patterson의 책을 봤는데 뭐랄까 남는 게 없고. 그래서 열심히 내용만 요약해서 3일간 겉핥기 하고 끝남.
차라리 z80/6502 같은 걸 verilog로 만들어 놓은 걸 보고 기본을 익히고, 나머지는 주변 ip 설계한 것들 (open source)을 보고 이해하는 게 100배 나을 듯 함.
- algorithm (~chapter4):    
오늘 1일차. 별로 얻은 게 없고 (hash라든가 기본적인 데이터 구조가 앞 장에 있음). Sort나 종류별로 만들어보고 오늘은 쫑내야 할 것 같음
- STL sort algorithm:     
sort: quick - heap - insertion sort --> unstable    
stable_sort: merge sort --> stable by creating another memory space

**sorting algorithm:**
- bubble sort: 전체를 다 뒤져서 (O(n^2)) 위치 바꿈 -> 가장 간단함
- selection sort: 앞으로 나아가면서 맨 뒤까지 비교하며 minimum을 맨 앞으로 보냄 (O(n^2))
- **quick sort**: pivot 값을 가운데 두고 반반 sort함 (recursion)
- **merge sort**: 반반 나눠서 정렬함. recursion을 사용함. 쪼긴 반반을 크기에 따라 merge함
- **heap sort**: 2개씩 정렬해서 그 판을 키워서 전체 정렬함
- **insertion sort**: 앞으로 나아가면서 정렬 안되어있으면 이전의 것들과 비교하며 자리바꿈. 정렬된 데이터를 쓰면 계산량이 급격히 줄게 됨
- counting sort: 배열을 잡아놓고 입력의 element들을 index로 써서 marking하고 나중에 그 배열에서 1보다 큰 값을 갖는 index를 순차적으로 읽어냄.
- radix sort: radix별로 counting sort하여 합침
- bucket sort:
- **tim sort**: 작은 그룹으로 insertion sort를 하고 다음에 merge함: 무슨 장점이 있는지 잘 모르겠음. 공개된 tim sort를 보면 굉장히 복잡함
- shell sort:

일반적으로 sort를 내가 구현할 이유는 없지만 머리로 생각이나 한번 해보라는 용도로 이 예제를 활용하는 것 같음. 대개는 sort 아니면 stable_sort (=비교대상의 값이 같다면 원래 데이터의 순서를 유지함)를 불러내어씀.

