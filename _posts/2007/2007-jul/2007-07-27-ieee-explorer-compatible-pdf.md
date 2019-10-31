---
layout: post
title: "IEEE Explorer compatible PDF.."
---

예전 같으면, 학회에 논문을 제출할 때에는 양식에 신경쓰는 몇 개의 학회에서는 style file을 제공했던 것 같고, 그외의 학회에서는 대개 내맘대로 format의 LaTeX으로 출력한 postscript, 혹은 MS Word, PDF 파일을 받아서 자체에서 편집을 해줬던 것 같은데, 요샌 아예 author에게 모든 사양을 만족시키는 PDF를 직접 만들어 올리라고 하는 것 같다.

그것을 대행해주는 사이트가 ieeePdfexpress 같은 곳인데, 안타깝게도 pdflatex이나 dvipdfm 같은 것을 기본 setting으로 사용해서 만든 PDF file은 여기에서 compatible하지 않다고 나온다.

기본적으로 여기서는 PDF file에서 사용되는 모든 font가 embedding되어있는 것을 요구한다. 일반적으로 times나 helvetica 같은 font는 윈도우즈에서 기본 제공하는 Times New Roman, Arial font로 자동 대체가 되는 까닭에 font를 embedding하지 않아도 읽는 데 아무런 지장이 없다. 따라서, 요새 나오는 acrobat distiller에서도 기본 세팅에는 이런 font를 embedding하지 않도록 되어있다. 그것이 문서의 크기를 줄이는 데 큰 역할을 한다.

어쨋거나, IEEE에서 explorer를 통해서 잘 검색되도록 하려면, 그 동네의 원칙이 왠만한 font는 모두 embedding 되어야 하고, 가장 흔한 times, helvetica font는 adobe의 type1 font로 embedding되어야 하기에, 개인이 그것을 제대로 converting하기 위해서는 부지런히 인터넷을 돌아다녀야 한다..왜? (상용 폰트인) adobe type1 font를 찾아서..


