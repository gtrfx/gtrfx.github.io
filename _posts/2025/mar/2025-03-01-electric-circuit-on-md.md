---
title: "Markdown에 전기 회로 그려넣기?..."
tags: [life]
layout: post
author: "Keith"
---

graphviz를 보고 이게 전기회로를 그릴 수 있으면 좋을텐데 하는 생각을 해봤는데, 찾아보니 제대로 그려내는 방법은 없는 것 같다. 단지 그냥 박스라든가 써클타입의 블록 다이어그램이나 제대로 할 수 있으면 다행인 듯 하고.

그 외의 방법은 netlist를 svg로 합성하는 어떤 툴을 쓰거나 tikzpicture라는 LaTeX package를 쓴다거나 하는 방법으로 그려낼 수는 있는 듯 하다. 

쉽게 가져다 쓸 수 있는 KiCad의 schematic editor를 가져다 그려볼 수 있는 것 같다. SVG로 깔끔한 회로를 그릴 수 있는 방법이 있긴 한데 좀 노동이 필요한 것 같다. 

그래서 내린 결론은

- inkspace를 설치한다.
- wikipedia에 있는 electric symbol의 svg를 가져온다.
- svg에 있는 심볼들을 복사하고 나머지는 손으로 와이어링한다.

그래서 얻어진 결과는 svg로 나타나게 되고 이것은 뭐 어떤 문서에서든 깔끔하게 붙는 vector graphic이라 유용하게 쓸 수 있다.

끝.