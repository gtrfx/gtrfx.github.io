---
title: "IEEE pdfExpress..."
---
# IEEE pdfExpress...

IEEE 관련 journal, conference에 올라가는 논문들의 PDF quality를 높이는 차원에서 site를 개설한 것 같다. 예전 같으면 LaTeX 원본을 editor에게 보내서 처리했던 것 같은데, 요새는 일단 논문이 완성되면 IEEE pdfExpress에 접속해서 해당 journal에 올려도 별 문제 없을 수준인지 check 받을 수도 있고, word나 postscript 출력등을 해당 journal/conference에 올려도 문제가 없게끔 PDF로 변환해주기도 한다.

한가지 집고 넘어가야 될 것은, 해당 journal과 conference에서 제공하는 author's kit에 있는 class file을 사용하여 논문을 작성해서 자체적으로 pdf 변환 (pdfTeX, dvipdfm 등)하더라도, font의 embedding이 잘 안되어있으면 퇴짜를 맞기 십상이란 거다.

예를 들어, times나 helvetica와 같은 font는 원문에서 해당 font를 사용하는 것으로 작성했다하더라도, 대부분의 pdf 변환기에서 윈도우즈 환경을 고려해서 font를 embedding하지 않고 윈도우즈 자체 true-type font(Times New Roman, Arial)를 사용하게끔 만들어준다. 그것이 불필요한 font를 embedding하지 않음으로써 문서 파일을 컴팩트하게 만들어주기 때문이다.

그러나, pdfExpress에서는 time이나 helvetica font일지라도 embedding이 안되어있으면 퇴짜를 맞는다. 게다가 dvipdfm 등에서 자동으로 추가되는 bookmark 같은 것들도 퇴짜를 맞게 만드는 원인이 된다.

그래서, 가장 좋은 방법은 출력물을 postscript로 만들어서 pdfExpress 더러 PDF로 변환해달라고 하는 것이다. 윈도우즈에 있는 Acrobat distiller의 기본 세팅으로 변환하더라도 퇴짜를 맞기 때문이다. 그 이유는 위에 설명한 font embedding 문제 때문이다.

