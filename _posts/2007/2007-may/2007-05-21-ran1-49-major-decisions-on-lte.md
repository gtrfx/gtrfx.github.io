---
layout: post
title: "RAN1#49 Major Decisions on LTE"
author: "Keith"
---

1. PSC

PSC Length:
64 (LGE, Qualcomm)71 or 73 
PSCsequence and generation domain: 
Time domainTD ZC modulated by Hadamard sequence (LGE)Frequency domainFD ZC (Qualcomm if TDD issue resolved)TDD issue could be resolved by selecting the sequences properlyFD Interleaved ZC (Motorola)Centrally punctured FD ZC (modulated with central-symmetricalbinary sequence) (Huawei) 
Working assumption:
FD ZC sequence occupying up to 64 subcarriers including the DC subcarrier No bits are mapped to the DC subcarrierZC sequence length before mapping to subcarriers can be 64 +/- 1 (one sequence length to be selected)Root sequence indexes selected to resolve the time/frequency ambiguity. Decide the actual sequences and root indexes over the reflector.2. P-BCH

Consequencesfrom 40ms TTI for P-BCH
Number of P-BCH Transmission bursts within 40msFFS: 2, 4Mapping of P-BCH bits onto transmission burstsFFS: all bits in each burst (each burst is self decodable, softcombining of bursts possible), or all bits spread over all burstsChoice of TX diversity schemeFFS 
3. RACH

Conclusion:Zadoff-Chu sequence length of Nzc = 839 with guard bands on both sides ofthe preamble
Followingattempts were made by raised hand voting:
One or two preamble repetitions: LGE, Alcatel-Lucent, NTT DoCoMo, NSN, Ericsson, Sharp, PanasonicNo preamble repetitions: IPWirelessConclusion:Inaddition to the working assumption, one repetition of the preamble is supported(0.8ms + 0.8ms)

Proposedconclusions:
No explicit signalling of timing advance for RACH.Part of the DL-UL guard period (GP, GP+UpPTS, or GP+UpPTS+TS1) shall be used for RACH reception for frame structure 2.
4. Channel Coding Furtheroptimization of the following CB algorithm details for FFS.
·Threshold selection guideline for switchingbetween RV=0 and 7
·Number of RVs
·Subblock interleaver optimization, for example, P2 offset optimization.
5. MBSFN

UE is informed by higher layers of the serving cell about which subframes in the serving cell are used for MBSFN transmissionDetails of the signalling are FFS. This information is not on theP-BCH.For the neighbouring cells, two solutions are considered further:UE is informed by the serving cell whether UE can assume that noMBSFN subframes are present in all neighbouring cells.UE is informed by the serving cell whether UE can assume that allneighbouring cells have the same MBSFN subframe allocation as the servingcell.Details of the signalling are FFS. This information is not required by RAN1 to be on the P-BCH. 
6. PUCCH DM RS

Wayforward for PUCCH DM RS:
• For each RB that carries PUCCH
–10/12 base sequences (more than 12 base sequences FFS)
–One base sequence per “group” – 10/12 groups (more than 12 groups FFS)
• Group (semi-)statically assigned to a cell or possibility for a cell tohop (on slot/subframe basis) between groups
–No dynamic (PDCCH) signaling of sequence assignment
 
• Shifts are needed and used for CDM multiplexing of different users in agiven cell 
–Shift for a UE can be signaled implicitly or explicitly by higher layers(FFS)
 
• FFS whether for a system bandwidth with an odd number of RBs can use18-subcarrier wide PUCCH resource block
 
• Cyclic shift hopping is supported
 
7. DL Control Signaling

Cat0:
The first n OFDM symbols in a DL subframe are used for control signallingNo mix of control signalling and DL-SCH in an OFDM symboln=1,2 or 3Cat0 indicates the value of nInterpretation of Cat0 is non-configurable: fixed mapping of Cat0 to values of n (1,2,3) in the specification. The use of the fourth value in Cat0 is FFS.Cat0 is transmitted in the first OFDM symbolCoding: the 2 bits are mapped onto 4 sequences of length 16 QPSKsymbols (to be defined later)Spread over the whole system bandwidthCell specific frequency domain mapping. Cell specific hopping FFS.Cell specific scrambling, tied to the cell IDSame TX diversity scheme as for PDCCHNew name: Control Channel Format Indicator (CCFI) 8. UL Control Signaling



Wayforward:
The time and frequency resources that can be used by the UE to report CQI are controlled by the eNBBaseline is periodic CQI reporting. The possibility of linking the configuration of a periodic reporting cycle to a persistent scheduling cycle should be considered. Trigger-based CQI reporting, in addition to periodic CQI reporting, is FFS.Types of CQI reporting: Wideband CQI report: up to5 bits (assuming SIMO)Multi-band CQI report:equivalent resolution up to 5 bits per sub-band (assuming SIMO)Sub-band is defined as the band to which a CQI value is relatedCQI reports for applicableMIMO schemesCombination of the abovetypes of CQI reporting is FFSOverhead is added, e.g.from compression schemes or due to combination of different CQI reportsTotal number of CQI bits (including overhead) in a PUCCH subframe per UE shall not exceed approximately 10 bits (independently from the system bandwidth) assuming QPSK and an approximate code rate of up to 1/2, actual modulation and coding FFS 


