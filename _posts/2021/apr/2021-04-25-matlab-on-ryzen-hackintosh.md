---
title: "MATLAB 2021b on Ryzen Hackintosh"
tags: [matlab]
---

2021b의 양상은 이전의 버전들과 다르다. 이전 버전은 끽해야 blas/lapack 관련 함수를 부를 때 그것들이 mkl 라이브러리에 있어서 원하는 결과를 얻지 못하는 정도에서 그쳤는데, 이번엔 상당히 노골적이 되었다.

아래에 보면 memset(아마로 mem alloc + clear)을 하기 위해 intel에서 만든 memset function을 사용한 것으로 보인다. bzero라고 하는 것과 같은 맥락이지 싶은데 ryzen에서는 AVX512가 지원이 안되니까 여기서 문제가 발생한 것이 아닐까 하는 생각을 해본다.  해결방법? CPU 기종을 AVX512가 지원이 안되는 옛날 기종으로 인식하게끔 조작해주거나 다른 라이브러리로 교체해주는 방법 뿐이다.


```
System Integrity Protection: disabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_PROTECTION_FAILURE at 0x00007ffee2593ff8
Exception Note:        EXC_CORPSE_NOTIFY

Termination Signal:    Segmentation fault: 11
Termination Reason:    Namespace SIGNAL, Code 0xb
Terminating Process:   exc handler [4767]

VM Regions Near 0x7ffee2593ff8:
    MALLOC_SMALL             7fa9e3700000-7fa9e3800000 [ 1024K] rw-/rwx SM=PRV  
--> Stack                    7ffeded94000-7ffee2594000 [ 56.0M] r--/rwx SM=PRV  
    Stack                    7ffee2594000-7ffee2d94000 [ 8192K] rw-/rwx SM=SHM  thread 0

Thread 0 Crashed:: Dispatch queue: com.apple.main-thread
0   libtbbmalloc.dylib                  0x00000001110e1dc1 _intel_fast_memset.A + 1
1   libtbbmalloc.dylib                  0x00000001110e1dc6 _intel_fast_memset.A + 6

Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x0000000111122820  rbx: 0x0000000000000000  rcx: 0x00000007189d97ff  rdx: 0x0000000000003fc0
  rdi: 0x00000001127dd040  rsi: 0x0000000000000000  rbp: 0x00007ffee2d8f8b0  rsp: 0x00007ffee2594000
   r8: 0x0000000000000001   r9: 0x0000000000000000  r10: 0x0000000000041002  r11: 0x0000000000000202
  r12: 0x000000011279d000  r13: 0x00000001127dd000  r14: 0x0000000000000000  r15: 0x000000010d6a2a00
  rip: 0x00000001110e1dc1  rfl: 0x0000000000010202  cr2: 0x00007ffee2593ff8
  
Logical CPU:     2
```

nm으로 들여다보니 생각보다 쉽게 해결할 수 없을 정도로 많은 함수를 가지고 있는 라이브러리다. 누군가 빌드해서 올려놓은 것으로 대체시켰다. 이번 또..

```
Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_PROTECTION_FAILURE at 0x00007ffee97ccff8
Exception Note:        EXC_CORPSE_NOTIFY

Termination Signal:    Segmentation fault: 11
Termination Reason:    Namespace SIGNAL, Code 0xb
Terminating Process:   exc handler [5178]

VM Regions Near 0x7ffee97ccff8:
    MALLOC_MEDIUM            7fcd9f800000-7fcda0000000 [ 8192K] rw-/rwx SM=PRV  
--> Stack                    7ffee5fcd000-7ffee97cd000 [ 56.0M] r--/rwx SM=PRV  
    Stack                    7ffee97cd000-7ffee9fcd000 [ 8192K] rw-/rwx SM=PRV  thread 0

Thread 0 Crashed:: Dispatch queue: com.apple.main-thread
0   libiomp5.dylib                      0x000000011e84c911 _intel_fast_memset.A + 1

Thread 1:
0   libsystem_pthread.dylib             0x00007fff203c6458 start_wqthread + 0

Thread 2:
0   libsystem_pthread.dylib             0x00007fff203c6458 start_wqthread + 0

Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x000000011e987900  rbx: 0x0000000000000000  rcx: 0x00000007389d97ff  rdx: 0x0000000000000001
  rdi: 0x000000010b6dbebb  rsi: 0x0000000000000000  rbp: 0x000000011e984560  rsp: 0x00007ffee97cd000
   r8: 0x0000000000000001   r9: 0x0000000000000024  r10: 0x0000000000000000  r11: 0x000000000000002b
  r12: 0x00007fcd9784d3e0  r13: 0x000000010b6dbebb  r14: 0x000000010b6dbe98  r15: 0x000000010b6dbe98
  rip: 0x000000011e84c911  rfl: 0x0000000000010202  cr2: 0x00007ffee97ccff8
  
Logical CPU:     10
Error Code:      0x00000006 (no mapping for user data write)
```

이것은 꼭 없어도 되는 것이니 일단 제껴놓는다. 그래서 또 실행. 이번엔 libtbb.dylib에서 같은 문제를 일으킨다. 역시 제껴놓으면 된다. 

이제 실행화면을 볼 수 있다.

이제 BLAS와 LAPACK의 문제가 발생한다. 행렬 연산을 하면 mllapack을 찾을 수 없다는 메시가 나온다. 어떻게 하냐고? 사제 lapack으로 대체해보니 내부적으로 assert가 뜨면서 죽어버린다. 답이 없다. 이번엔 뭔가 좀 심심치가 않다.

결론:
- libtbb/tbb* 관련 library 삭제, libiomp5 삭제
- libmwlapack/libmwblas를 다른 라이브러리로 대체하면 실행 불가능 (crash)
- 이들을 가만히 놔두면 lu 같은 연산을 사용할 수 없음 (사실상 죽은 것임)
- MKL_DEBUG_CPU_TYPE=5 안먹힘


