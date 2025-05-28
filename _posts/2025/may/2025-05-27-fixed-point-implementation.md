---
title: "fixed point implementation..."
tags: [mlir]
layout: post
author: "Keith"
published: false
---

fixed point 연산을 사용하는 가장 큰 이유는 다루기 편하고 크기가 작고 싸게 만들 수 있기 때문이다. 모두가 그것의 한계(쉽게 말해 resolution이 떨어지는 것, dynamic range가 줄어드는 것)를 
잘 알고 있지만 사용하는 이유는 성능과 비용의 타협의 결과물이기 때문이다.

MLIR로 이걸 fixed point implementation을 어떻게 최종결과물 (.sv, .ll)로 만들어낼까 생각해봤다.

답은 하나 밖에 없다. 별도의 dialect를 만들고 그것을 다룰 수 있는 pass를 별도로 구현하는 것이다.


