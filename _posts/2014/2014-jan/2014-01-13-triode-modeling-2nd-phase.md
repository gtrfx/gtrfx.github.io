---
layout: post
title: "Triode Modeling (2nd phase)"
---


같은 제목으로 여러 번 포스팅하고 있는데, 이번이야 말로 사실상 모델링의 종지부를 찍으려 한다.




초반 작업에서는 triode가 안정 상태에 있는 것을 가정해서 이 때의 조건을 small signal model에 적용해서 증폭률을 계산하고 saturate/grid limiting current가 생기는 것으로 모델링을 했는데, 이때 증폭률이 계산 공식이약간 잘못 적용되어 생각보다 증폭률이 크게 나왔다. 실제 프리앰프보다도 과하게 뭉개졌단 느낌이었으니까. 어쨌든 이것을 제대로 바로 잡으니 반대로 실물 앰프보다도 증폭률이 낮게 나타나는 문제가 생겼다. 




결국, 그 얘긴 small signal model에 문제가 있단 얘기가 되고, 아예 처음부터 제대로 모델링하지 않으면 소기의 목적을 절반도 달성하기 어렵겠단 얘기가 된다. 따라서, 2nd phase에 온 이상 triode를 제대로 modeling해야 할 것 같다.




시중에 돌아다니는 spice 모델 중에 가장 신뢰도가 높다고 하는 모델이 Koren 이란 사람의 Model인데, 아래서 보는 바와 같이 여기서 grid limiting current는 고려가 안되어있다. 




.SUBCKT 12AX7 1 2 3 ; P G C; NEW MODEL (TRIODE) 

+ PARAMS: MU=100 EX=1.4 KG1=1060 KP=600 KVB=300 RGI=2000 

+ CCG=2.3P CGP=2.4P CCP=.9P ; ADD .7PF TO ADJ PINS, .5 TO OTHERS. 

E1 7 0 VALUE= 

+{V(1,3)/KP*LOG(1+EXP(KP*(1/MU+V(2,3)/SQRT(KVB+V(1,3)*V(1,3)))))} 

RE1 7 0 1G 

G1 1 3 VALUE={(PWR(V(7),EX)+PWRS(V(7),EX))/KG1} 

RCP 1 3 1G ; TO AVOID FLOATING NODES IN MU-FOLLOWER 

C1 2 3 {CCG} ; CATHODE-GRID 

C2 2 1 {CGP} ; GRID=PLATE 

C3 1 3 {CCP} ; CATHODE-PLATE 

D3 5 3 DX ; FOR GRID CURRENT 

R1 2 5 {RGI} ; FOR GRID CURRENT 

.MODEL DX D(IS=1N RS=1 CJO=10PF TT=1N) 

.ENDS




여기에 grid limiting current 추가한다. 일부의 문헌들에서 smoothing을 위해서 몇 가지 항을 더 넣어주는데, 별 의미 없다.




ig = (vg-vgamma)*u(vg-vgamma)/rg




12ax7의 경우 vgamma는 0.35 volt, rg=1.3k ohm 되시겠다.




이로서 더 이상의 modeling은 없다.






