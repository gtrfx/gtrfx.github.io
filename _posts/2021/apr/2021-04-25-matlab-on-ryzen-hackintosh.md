---
title: "MATLAB 2020b on Ryzen Hackintosh"
tags: [matlab]
---

결론:
- libtbb/tbb* 관련 library 삭제, libiomp5 삭제 혹은 intel_fast_memset patch, 후자는 유사품으로 교체
- brew install openblas 후에 설치한 blas/lapack library를 각각 refblas.dylib, mllapack.dylib으로 symbolic link로 만들어 연결함. 어디에? <matlab folder>/bin/maci64에..




