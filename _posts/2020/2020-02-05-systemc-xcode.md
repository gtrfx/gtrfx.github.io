---
title: "Systemc + Xcode"
tags: [systemc, xcode]
---

If you want to program systemc with xcode, you'll face the following errors.

0) installing systemc
1) include/library path issue
2) systemc version issue

Here are the solutions

1) systemc installation

You can install systemc with brew.
```
brew install systemc
```

As of now, its version is 2.3.2 not the latest one (2.3.3), however it doesn't matter.

2) include/library path 

When you install systemc with brew, headers and libary files will be located at
```
/usr/local/Cellar/systemc/2.3.2/include
/usr/local/Cellar/systemc/2.3.2/lib
```

Just add them into your build setup.

3) SystemC version issue

When compiling your systemc files, there might be several issues unless you specify its version. Suppose that you've installed systemc with brew, it'll support 199711 version of c++, so that you need to add the followings to the build flag (CXXFLAGS).

```
-DSC_CPLUSPLUS=199711L
```

or the definition below just before "#include <systemc>" in your systemc file.

```
#define SC_CPLUSPLUS 199711L
```

There you go.