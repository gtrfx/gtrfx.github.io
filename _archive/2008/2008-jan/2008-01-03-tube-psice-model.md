---
layout: post
title: "Tube PSICE Model.."
author: "Keith"
---

PSPICE 모델의 특성상 극악 환경에 대한 시뮬레이션은 불가한 것으로 보여진다.

요새 tube를 몇 개 넣고 실험해보고 있는데, max. plate current 한도가 없이 전류가 흘러버리는 문제가 있다. 좀 어이가 없는 것인데, 12AX7이 10mA가 넘는 전류를 흘리는 경우도 있다. (max는 8mA임)

따라서, bias에 따른 saturation현상은 잘 나타나는 반면, max. current 한계가 없이 전류를 흘려 실제와는 다른 시뮬레이션 결과가 나타나는 것을 확인할 수 있다.


