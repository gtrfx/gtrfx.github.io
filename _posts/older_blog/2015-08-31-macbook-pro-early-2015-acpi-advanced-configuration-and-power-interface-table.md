---
title: "Macbook Pro Early 2015, ACPI (Advanced Configuration and Power Interface) table"
---
# Macbook Pro Early 2015, ACPI (Advanced Configuration and Power Interface) table


UEFI가 되는 소형컴퓨터와 랩탑으로 잇따라 바꾸게 되면서 DSDT (컴퓨터 하드웨에따라 제조사가 따로 만들어놓은 테이블/특성표/특성을 알려주는 프로그램)patching을 피치 못하게 하게 되면서 ACPI에도 눈을 뜨게 되었다. 생업은 잠시 미뤄두고. 좋아하던 취미들도 다 미뤄두고. 여름에 컴퓨터가 죄다 뻗어 버리게 된 것이 화근이다. 컴퓨터를 위한 컴퓨팅이란 이런 것을 말하는 거다. 설치하고 패치하고 - 엄밀히 말해서 업체가 하는 일을 내가 하는 것이다. 일부러 어려운 루트를 선택해서 말이다.




ACPI라는 것은 BIOS에 붙어있는 작은 규모의 펌웨어라고 할 수 있을 것 같다. 가장 좋은 예로 컴퓨터에서 슬립 명령을 내리면 내부 장치들을 어떻게 꺼두고 외부의 입력이 들어오면 어떻게 깨어나는지, 또 컴퓨터에 붙어있는 자잘한 장치들 - USB 포트, 디스플레이 장치, 사운드카드 등등 - 의 전력제어라든가 OS가 장치 종류를 물어봤을 때 어찌 대답해주어야 할지 등등을 프로그램의 형태로 만들어놓은 것이다. 이것도 일종의 언어라 컴파일을 하고 하드웨어 혹은 OS에 의하여 호출되어 실행된다.




DSDT를 패칭한지는 따지고 보면 꽤 되는 것 같다. 그런데 최근에 내가 알게 된 사실은..




1) DSDT를 compile 혹은 dis-assemble하는 과정이 있는데, disassemble시에 undefined symbol들이 나온다는 것이다. 이것은 당연한 일이다. 윈도우즈용 PC에 들어가 있는 DSDT 미완성이다. OS가 로딩되면서 모자른 DSDT를 채워주게 된다. 무슨 말이냐면 OS가 필요에 따라 DSDT 세팅을 바꾸어줘야 하기 때문에 DSDT에 모든 내용이 완벽하게 기술되지 않는다는 것이다. 




2) ACPI가 OS의 버전에 따라 달리 반응한다. ACPI 프로그램을 읽어보면 OS version에 따라 동작을 다르게 정의해놓은 부분이 여러 부분 존재한다. 하드웨어 버전에 따라서 달리 반응하게 되어있는 부분도 있다. 우리가 잘 아는 2개의 VGA가 있는 경우 (내장/외장)의 처리 방법도 정의되어있기도 한다. 이 말은 제조사에서 DSDT도 유니버설하게 만들어놔서 다양한 모델에 쓰기 위함이라고 이해할 수 있다.




3) 해킨을 하는 경우에는 긍국의 지향점은 Macbook 혹은 iMac의 ACPI table (DSDT/SSDT/...)과 가장 유사하게 패칭하는 것이다. 매우 깔끔하게 짜여있어서 윈도우 PC에 들어있는 지저분한 ACPI table과는 매우 다르다. 




애플에서 나온 하드웨어는 어떠한 ACPI 테이블을 가지고 있는지 올려놓기로 한다. 이것은 Macbook Pro early 2015 model에서 추출한 ACPI table이다. 요긴하게 활용하기 바란다.






[ macbook_all.zip](http://tonebrew.tistory.com/attachment/cfile10.uf@2303703755E528C935D76A.zip)








