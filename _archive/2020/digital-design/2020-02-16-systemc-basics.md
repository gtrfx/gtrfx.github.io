---
title: "SystemC와 기본 형식"
tags: [hls, systemc]
layout: post
author: "Keith"
---

사실 문법이라고 해봐야 C++을 따라가는 것이고, 최소한 어떤 형식을 갖춰야 빌드 시스템이 알아서 원하는 결과를 만들어줄 수 있기 때문에 그것은 어쩔 수 없이 따라야 한다. 그런데 C++의 문법을 빌어쓰면서 몇 개의 macro가 고작인 이것을 가지고 뭔가 하드웨어의 동작을 기술하라고 하면 정말 이해도에 따라 별에 별 말도 안되는 경우가 다 나올 수 있겠구나 하는 생각을 할 수 있다. 잘은 알 수 없지만 이미 제공하고 있는 여러 가지 예약어들을 보면 '이거 뭔가 중구난방식으로 되어있는거 아니야?' 하는 느낌을 받는다. 다시 말해 중복된 기능이나 의미를 갖는 예약어들이 꽤 많다. 그래서 '이 정도로 모호하게 될 수 밖에 없다면 그냥 verilog로 하는 게 낫겠는데?' 하는 결론을 또 얻게 된다.

일하는 순서는 사실상 HDL의 그것과 같다.

1. 모듈을 정의한다.
2. 모듈의 architecture (입출력/핀수 등등) 결정한다.
3. 모듈의 behavior를 규정한다.

나머지 작업은 다른 모듈과 연결해주고 검증을 위해서 이것 저것 시스템을 꾸미는 노가다가 된다. 

#### thread?

SystemC에서 어떤 동시성(?), 그러니까 하드웨어의 작업이 동시에 돌아가고 있음을 표현하는 것을 multi-thread의 개념으로 본다. 다시 말해서 순차적으로 돌아가는 어떤 하나의 작업을 하나의 thread로 본다. 따라서 하나의 모듈에 동시에 돌아가고 있는 일이 여러 개 있다면 이 thread가 여러 개가 되는 것이다. 물론 pthread를 쓸 때처럼 CPU의 thread 개수에 영향받거나 할 일은 없다. 어차피 가상적으로 동시에 실행되고 있다고 보니까. 

#### wait??

SystemC에서 하나의 thread 안에는 wait()가 들어가 있다. 뭔가 triggering되는 것을 기다렸다가 돌게 된다 그런 의미가 되는 것 같다. (뭔가 좀 허접하단 생각이 들긴 한다.) wait를 통해서 FSM의 동작을 묘사하기도 하고 pipeline이 구현되는 것처럼 기술할 수도 있다. 좀 뭔가 허접해서 쉽게 이해는 되지 않지만 그러하다. 예제에서 확인해 보도록 하자.

#### 대략적인 형식

아주 간단하다. 다음과 같이 하면 된다. 

```
SC_MODULE (module_name)
{
    SC_CTOR (module_name)
    {
        // 동작 방법에 따라서 어떤 함수 (=behavioral description)에 연결될지 기술한다.
    }
};
```

HDL를 이해하고 있으면 이것은 그냥 너무 뻔한데, 그래도 막상 하려고 하면 잘 기억이 안날 수 있어서 누군가 만들어놓은 template을 가져다 하면 된다. (이쪽 일이 다 좀 그렇다.)

1. SC_MODULE: 이것은 C++의 class와 같다. 이 안에 입출력 데이터나 behavior를 규정하는 함수의 prototype을 써넣으면 된다. 
2. SC_CTOR: 이것은 constructor를 의미한다. 이 안에 어떠한 방법론으로 구현할 것인지 규정을 해야 한다. 

생각보다 간단하다. class definition에서 구조를 결정해주고 Constructor에서 어떻게 돌릴지 결정해주고 세세한 것 (behavioral description) 은 각각의 함수에서 해주면 된다.

#### Methods

SystemC에서 보고 있는 method는 3개인데 이것도 좀 뭔가 좀 그다지 strict하지는 않다.

1. SC_METHOD: 사람마다 정의가 좀 다른데, 이것은 그냥 쉽게 말해서 clk과 상관없이 정해진 일을 하는 경우를 말한다. 쉽게 생각해서 그냥 clock과 상관없는 combinational logic이 그냥 입력에 반응하는 경우를 생각하면 맞을 듯 하다. 
2. SC_THREAD: 위에서 말한 thread에 해당한다. 순차적으로 돌아가는 어떤 작업 하나를 정의해준다. 
3. SC_CTHREAD: clocked thread라고 해서 clk에 의지하여 돌아가는 thread를 정의한다. argument가 function 말고도 하나 (thread activation용도의 신호) 더 붙는다.

이렇게 보면 3개까지 있어야 되는 건가? 싶을 정도로 좀 뭔가 모호한데, 그것은 처음에 한가지를 만들었다가 그것만으로는 뭔가 좀 부족하다 싶어서 하나 하나 늘려가다보니까 이렇게 애매하게 3개가 된 것 같다는 생각이 든다. 사람들마다 특별히 구분없이 쓰는 놈, CTHREAD만 쓰는 놈 여러 가지다. 어떤 의미를 잘 따져서 생각해보자면 특별히 모듈과 모듈을 결합한다거나 간단한 combinational logic 구실을 하는 것을 기술하는 게 아니면 항상 CTHREAD로 기술하는 것이 맞지 싶다. 대부분 rst에도 반응해야 되고 clk에 동기되어 움직여야 되는 일이 대부분이니까 말이다. 

#### 예제

클럭과 상관없이 돌아가는 모듈의 예이다. 참으로 간단한 것 같지만 사실 verilog로 같은 일을 하는 것에 비해서 공수가 더 들어간다. METHOD는 사실상 시간의 개념이 빠져나간 기술 방법이다.

```
SC_MODULE (wtf)
{
    sc_in<sc_int<13> > in0, in1;
    sc_out<sc_int<14> > out0;

    void main()
    {
        out0.write(in0.read()+in1.read());
    }
    SC_CTOR(wft)
    {
        SC_METHOD(main);
    }
}
```

위의 것을 thread로 만든 것이다. thread는 말 그대로 thread라 하는 일이 없어도 돌고 있는 의미를 전달해야되기 때문에 while (true)를 쓴다. 시간 개념은 있는 것 같은데 뭔가 좀 불명확하다. 어쩌자는 건지.
```
SC_MODULE (wtf)
{
    sc_in<sc_int<13> > in0, in1;
    sc_out<sc_int<14> > out0;

    void main()
    {
        while (1)
        {
            out0.write(in0.read()+in1.read());
            wait();
        }
    }
    SC_CTOR(wft)
    {
        SC_THREAD(main);
    }
}
```

아래는 clock의 positive edge에 맞춰 돌아가는 경우의 예의다. 이건 뭔가 좀 더 명확해진 듯 하다. 
```
SC_MODULE (wtf)
{
    sc_in<bool> clk, rst;
    sc_in<sc_int<13> > in0, in1;
    sc_out<sc_int<14> > out0;

    void main()
    {
        // when reset,
        out0.write(0);
        while (1)
        {
            out0.write(in0.read()+in1.read());
            wait();
        }
    }
    SC_CTOR(wft)
    {
        SC_CTHREAD(main, clk.pos());
        reset_signal_is(rst, true);
    }
}
```

사실상 위 3가지 경우에 대해서 하드웨어의 크기나 처리 결과엔 큰 차이가 없다. 주변에 뭔가가 달라붙어서 같이 돌게 되면 분명히 명확하게 기술한 것이 원하는 결과를 잘 내어줄 것이라고 보면 될 것 같다. 

#### 나머지

나머지는 검증을 위한 testbench를 위해서 별도로 module을 만들어서 붙이거나, 아니면 그냥 직접 해당 모듈에 stimuls를 입력해서 넣을 수 있다. 

그렇다고 보면 systemc 상에서의 main function을 다음과 같이 작성한다.

```
int sc_main(int argc, char **argv)
{
    // blah blah blah
    return 0;
}
```

VCD wave를 만들어주기도 한다. 

```
tf = sc_core::sc_create_vcd_trace_file("trace_data1"); 
tf->set_time_unit(10, sc_core::SC_US);
```

딱 눈치챌 수 있겠지만, file을 open해서 file handler (file pointer)를 넘겨주는 거라 다음과 같이 닫아주어야 한다. 

```
sc_close_vcd_trace_file(tf);
```

사실 이게 좀 뜬금없는 게 어차피 C로 작성한 이상 짜고치는 고스톱이 되는 것인데, synthesis하는 툴이 있으면 이게 사실상의 검증과정이 되니까 의미가 있다고 볼 수도 있다. 제대로 된 검증 작업은 검증을 전문으로 하는 사람들에게 맡겨도 되지만, 역시나 로드가 계속 불어나기 때문에 기왕이면 혼자 다 해결하는 게 속편하기도 하거니와 일처리면에서도 훨씬 빠르지만, 사람이란 게 실수하게끔 되어있는지라 peer가 2-3명 정도는 있는 게 훨씬 바람직하다고 볼 수는 있다. 

오늘은 여기까지.
