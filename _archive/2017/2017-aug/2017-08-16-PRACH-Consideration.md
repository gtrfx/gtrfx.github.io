---
layout: post
title: "Consideration on PRACH Detection Design"
categories:
    - technology
    - 5G
author: "Keith"
---

##	Physical random access channel and random access procedure
### PRACH preamble format details for long/short sequence length

Include discussion and evaluation based on email discussion [89-16], whether/how to support restricted set, etc. Limit to 1 contribution per 1 company/organization/university

#### Agreements:
* Confirm the working assumption on supporting format 3
* For formats with L=839
   * Unrestricted sets are supported
   * For restricted sets
        * 1.25 kHz: Restricted set A supported, Restricted set B is FFS 
        * 5 kHz: Restricted set is supported with FFS if Restricted set A, B or both are supported
* For L=127/139 with option 1, formats with 1,2,4,6, and 12 OFDM symbols are supported
   * Number of symbols can be adjusted if problems are identified

## Way forward for PRACH preamble format for long/short sequences
#### Agreements:
* For 15 kHz subcarrier spacing,
   * Agree on following preamble formats A2, A3, B4
   * Working assumption on following preamble formats A0, A1, B0, B1, B2, B3, C0, C1


| Preamble format | # of Sequence | TCP | TSEQ | TGP | Path profile (Ts)| Path profile (us) | Maximum Cell radius (meter)| Use case |
|---|---|---|---|---|---|---|---|---|
| A0 | 1 |144|2048|0|48 |1.56 |469|TA is already known or Very small cell|
| A1 |2|288|4096|0|96 |3.13 |938|Small cell|
| A2|4|576|8192|0|144 |4.69 |2,109|Normal cell|
|A3|6|864|12288|0|144 |4.69 |3,516|Normal cell|
|B0|1|144|2048|0|48 |1.56 |469|TA is already known or Very small cell|
|B1|2|192|4096|96|96 |3.13 |469|Small cell|
|B2|4|360|8192|216|144 |4.69 |1,055|Normal cell|
|B3|6|504|12288|360|144 |4.69 |1,758|Normal cell|
|B4|12|936|24576|792|144 |4.69 |3,867|Normal cell|
|C0|1|1240|2048|0|144|4.69|5300|Normal cell|
|C1|2|1384|4096|0|144|4.69|6000|Normal cell|


   * Note 1: Unit is Ts, where Ts = 1/30.72MHz
   * Note 2: PRACH preamble are aligned with OFDM symbol boundary for data with same numerology
   * Note 3: Additional 16Ts for every 0.5ms should be included in TCP when RACH preamble is transmitted across 0.5ms boundary or from 0.5ms boundary
   * Note 4: For format A, GP can be defined within the last RACH preamble among consecutively transmitted RACH preambles
* For 30/60/120 kHz subcarrier spacing, preamble format can be scaled according to subcarrier spacing. 
   *	Ts =1/(2*30720) ms for 30 kHz subcarrier spacing 
   *	Ts =1/(4*30720) ms for 60 kHz subcarrier spacing
   *	Ts =1/(8*30720) ms for 120 kHz subcarrier spacing
   *	Note that some of the formats may not be applicable to all subcarrier spacings
