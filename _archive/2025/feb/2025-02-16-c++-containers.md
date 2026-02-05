---
title: "C++ containers..."
tags: [life]
layout: post
author: "Keith"
---

C++은 나온지가 꽤 오래되었지만 시간이 가면 갈 수록 여러 가지로 기능이 더 불어나서 고객들이 옛날 컴파일러/linux를 쓰니까 옛날 표준으로 코드를 작성하다보면 새롭게 늘어난 좋은 기능들을 하나도 쓸 줄 모르게 된다. 물론 그런 기능이 없어도 작성하는데 불편함은 없지만, 편하게 해주려고 만든 기능을 그냥 썩혀두고 옛날 식으로 꾸역꾸역 만드는 것도 별로 보기좋진 못하다.

내가 알기로 standard template library에 기능이 꽤 많이 늘어났는데, 여기에 container들의 기능이 재미있다.

1. Sequence Containers
  These containers store elements in a specific order and allow direct access to elements.
 
   a. vector
   
   Description: A dynamic array capable of resizing automatically.
   
   Use Cases: Efficient for random access and appending elements. Not ideal for frequent insertions/deletions in the middle.
  
   Common Operations: push_back(), insert(), size(), resize()

   Header: <vector>

   b. list

   Description: A doubly-linked list allowing efficient insertions and deletions anywhere.

   Use Cases: Frequent insertions/deletions in the middle, but not for random access.

   Common Operations: push_back(), insert(), remove(), reverse()

   Header: <list>

   c. deque (Double-Ended Queue)

   Description: Allows efficient additions/removals from both ends.

   Use Cases: Applications requiring queue or stack operations efficiently.

   Common Operations: push_back(), push_front(), pop_back(), pop_front()

   Header: <deque>

   d. array

   Description: A fixed-size, homogeneous container.

   Use Cases: When a fixed-size array is needed with better safety than C-style arrays.

   Common Operations: size(), at(), fill()

   Header: <array>

2. Associative Containers

   These containers store elements in a sorted order and provide efficient lookup operations.

   a. set

   Description: Stores unique elements in sorted order.

   Use Cases: Fast lookup of unique elements.

   Common Operations: insert(), find(), erase()

   Header: <set>

   b. multiset
   
   Description: Stores elements that can have duplicates, in sorted order.
   
   Use Cases: When multiple instances of the same element are needed.
   
   Common Operations: Similar to set.
   
   Header: <set>
   
   c. map
   
   Description: Stores key-value pairs in sorted order by key.
   
   Use Cases: Associative array where keys are unique.
   
   Common Operations: insert(), find(), operator[]
   
   Header: <map>
   
   d. multimap
   
   Description: Stores key-value pairs, allowing multiple entries with the same key.
   
   Use Cases: When multiple values are associated with a single key.
   
   Common Operations: Similar to map.
   
   Header: <map>

3. Unordered Associative Containers
   
   These use hash tables for storage, offering average O(1) access time.

   a. unordered_set
   
   Description: Stores unique elements without any order.
   
   Use Cases: Fast lookups without needing sorting.
   
   Common Operations: insert(), find(), erase()
   
   Header: <unordered_set>
   
   b. unordered_multiset
   
   Description: Stores elements that can have duplicates, without any order.
   
   Use Cases: When multiple instances are needed without sorting.

   Common Operations: Similar to unordered_set.

   Header: <unordered_set>
   
   c. unordered_map
   
   Description: Stores key-value pairs without any order.
   
   Use Cases: Fast lookups of values by key without sorting.
   
   Common Operations: insert(), find(), operator[]
   
   Header: <unordered_map>
   
   d. unordered_multimap
   
   Description: Stores key-value pairs, allowing multiple entries per key.
   
   Use Cases: When multiple values are associated with a single key.
   
   Common Operations: Similar to unordered_map.

   Header: <unordered_map>

4. Adapter Containers

   These containers adapt other containers to provide specific functionalities.

   a. stack

   Description: LIFO (Last In, First Out) structure.

   Use Cases: Implementing stack-based algorithms.

   Common Operations: push(), pop(), top()

   Header: <stack>

   b. queue

   Description: FIFO (First In, First Out) structure.

   Use Cases: Job scheduling, print queues.
   
   Common Operations: enqueue(), dequeue(), front()
   
   Header: <queue>
   
   c. priority_queue

   Description: Priority-based queue (usually a max-heap).
   
   Use Cases: Event-driven systems, heap algorithms.
   
   Common Operations: push(), pop(), top()
   
   Header: <queue>
   
5. Other Containers
   
   a. bitset

   Description: Compact storage for bits.

   Use Cases: Efficient bitwise operations.
   
   Common Operations: set(), reset(), count()
   
   Header: <bitset>
   
   b. tuple
   
   Description: Heterogeneous container for a fixed number of elements.
   
   Use Cases: Returning multiple values from a function.
   
   Common Operations: get(), make_tuple()
   
   Header: <tuple>
   
생각보다 꽤나 많은 container가 있는데 잘 보면 평소에 많이 사용하던 것인데 아무 생각없이 쓰다보니 이런 container template이 있어야 되나 또 관련된 함수 같은 것들을 불러서 써줘야 되나 하는 생각이 들긴 하는데, 코드를 읽고 이해하는데는 나름 도움이 된다. 뭐랄까 원리나 이론을 제대로 이해하고 작성한 것처럼 보이긴 한다. 속도가 빠를지 아닐지는 알 수 없지만 (빠르진 않을 것 같다).

솔직히 queue/vector/array 따위를 가지고 작업할 때 중간에 데이터를 추가한다거나 지운다거나 할 때 간단한 함수의 형태로 구현이 가능하긴 하지만, 실제로 빌드해서 돌려보면 굉장히 많은 cycle을 희생하고 있는 것을 알 수 있다. C++은 예나 지금이나 (옛날과 비교하면 말도 못하게 빨라지긴 했지만) 언어적인 자유로움을 제공하려고 하다보니 수행속도에 도움이 안되는 군더더기 코드가 엄청나게 붙는다. STL로 구현하면 C++ 그 자체로는 매우 간결하고 멋지게 표현이 가능하지만 속도는 그리 빠르지 않다는 말이다. 구현해 놓은 그 모양이 교과서에서 가르치는 원리 그대로 표현하기에 꽤나 괜찮아보여서 유혹을 받는다. 그렇게 작성해 놓으면 꽤나 기초가 탄탄한 사람처럼 보일 수 있다. 느려터진 결과물이 나오든 말든.

언어로 뭔가를 구현하는 것은 언어를 구사해서 누군가에서 설명하는 것과 나름 유사성이 있다. 뭔가 쉽게 설명해서 이해를 빠르게 하려면 언어직인 미려함/있어보임은 포기해야 하듯, 빠르게 돌게 만드려면 가독성/언어적인 화려함 따위는 포기해야 할 듯 하다.

그만 알아보자.