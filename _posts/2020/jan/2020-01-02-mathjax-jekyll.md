---
title: "mathjax와 Jekyll (Jekyll page에서 latex쓰기)"
layout: post
tags: [latex, mathjax, Jekyll, github]
use_math: yes
image: https://upload.wikimedia.org/wikipedia/en/thumb/5/5f/MathJax.svg/1200px-MathJax.svg.png
author: "Keith"
---

생각보다 매우 간단하다.

다음을 head와 관련된 template에 추가하고 (그러니까 <head>와 </head>사이)
```
{% if page.use_math %}
    <script type="text/javascript" async src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
    </script>
    {% endif %}
```

markdown의 문서속성에 "use_math: yes"를 추가해주면 된다. 사실 이런 필드를 넣는 것은 latex과 상관 없는 모든 page에서 mathjax를 부를 필요가 없기 때문이다.
