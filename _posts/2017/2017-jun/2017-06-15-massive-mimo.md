---
layout: post
title: "Massive MIMO"
---

### History

Massive MIMO의 역사는 Marzetta의 논문으로 거슬러 올라간다. 물론 이 전에 MIMO에 대한 논문들, 즉 Foschini같은 사람들의 논문들을 봐도 무조건 안테나의 수가 늘면 채널 용량이 증가한다는 얘기가 나온다. Marzetta에 와서 얘기가 달라지는 것은 내가 봐서는 크게 없다고 본다. 안테나의 수가 늘면 채널 용량이 늘어난다는 것에는 이견이 없다. 문제는 이것을 실제적으로 실현하려고 하고 있다는 것이다.  

#### Marzetta's paper

논문은 보다시피 information theory에 가까운 것들이고, '실제 어떻게 하겠다' 보단 '결국엔 되고야 만다'의 내용이기 때문에 뭔가 큰 것을 기대하면 안된다. 다시 말해서 안테나를 많이 달면 좋아질텐데 얼마나 좋아질 수 있는 건가? 에 대한 수학적인 해석이라고 보면 된다. 

[TL. Marzetta: Noncooperative Cellular Wireless with
Unlimited Numbers of Base Station Antennas](a7f18bd31ec6aa4535f89dcede1aee7b6614.pdf)

[TL. Marzetta: Capacity of a Mobile Multiple-Antenna
Communication Link in Rayleigh Flat Fading](hochwald_capacity_it.pdf)

[MASSIVE MIMO FOR NEXT GENERATION WIRELESS SYSTEMS](1304.6690.pdf)

[Scaling up MIMO: Opportunities and Challenges with Very Large Arrays](1201.3210.pdf)

### Standards

#### 3GPP:

**FD-MIMO (R13):**
[T36.897](TR36.897.pdf)


NR Massive MIMO (R15):

##### 관점

Massive MIMO에 대한 3GPP에서의 관점은 안테나의 수를 증가시키는데 이것을 layer의 증가를 위한 것이 아닌 beam-forming에 활용하려는 것이다. 

**DL:**


Downlink에서는 beam의 폭을 줄여서 간섭을 최소화하는 것이 목표이다. 그것을 위해서는 TDD에서는 link reciprocity를 활용하기 위해 antenna의 특성을 잘 알고 calibration/channel estimation해야 하는 문제가 있고, FDD에서는 UE가 가장 좋은 beam을 항상 feedback하여 gNB에서 tracking을 잘해야 하는 문제가 따르는데, 이를 위해서는 다음의 trade-off이 항상 따라다닌다.

- feedback overhead (interval/information)
- pilot overhead (reference signals)

**UL:**

Uplink에서는 다수의 안테나로 채집한 신호를 얼마나 잘 weighted combine하느냐가 문제이다. 이를 위해서 UE 별로 수신된 신호의 second-order statistics을 파악하고 그것으로 부터 ZF 혹은 MMSE beamforming을 적용하여 SINR을 극대화하는 것을 목표로 한다. 이것을 위해서 다음과 같은 문제가 남는다.

- how to collect 2nd order statistics for adaptive beamforming
   - update interval vs. mobile velocity
- frequency selective beamforming vs. wideband beamforming
- which one between ZF vs. MMSE gives better system performance?

### Implementation

#### LTE



#### NR (New Radio)

