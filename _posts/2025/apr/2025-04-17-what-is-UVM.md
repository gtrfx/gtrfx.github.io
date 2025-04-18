---
title: "UVM이 뭘까?..."
tags: [study]
layout: post
author: "Keith"
---

Universal Verification Methodology의 약자인데, 기존의 주먹구구식 test bench로 걸러내지 못하는 문제를 걸러내겠다라는 목표로 구성됨

구성요소:    
- Data item (Transaction):    
테스트에서 사용하는 입력 단위이며, 의미 있는 랜덤화를 통해 효율적인 검증을 하도록 함
- Driver (BFM):    
트랜잭션을 실제 신호로 변환해 DUT에 입력하는 역할
- Sequencer:    
주요 기능:    
	- DUT의 현재 상태에 반응하는 자극 생성
	- 트랜잭션 간의 순서를 정의하여 구조적이고 의미 있는 시나리오 생성
	- 시간 모델링 지원 → 복잡한 테스트 시나리오에 유용
	- 선언형/절차형 제약 모두 지원
	- 여러 인터페이스 간 동기화 및 제어 가능
	- 레이어드 시퀀서 구성 가능 → 프로토콜 계층 모델링
- Monitor:    
주요 기능:     
  - 트랜잭션 수집: 버스 신호를 추출해 구조화된 트랜잭션으로 변환     
  - 이벤트 추출 및 알림: 트랜잭션 발생을 감지해 다른 컴포넌트에 알림     
  - 프로토콜/데이터 체크 및 커버리지 수집     
  - 옵션으로 trace 출력 가능     
- Agent:      
driver, sequencer, monitor를 하나로 묶은 단위 (container)
- Environment:    
주요 역할과 특징:
	- config을 통해 topology와 동작을 유연하게 설정 가능:   
	예: 재사용 시 active agent를 passive agent로 전환
	- Bus-level monitor는 개별 agent와 무관한 전역 동작에 대한 체크 및 커버리지 수집 담당
	- Agent의 monitor는 이 전역 monitor가 수집한 데이터와 이벤트를 활용할 수 있음
	- uvm_env 클래스는 유연하고 재사용 가능한 구조를 제공하며,
	- 랜덤 트래픽 생성, DUT 응답 모니터링, 프로토콜 유효성 검사, 커버리지 수집을 담당