---
layout: post
title: "AppleIntelCpuPowerManagement.kext...."
author: "Keith"
---

MacOS kernel이 부팅할 때 보면, 제목의 kext를 불러오게 된다. 그러나 NullPowerManagement.kext를 불러다쓰는 일반 해킨토시에서는 AppleIntelCpuPowerManagement가 로딩되려다가 timed out 메시지를 내뿜으며 포기하게 된다.
그 이유인 즉슨 AppleIntelCpuPowerManagement가 IntelCpu의 Speed Step을 조정하며 말 그대로 전력 소비를 관리하는 kext인데, 이게 HPET가 지원되지 않는 일반 PC들에서는 kernel panic을 일으킨다거나 각종 debug 메시지를 내뿜으며 귀찮게 하기 때문이다. 그러나 데스크탑이나 노트북이 정상적으로 작동하기 위해서는 Cpu Power Management가 되어야 한다. 데스크탑의 경우는 파워가 AC inlet으로부터 공급이되니 CPU를 full throttle 상태로 놓아도 상관없겠다 생각할지 모르지만, 과다한 발열이 문제가 되는 것이다. 특히나 배터리를 사용하는 노트북의 경우는 말할 필요가 없을 뿐더러, Cpu가 항상 full throttle 상태가 아닐 거라는 가정하게 만들어진 노트북의 경우 (특히나 냉각 팬이 달리지 않았거나 달렸다하더라도 부실한 놈들) 과열로 시스템이 뻗어버리는 일이 발생하게 되는 것이다.
아마도 이 power management를 효율적으로 하기 위하여 timer가 필요한 것으로 짐작이 되어진다 (왜냐? kext를 까보진 못했으니까). HPET(High Precision Event Timer: 고 정밀 이벤트 타이머)는 intel의 유명한 timer 8253(8254)가 발전된 형태라 한다. 아마도 비슷한 형식으로 timer의 count를 start/stop할 수 있게 되어있을텐데, base clock frequency가 높아서 매우 정밀한 초재기가 가능한 회로라고 보는데, 이것이 North bridge에 들어있는 보드가 있고 그렇지 않은 보드가 있기도하고 바이오스에 따라서 이것이 제대로 세팅되어있는 것이 있는가하면, 그렇지 않은 것들이 있다고 한다.
내가 가지고 있는 PC 3대 중에서 최근에 구입한 것을 빼면, HPET의 활성화 옵션이 BIOS에 없거나 제대로 지원이 안되는 것으로 확인이 된다.
혹여 해킨의 부팅시에 AppleIntelCpuPowerManagement.kext와 관련하여 timed out 메시지가 나는 것에 대해 궁금한 분들은 /Extra 폴더에 들어있는 NullPowerManagement.kext를 비활성화해놓고 부팅해보시라. HPET 및 ACPI가 제대로 구현되어있는 보드/BIOS 조건이라면 문제 없이 부팅될 것이다. 아마도..^^

