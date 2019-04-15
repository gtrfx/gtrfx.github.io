---
title: "RAN1#48 (St.Louis, USA) E-UTRA Outcomes.."
---
# RAN1#48 (St.Louis, USA) E-UTRA Outcomes..

LTE session started inthe evening on the first day and Tuesday through Thursday it was discussedparallel. The outcomes are as followed: 
LTE performance verification: Proposed work plan and LTE physical layer framework was agreedUpdated LT specification: TS 36.201 v0.3.0 in R1-071144, TS36.211 v0.4.0 in R1-071243. TS36.212 v0.4.0 in R1-071244. TS36.213 v0.3.0 in R1-071150. Remaining issues on numerology: UE TX BW capability is the minimum of 20MHz and whatever BW RAN4 decides on and LS is sent to RAN4 in R1-071207. Modulation: Working assumption is that Optional support of 64QAM in the UE, provided reasonable EVM and backoff requirement are defined in RAN4. As for SUMIMO for UL decision from RAN1#47bis is not changed, i.e. SU-MIMO is not included in the stage 2. Channel coding: - Thefollowing outcome from e-mail discussion 
i. Granularity ofsegmentation block size: byte-aligned
ii. Maximum information block size: 6144
 iii. Trellis terminationfor turbo codes as same as Rel-6. 
- QPP interleaver parameters, Code Block segmentationwere agreed. 
- Tail biting : Not needed. 
- Rat matching : Rate matching proposals to be verified with recentlyagreed QPP interleaver. 24 bit CRC isagreed as baseline for PDSCH.
 
Basic Access SchemeRACH
- Thefollowing outcome from e-mail discussion was agreed.
i. 64preambles per 1.0msec preamble structure and 6RB for generic frame structure are always supported in each cell.
ii. 16 preamblesper6RB for alternative frame structure are always supported in each cell. 
 iii. NodeB is allowed to schedule uplink data transmission on resource blocks that fallin the random access channel. Implementation is left specific to the Node B.
- Preamblestructure is agreed in R1-070715 and Filtering/Guard band is no specifiedfiltering is necessary for RACH. 
- Preambledesign of non-synchronized RACH for E-UTRA TDD was agreed in R1-070834
SCH
- Noninitial cell search design: Same approach as initial cell search is used fornon initial cell search. Draft LS in R1-07117.
- Transmitterdiversity scheme for SCH: Way forward was agreed asfollowed. 
i. Optimize the SCH assuming one transmit antenna andspecify (if needed to specify) the SCH
ii. TxD scheme to achieve additional benefit for the NodeB’s having multiple transmit antennas.
- Relation between P-SCH and signal and cell ID: It wasagreed that Number of Hypothesis in P-SCH: 3 (Cell ID within Cell ID group)
- Antenna for P-BCH:  It was concluded that if transmitterdiversity scheme for P-BCH is specified, one to one mapping between the numberof antenna and transmit diversity scheme.
- Hopping on /off: It was concluded that continue the discussion on #antenna and hoppinginformation on the E-mail reflector with simulation results until next meeting.
Reference signal structureDownlink
- Thefollowing outcome from e-mail discussion was agreed.
- Itis confirmed that UE obtains the hopping sequence throughthe cell group ID.
- Decisionfrom last meeting is revised to:
• All subframes of cell/carrier are either hopping or not hopping 
–[In practice implies carriers with MCH/MBSFN subframesdo not hop]
- UnicastRS FH is per subframe (not per slot)
- FrequencyHopping: Working assumption is the mode of operation (hopping or no hopping) ina cell is static. 
- RSstructure for MBSFN:
o Agreeon structure 1 in 701 as working assumption
o 1stor (1st and 2nd) OFDM symbol in a subframe can be usedfor unicast/PDCCH
§Theunicast RS can hop if hopping is enabled (as agreed earlier). FFS what happensif 2nd RS is needed for unicast/PDCCH
o Confirmwhether one OFDM RS for unicast/PDCCH is enough (until next meeting)
§FFSwhether in case of two symbols the allocation is hopping on the same resource.
o Agreeon alternative 2 in 1031 as working assumption (MCH transport channelscorresponding to different MBSFN areas are not multiplexed within the samesubframe within a cell)
- RSposition for 4Tx case, working assumption of RS positions for 4 TX antenna caseis revised. in R1-070705
Uplink
- Summaryof reflector discussions on E-UTRA UL RS was treated, however, there was no anyagreement. 
8. DownlinkMIMO
- Transmitdiversity scheme for SCH: Way forward: Optimize the SCHassuming one transmit antenna and specify (if needed to specify) the SCH TxDscheme to achieve additional benefit for the Node B’s having multiple transmitantennas.
- CW to layer mapping: Conclusion: Keep the working assumption i.e. 2+2 mapping forrank4 case.
- Precodingdetails: Working assumption: Table 1 for 2-TX SU-MIMO,Introduce support in LTE forcodebook and rank subset restriction for 2-Tx as well as for 4-Tx.
- Way forward was agreed. 
- Precoding codebook proposals for SU-MIMO notincluding CDD aspects):Wayforward: try to make decision in the next meeting w.r.t.the codebook design on agreed guideline for further evaluations/comparisons (pending channelmodel)
- CDD based precoding: Conclusion: the wayforward agreed
o Possibility of alternative optimal delay valuereplacing Nfft/2delay FFS
- UEfeedback
- Rankreport Conclusion:Workingassumption: UE reports a single rank report .Frequency-selective rank report FFS (take into accountthe following aspects). Simulation results (preferably both link and systemlevel) should be provided.
- Precoding report
i. Working assumption: number of RBs represented bya single precoding report
ii. 1.25/1.6/2.5MHz: whole orsubset of RBs
 iii. 5/10/15/20MHz: order of 5(e.g. 4, 5, or 6) adjacent RBs (exact single value to be decided in relation tothe CQI discussion) / whole or subset of RBs
- Tx Diversity: Conclusion was that Continue discussion in the next meeting. Have email discussion until thenext meeting including the available simulation results. Issues discussed
- Dedicated beamforming wasdiscussed and the issues were listed. 
Uplink MIMO- Inclusion of closed loopantenna selection for data channel
- Conclusion:  Agreed workingassumption 
closed loop antennaselection for data channel is supported as an option for FDD and half duplexFDD (note: there is concern on the benefit in terms of the user experience as aUE option from opposing companies)
Downlink control signalling- Theoutcome from e-mail discussion was agreed as followed. 
- .Cat1 and 2/3 (joint or separate)
Working assumption: Joint coding for the case of no MIMO. Review impact from MIMO scheme, once it is selected.- Wayforward on Downlink Control signalling R1-071223. 
11. UL Timing control: Nodiscussion.
UL/DL Power Control- From e-mail discussion, it was concluded in uplinkintra-cell power control as followed. 
- Closed-loop power control around a set-point obtainedby open loop 
·Periodic (L1) or aperiodic updates (L1/L2) (FFS whichto chose)
Overhead analysis should be done for periodicand aperiodic updates as part of the email discussion.
- From e-mail discussion, it was concluded in uplinkinter-cell power control as followed. 
- Overload indicator
o Single bit over-the-air
o Broadcast of interference values in each cell
- Network based inter-cell power control 
o through exchange of interference values between nodes
 LS toRAN3 to ask about backhaul delay.
13.Physical Layer measurement
Conclusions from email discussion on intra-frequency handovermeasurements:
- RSreceived power and RSSI
- Measuredon the first/second reference symbols in a slot (for antenna 1 and 2)
- UEcan use all subframes (subframes with MCH to be considered separately)
Measurement bandwidth (always 72 subcarriers or not) should be discussedfurther.


