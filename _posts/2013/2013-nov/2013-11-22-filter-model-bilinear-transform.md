---
layout: post
title: "Filter model: Bilinear transform"
---


진공관 회로에서 사용하는 filter는 대개 1차의 RC filter이다. 




간단한 수식으로 amplitude response를 계산할 수 있고, 그 수식을 bilinear transform (s=(1-z^(-1))/(1+z^(-1))로 치환)해서 IIR filter의 꼴로 끌고 가면 된다. 




Filter response는 




numerator:




-2U 2U




denominator:




(-T -2U) (2U-T)




으로 매우 간단하다. 여기서 U는 C와 R의 곱이다.











