---
layout: post
title: "3GP RAN1 #51 Jeju Meeting"
---


LTE관련 내용을 요약하면..

- Uplink Reference Signals

UL DM RS Sequence Hopping (also for PUCCH)The number of hoppingpatterns for the base sequence groups is 504PUCCH sequence hopping is per slotThe assumption shall berevisited if there is a problem with respect to BER performance onACK/NACK PUCCH Cyclic Shift and Orthogonal Cover HoppingPUCCH cyclic shift hopping(per symbol) is always enabledPUCCH orthogonal coverhopping (per slot) is always enabledNumber of sequences per base sequence group for allocations larger than 5 RBs:One sequence could beselected in case of base sequence group hopping.In case of planning: 2sequences to enable sequence hopping within the sub-frame.This hopping can also be disabled.Values for SRS parameters (semi-statically configurable per UE, except possibly cyclic shift)Bandwidth used by a UEnarrowband SRS (2 RB in 6 RB system bandwidth, 2, 4 or 6 in >6RB system bandwidth), except PUCCH regionwideband SRS: exact values to be defined, including whole available BW, except PUCCH regionDuration One shot and indefinite (valid until disabled or until the session ends) transmissionsPeriod: 2, 5, 10, 20, 40, 80, 160, X msThis assumption shall be revisited if problems occur with multiplexing SRS with different transmission periods. X is not defined at this stage (FFS)Cyclic shift: 3 bits. FFS how to support less than 8 cyclic shiftswith maximum separation
- Downlink Control Signaling

Narrow bandwidths: Use a bitmap with 1 RB resolution for system bandwidths less than or equal to 10 RBCan be reconsider if problems are found with PDCCH designBitmap granularity for approach 1Adopt the values in below table as working assumption. Group size
System bandwidth         
  1
≤10
  2
11 – 26
  3
27 – 64
  4
65 – 110
  
Method for approach 2Use a bitmap for approach 2 (details remain tobe settled during afternoon session)Resource allocation for Compact DL grant The compact DL grant supports localized and distributedallocationsThe compact DL grant includes a 1‑bit flag indicating alocalized or a distributed contiguous resource allocationThe same resource allocation signalling method adopted for theUL grant is also used for the compact DL grantThe resource allocation signalling method consists of Starting VRB number 
Number of consecutive VRBs 

PHICH inclusion in interleaving:No change in working assumptionCCE-to-RE mapping for PHICHPHICH duration: 1 bit on PBCHPHICH resource: 2 bits on PBCHFFS whether more than 2 bits are needed for TDDInterleaver designSubblock interleaver (asalready defined in 36.212, section 5.1.4.2.1) is the working assumptionIf it is shown at the next meeting that problems exist with this interleaver, then select Costas- Uplink Control Signaling

In subframes where the eNB scheduler avoids that ACK/NACK and CQI occur simultaneouslyTransmit CQI or transmit ACK/NACKas normalIn subframes where the eNB scheduler does not avoid that ACK/NACK and CQI occur simultaneouslySend CQI and ACK/NACK in onesubframeTDM of ACK/NACK and CQIRS modulated with rank or ACK/NACKDropping of CQI can beallowed (configured) by the eNBJoint coding of ACK/NACK and CQIWith embedded sequencesWith (32,10) RM codeDropping of CQI can beallowed (configured) by the eNBCDM of ACK/NACK and CQI (selection of sequences or implicit ACK/NACK in RS)Dropping of CQI can beallowed (configured) by the eNBDrop CQI and send only ACK/NACK 
Way forward:
Insubframes where the eNB scheduler does not avoid that ACK/NACK and CQI occursimultaneously
For short CP:ACK/NACK signalled using RSCQI coding: Punctured RM or Golay code, exact rode rate TBDDropping of CQI can be allowed (configured) by the eNBDetails and performance to beprovided until next meeting on:Solution for high speedsDTX detectionFor long CP:Joint codingPunctured RM or Golay code, exact rode rate TBDEmbedded coding (refer to R1-074656)Dropping of CQI can be allowed (configured) by the eNBDetails and performance to beprovided until next meeting on:DTX detection- Mappingof virtual resource blocks to physical resource blocks

Q1: 1 bit (or state) in the DL assignment indicates DVRB transmission. FFS if DVRB transmission is only supported in certain DL assignment formatsQ2: Dynamic DVRB transmission is derived from DL assignment and known information. No semi-static information(except for Nd).FFS whether gap value would beprovided semi-staticallyQ3: A cell-specific mapping for Nd=3 is specified (if we can agree on one mapping).(Q4) Discuss the exact mappingscheme and exact signalling offline. After revisiting the issue on Friday9th, use the proposal as in R1-075084 as basis for furtherdiscussions until November 23rd.Evaluation of gains with Nd=3: To be revisited on Friday 9th (See below).
- RACH

·Cyclic shift restriction method for high mobility cells:
o Use the set of equations (1.1)to (1.6) in R1-074977 to specify the restricted set of cyclic shifts. 
·PRACH for 1.4MHz
o eNB transmits only channelswhich do not require ACK/NACK transmission and allow PUCCH to coexist withPRACH (i.e. no specification change needed)
·Frequency Hopping for PRACH(for PRACH > 1.4MHz)
o Define two PRACH frequencyregions next (inside the UE TX bandwidth) to PUCCH
o PRACH hops between this twofrequency regions
·Hopping period: FFS: 10ms or40ms.
·PRACHHigh-Speed Ncs Values
o Proposal in R1-075058 is agreed.
o 15HS Ncs values: 
§{15,18, 22, 26, 32, 38, 46, 55, 68, 82, 100, 128, 158, 202, 237}

MAX Number of HARQ Processes: 8

- Power Control
PUSCH formula
Values of absolute commands f(delta_i): [-4, -1, 1, 4]Two different Po values can be signalled for persistent and dynamically scheduled transmissions, respectivelyIn case the UE receives both absolute and accumulative commands,the absolute command resets the closed loop correction value to the current absolute valueImplicit power control based on PHICH ACK/NACKNot being considered at themoment, but if coverage problems are identified with the currentmechanisms, then this can be revisitedPower control over retransmissions: requires further discussionSignalling of PC parameters:
Po signalled with 6 bits for PUSCHPo = Po_nominal_dBm + Po_user_i_dBPo_nominal_dBm is sent viacell BCHrange of -126 dBm to 24 dBm in steps of 1 dBPo_user_i_dB is sent via RRCsignaling; it is used as an additional power offset to Po_nominal_dBm bythe UE4 bits are used to represent a dynamic range of -8 dB to 7 dB in steps of 1 dBDelta_mcs_puschCell specific values are signalledby higher layers: how many values and what range is FFSPo is signalled with 5 bits for PUCCHDynamic range [-127,-96]Cell specific signalled viacell BCHDelta_mcs_pucchCell specific values are signalledby higher layers: how many values and what range is FFSSelection between absolute and accumulative PUSCH PC commands1 bit, UE specific (RRC)Alpha for PUSCH3 bits, cell specificPower headroom is reported as the power headroom estimated by the UE. Time relation to the occurrence of the power headroom measurement is to be specified.DL power controlDL power scaling: requiresfurther discussion

[ Draft_ReportWG1#51_v010.zip](http://tonebrew.tistory.com/attachment/cfile23.uf@2655903458710AC52F2B3A.zip)


