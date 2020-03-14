---
title: "mingw32: byteswap.h 없을 때"
layout: post
tags: [mingw32, byteswap]
---

급할 때 다음을 갖다 붙이자. 아무 문제 안생긴다.

Mac에서도 없다고 할 때가 생기면 마찬가지로 파일 하나 만들고 다음을 그냥 갖다 붙이자. 별 문제 안생긴다.

왜? intel (AMD64)로 돌아가는 머신에서 사용할 것이니까.

```
#if HAVE_BYTESWAP_H
#include <byteswap.h>
#else
#define bswap_16(value) \
((((value) & 0xff) << 8) | ((value) >> 8))

#define bswap_32(value) \
(((uint32_t)bswap_16((uint16_t)((value) & 0xffff)) << 16) | \
(uint32_t)bswap_16((uint16_t)((value) >> 16)))

#define bswap_64(value) \
(((uint64_t)bswap_32((uint32_t)((value) & 0xffffffff)) \
<< 32) | \
(uint64_t)bswap_32((uint32_t)((value) >> 32)))
#endif
```