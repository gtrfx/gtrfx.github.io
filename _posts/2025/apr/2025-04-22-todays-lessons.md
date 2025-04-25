---
title: "오늘의 학습 내용(4/22/2025)..."
tags: [study]
layout: post
author: "Keith"
---

**SystemVerilog for Hardware Description**:     
- 이 책은 나름 handbook 처럼 필요할 때 찾아볼 수 있는 수준

**Compilers: Principles, Techniques, and Tools**:        
- 이 책은 일반적인 compiler 이론을 다루고 뒷 부분에 약간의 parallelism에 대해서 다룸
  - lexical analyzer --> token으로 바꿈
  - syntax analyzer --> token의 연속을 parsing해서 tree의 형태(AST: abstract syntax tree)로 보관하고 syntax tree에 존재하는지 확인함
  - semantic analyzer --> 의미상 합당한지 확인. type간 불일치가 난다거나 하면 에러 발생.
  - IR (intermediate representation) code generation --> IR code
  - machine independent code optimization
  - code generator --> target machine code
  - machine dependent optimizationg

