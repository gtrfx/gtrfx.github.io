---
layout: post
image: /assets/images/140610cb54e256defec398d7f64f8387.png
title: "Accurate Tube C Model"
author: "Keith"
---


실제로 SPICE를 쓰면 plate follower를 제대로 simulation 할 수 있다. 문제는 사용하기 불편하고 맘대로 바꿔쓰거나 결과를 이용하기가 쉽지 않다는 것이다. 기본적으로 이것이 대부분 상용인 것은 말할 것도 없고 말이다.




그런 이유로 MATLAB이라든가 C로 모델해서 사용하는 방법을 쓴다. 어차피 approximated C model로 만들게 될 것이므로 어떤 방법으로 근사화할 지 모르겠으나, 적어도 다양한 reference data가 요구되므로 이를 만들기 위해서도 accurate C model은 꼭 필요하다.




- Tube model




Tube data sheet에 나오는 곡선들과 가장 가깝게 matching되는 모델이 Norman Koren이란 사람이 만들어놓은 모델이다. 그만큼이나 복잡하고 많은 parameter를 가지고 있다. 어차피 실제 구동용 모델로 쓰는 것이 아니라 데이터를 만들어내기 위한 모델이므로 뭐가 되든 사실 상관없다. 단지 필요한 tube type에 대해서 비교적 실제와 근사한 값을 얻어낼 수 있으면 그만이다.




일단 대략적으로 만들어놓은 C model을 이용해서 얻은 기본적인 curve들이다. 가장 빈번히 사용되는 12AX7의 Ip, Ig, 그리고 12AU7의 Ip이다. 그림을 보면 알겠지만 12AU7은 12AX7에 비해 전압증폭률은 낮으나 상대적으로 낮은 Vpk에도 플레이트 전류를 많이 흘리는 특징이 있어서 그림이 앞쪽으로 쏠려있는 것을 알 수 있다. 대략적으로 이 정도의 결과가 얻어졌다면 만족스럽다고 볼 수 있겠다.






![image](/assets/images/140610cb54e256defec398d7f64f8387.png)Plate Current vs. Plate-Cathode voltage (12AX7)






![image](/assets/images/bc93814a7fb05db467b89ea95b805222.png)Grid Current vs. Grid-Cathode voltage (12ax7)







![image](/assets/images/f115ec86cb448cf2f5105ec13c382abc.png)Plate Current vs. Plate-Cathode Voltage (12AU7)




동일한 모델에서 parameter만 바꿔서 pentode model에 대한 기본적인 곡선도 아울러 뽑을 수 있다. 빈번히 사용되는 6L6GC와 EL34의 plate current 곡선을 나타낸 것이다. 대략적으로 이 정도의 정확도라면 큰 문제가 없을 것으로 판단된다.




![image](/assets/images/c3fa374cb06320853a0eb5103c65d903.png)Plate Current vs. Plate-Cathode Voltage (Vg2k=450 V, 6L6GC)


![image](/assets/images/efe7316dc9c9c7f4542924abb502def2.png)Plate Current vs. Plate-Cathode Voltage (EL34)





