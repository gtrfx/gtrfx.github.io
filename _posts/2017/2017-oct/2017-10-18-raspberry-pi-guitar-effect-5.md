---
layout: post
title: "Guitar Amplifier Simulator on Raspberry Pi (5)"
categories:
    - project
author: "Keith"
---

현재 매일 같이 퇴근 후에 이것 저것 실험 중에 있는데 얻은 결론은
- 회로 시뮬레이션을 하는 모델의 경우 RPI3으로 하기에 성능이 좀 모자름:
    - 소프트웨어를 보다 최적화해야 하는 것은 하는 것이지만, 초기부터 이 정도면 하드웨어가 그다지 적합하지 않다는 것임
    - multi-threading을 하기에도 직렬 구성의 이펙트 셋업이면 역시 성능이 모자라서 포기하게 될 가능성이 높음
- Profiling amplifier 구성의 알고리즘을 사용하면 공간계 이펙트를 붙일만한 여유가 있어 보임
    - 최적화를 많이 하지 않았지만 성능상의 여유가 꽤 있고, 콘트롤이 단촐해지는 장점이 있다.

아직 풀리지 않은 문제는 다음과 같다.
- 오디오의 잡음 문제
- 외장 케이스를 어떻게 구성하느냐의 문제
- 외장 디스플레이의 문제
- 컨트롤의 문제
- 앰프 내장 여부의 문제

어차피 나 혼자 사용할 것이고 어디 가서든 캠퍼 프로파일링 앰프 만은 못해도 그 핵심 기능은 대부분 그대로 가져갔음 해서 대충 생각하고 있는 것은
- USB audio card의 전원을 내부에서 isolate 실험 해볼 생각:
    - dongle type의 USB isolator가 잡음 제거에 효과적이었다/아니다 의견이 분분함
    - LC filter도 내가 실험해 본 바로는 큰 도움이 되지 않았음
- 도시락 크기보다 약간 작은 stombox 사용:
    - USB 사운드 카드를 어떤 것을 쓰냐가 가장 큰 영향을 미침
- 디스플레이는 1602 LCD가 적당할 것으로 보임:
    - Stompbox type의 기타 앰프 시뮬이므로 디스플레이를 위한 공간이 없음
    - 고작해야 볼륨에 대한 숫자와 Patch Name만 표시할 생각임 (매우 비좁음)
        - 첫번째 줄: patch name (16 characters)
        - 두번째 줄: input clip(1), input volume (3), output volume (3), output clip(1), bypass(1), distortion(1), cabsim (1)
    - input clip/output clip에 대한 표시도 필요함 (공간이 거의 없음)
- 컨트롤은 로터리 엔코더 이상의 대안이 없음:
    - 로터리 엔코더를 3개 정도 붙이면 될 것으로 판단됨 (버튼 포함)
        - 버튼 #1: patch browsing, bypass on/off
            - Kemper profile은 커봐야 4kB이기 때문에 엄청나게 많은 패치를 넣어둘 수 있음
            - 로터리 엔코더가 이 많은 패치 중에 필요한 것을 고르는데 가장 편리함
        - 버튼 #2: input volume (gain), dist on/off
            - profiling type의 guitar amplifier에서는 할 수 있는 게 이것 밖에 없음
        - 버튼 #3: output volume, cabsim on/off
            - 외부 앰프/PA와 연결할 때 볼륨을 매칭할 필요가 있음

기타 입력 1포트, 출력 2포트: audio output, speaker output (ampliified output)

이 정도면 적당할 것으로 본다. 공간계 이펙트에 대한 컨트롤은 당장에 별 대안이 없다. 잘해야 웹 인터페이스로 꾸미는 것이다. 