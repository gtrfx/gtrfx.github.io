---
layout: post
title: "Matched EQ"
author: "Keith"
---


Logic pro라든가 Izotope Ozone 5에 보면 Matched EQ 기능이 들어가 있다. Matched EQ의 기능은 레퍼런스로 삼는 사운드 클립의 주파수 특성을 조사해서 이와 다른 주파수 특성을 갖는 샘플에 동일한 주파수 특성을 갖게 하게끔 맞춰주는 역할을 하는 것이다. 즉, 내가 좋아하는 어떤 사운드 A가 있다면 그 사운드의 주파수 특성을 분석한 뒤에 내가 바꾸고싶어하는 사운드 B의 주파수 특성을 분석하면 여기에 어떤 주파수 성분을 boost시키고 어떤 부분을 attenuate해야 할지 알 수 있게 되고, 그것을 바탕으로 사운드 B를 사운드 A 스럽게 만들어준다는 얘기다. 이게 프로파일링 혹은 톤매치 기능을 가지고 있는 일부의 기타 이펙트에 해당한다.




처리과정은 다음과 같다.




1) 입력신호를 FFT하여 각 frequency bin의 응답을 찾아내고 그 power를 계산한다. 

2)이 때 FFT window를 적당히 overlap하면서 이 작업을 수행한다.

3) matched EQ에서는 대부분 이렇게 매번 얻어낸 해당 frequency bin의 signal power의 maximum을 취한다.




이 과정을 통해서 두 개의 사운드 클립 A,B의 spectral mask를 계산한 뒤에 A의 mask를 B의 mask로 나눠주게 되면, 그 결과가 얼마나 EQ를 통해서 boost해주어야 할지에 대한 결과 값이 된다. 




대부분의 matched EQ 기능에는 해당 결과값을 얼마나 반영해주어야 할지, 또 그 결과를 얼마나 smoothing해야 할지 (강제로 frequency bin의 수를 줄임)를 조정할 수 있다.




효과는 미지수다. 대부분 스피커 캐비넷의 효과를 노리고 시도하는데 앰프 사운드가 비슷해야 어느 정도 효과를 보고 그렇지 않으면 의도하지 않은 엉뚱한 결과를 얻게 된다. 








