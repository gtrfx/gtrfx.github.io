---
layout: post
title: "Cascade Integrator Comb filter"
categories: technology
---

CIC filter라고 부르는 필터가 있다. 이 필터의 용도는 oversampling 혹은 downsampling을 할 때 image에 의해 신호가 왜곡되는 것을 막아주는 필터이다. 쉽게 말해서 그 자체가 oversampler이거나 downsampler 역할을 한다. 

이 필터의 주된 장점은 oversampling/downsampling ratio를 변경하더라도 필터 설계를 바꿔줄 필요가 없고, 일반적인 FIR/IIR 필터처럼 곱하기를 사용하지 않는다. 순수하게 더하기와 메모리 (레지스터)만을 사용해서 oversampling/decimation 시의 image만을 제거한다.

이러한 필터에서도 단점은 있으니 그것은 passband signal의 일부가 뭉개진다는 것이다. FIR filter나 IIR filter처럼 passband에 ripple이 있다거나 하진 않지만 bandedge에서 신호가 깎여나가는 단점이 있다. 그러나, 이 필터 덕택에 수많은 디지털 오디오에서 오버샘플링이 쉽게 가능했다. 