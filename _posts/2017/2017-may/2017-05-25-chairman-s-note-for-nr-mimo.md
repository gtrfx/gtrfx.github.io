---
layout: post
title: "Chairman's note for NR MIMO "
---

###	MIMO
R1-1709853	Work plan for NR MIMO	NTT DOCOMO
All proponents are recommended to follow this work plan to finalize MIMO
####	Multi-antenna scheme
Physical control channel related issues are to be discussed in the agenda item for scheduling/HARQ aspects.
#####	Codeword mapping 
Including codeword-to-layer mapping and interleaving
Limit to 1 contribution per 1 company/organization/university
R1-1709261	Summary of Open Issues on Layer Mapping 	Samsung

**Agreements:**

* For >4-layer transmission, each of the two CWs is mapped to at most 4 layers

R1-1709356	WF on configurable codeword to layer mapping	LG Electronics, AT&T, ZTE

**Agreements:**

* At least support the following layer split for L >4 layer transmission: the 1st  layers  CW0 and remaining layers  CW1
* For >4 layer transmission, investigate further whether or not to support additional correspondence with limited number of possibilities 
* The mapping is configured by gNB to the UE
* FFS whether by RRC signaling or DCI or both 
* FFS possible mapping configured by gNB
* FFS  whether the UE report the preferred layer mapping

R1-1709360	WF on CW to layer mapping scheme for data channels Qualcomm, Samsung, Panasonic, Intel, Sharp, Ericsson, CATT, KDDI, Interdigital, ATT, Nokia, ASB
R1-1709313	WF on CW to resource mapping	ZTE, Huawei, HiSilicon, NTT DOCOMO, Xinwei, ASTRI

Working assumption:
* In NR, support at least the following mapping order for modulated symbol stream to the allocated resource for DL data channel 
o	First across layers associated with the codeword, then across subcarriers (frequency) and then across OFDM symbols (time)
o	FFS whether the resource is associated with a CW or with a CB group
o	FFS other schemes (e.g., Layer Time Frequency, Time Frequency Layer, Frequency Layer Time)
o	If so, details of configuration signalling, e.g. RRC, DCI
o	Companies are strongly encouraged to perform evaluations especially for high-speed scenarios, and interference limited/varying scenarios


**Agreements:**

o	Companies are encouraged to perform further evaluations on whether or not to support frequency interleaving, and if supported, the detailed interleaving scheme (e.g. as summarized in R1-1709261, per-OFDM-symbol interleaver, either used all the time or conditionally multi-OFDM-symbol interleaver, configurable interleaver, etc.)
o	Aim to make a decision in the next RAN1 meeting


**Agreements:**

* NR supports in one DCI containing one MCS (for the case of one CW) and two MCSs (for the case of two CWs) for a given UE
* FFS details

R1-1708667	Codeword to layer mapping for DL and UL	Ericsson
R1-1708448	Views on CW mapping	NTT DOCOMO, INC.

R1-1707468	Discussion on codeword mapping	CATT

R1-1707083	Further Evaluation and Discussion on Codeword to Layer Mapping	Beijing Xinwei Telecom Techn.
R1-1707111	Codeword to layer mapping and interleaving	ZTE
R1-1707347	Remaining details on CW to MIMO layer mapping	Intel Corporation
R1-1707598	Discussion on codeword mapping	LG Electronics
R1-1707737	Remaining issue for CW to Layer mapping	AT&T
R1-1707765	Discussion of codeblock mapping for DL and UL data channel	Lenovo, Motorola Mobility
R1-1709193 	Codeword mapping in NR	MediaTek Inc.
Revision of R1-1707833	
R1-1707942	Finalizing Layer Mapping	Samsung
R1-1708128	Codeword to layer mapping in NR	Huawei, HiSilicon
R1-1708579	CW to layer mapping and frequency domain interleaving	Qualcomm Incorporated
#####	Transmission scheme 2 for DL 
Limit to 1 contribution per 1 company/organization/university
R1-1707852	Analysis of transmission scheme 2	MediaTek Inc.

R1-1709357	WF on DL transmission scheme 2 LG Electronics, Qualcomm, Ericsson, Samsung, Intel, NTT DOCOMO, ZTE, WILUS Inc., Nokia, ASB, 
OPPO, Fujitsu, Panasonic, IITH, CEWiT, IITM, Tejas Networks, KDDI, CHTTL, AT&T 
R1-1709294	WF on DL transmission scheme 2 Huawei, HiSilicon, China Unicom, Xinwei, CMCC, Softbank, Mitsubishi Electric, Interdigital, Deutsche Telekom, CATR

**Agreements:**

* For NR in Rel-15, DL transmission scheme 2 is not explicitly supported for unicast PDSCH in specification 
o	Note: CSI feedback assuming open-loop/semi-open-loop and/or closed-loop transmissions is to be discussed separately

R1-1707112	Diversity based downlink transmission schemes	ZTE
R1-1707348	Discussion on transmission scheme 2 for DL	Intel Corporation
R1-1707469	Further discussion on DL transmission scheme 2	CATT
R1-1707599	Discussion on transmission scheme 2 for DL	LG Electronics
R1-1707738	On Transmission Scheme 2 for DL	AT&T
R1-1707943	Discussions on transmission scheme 2 for NR	Samsung
R1-1708129	Transmission scheme 2 for DL	Huawei, HiSilicon
R1-1708330	On Selection of DL Transmission Scheme 2	InterDigital, Inc.
R1-1708390	Discussion on DL Transmission Scheme 2 for rank-1	CMCC
R1-1708449	Discussion on DL transmission scheme 2	NTT DOCOMO, INC.
R1-1708580	On DL transmission scheme 2	Qualcomm Incorporated
R1-1708668	Downlink Tx Scheme 2: Summary, Recent Developments, & Way Forward	Ericsson
R1-1708893	On the support of open-loop transmission in NR	Nokia, Alcatel-Lucent Shanghai Bell
#####	Codebook based transmission for UL 
Including codebook design and PRG size
Limit to 1 contribution per 1 company/organization/university

R1-1709661	Summary of Issues and WFs on Codebook based transmission for UL	Intel
R1-1709495	WF on UL codebook design principle  LG Electronics, Xinwei, Samsung, MediaTek
R1-1709798	WF on UL codebook LG Electronics, Samsung, InterDigital

**Agreements:**

* One of the following UL codebook design principles is down-selected until next meeting.
* Alt1:
* NR supports UL codebook at least for a single panel. 
* Note: This does not preclude the use of components of single panel UL codebook for multi-panel.
* FFS on multi-panel UL codebook
* Whether or not support additional components (e.g., panel co-phase)  
* NR supports a UL codebook optimized for single-panel and support multi-panel via indicating multiple TPMIs
* Focus on single panel based UL codebook design first, then support multi-panel via selecting a panel via SRI or indicating TPMI per SRS resource.
* Alt 2: 
* Focus on designing a common framework UL codebook for single-panel and multi-panel
* Alt 3: 
* Design different UL codebooks for single-panel and multi-panel, respectively.
* Codebook details are FFS 
* Existing LTE codebooks should be considered as baseline.

R1-1709492 WF on UL Codebook Structure Nokia, Nokia Shanghai Bell, CATT, Interdigital

R1-1709548	WF on Codebook Based UL-MIMO Transmission	Huawei, HiSilicon, Samsung
Also supported by InterDigital
R1-1709673	NR UL MIMO Signaling Mechanism Ericsson, Nokia, Alcatel-Lucent Shanghai Bell, Qualcomm, CATT, ZTE

R1-1708894	Codebook design for UL MIMO	Nokia, Alcatel-Lucent Shanghai Bell

R1-1707600	Discussion on codebook based transmission for UL	LG Electronics

R1-1707113	Codebook based UL transmission	ZTE
R1-1707349	On codebook based UL tansmission	Intel Corporation
R1-1707470	Further discussion on codebook basded UL transmission	CATT
R1-1709743 	UL codebook-based transmission	Samsung
Revision of R1-1707944	
R1-1708130	Codebook based transmission for UL MIMO	Huawei, HiSilicon
R1-1708331	TPMI Indication for Frequency Selective UL Precoding	InterDigital, Inc.
R1-1708581	Codebook based UL transmission	Qualcomm Incorporated
R1-1708669	UL MIMO procedures for codebook based transmission	Ericsson
#####	Non-codebook based transmission for UL
Including PRG size
Limit to 1 contribution per 1 company/organization/university

R1-1709741	Summary of issues on UL non-codebook based transmissions	Nokia, Nokia Shanghai Bell
R1-1709597	WF on Frequency-Selective Precoding in UL Transmission, Qualcomm, Nokia, ASB, CATT, Ericsson, MediaTek
R1-1709607	WF on frequency-selective precoding in UL transmission, Huawei, HiSilicon, Samsung, IITM, AT&T, Tejas Networks, Softbank, IITH, CeWiT, KDDI, Deutsche Telekom, CATR, SHARP, Interdigital, Xinwei

**Agreements:**

* When the number of transmission ports is less than or equal to 2, frequency selective precoding is not supported for both schemes A and B
* When the number of transmission ports is >2, frequency selective precoding for CP-OFDM can be configured by gNB for both schemes A and B
* FFS how to support/indicate frequency selective precoding (including potentially spec-transparent support)
* Note: frequency-selective TPMI is to be discussed separately


R1-1709549	WF on UL non-codebook based transmission, Huawei, HiSilicon, LGE, CATT, Ericsson, CeWiT, Deutsche Telekom, China Telecom, Xinwei, Tejas Networks, CATR, MediaTek, IITH, IITM
Also supported Reliance Jio, InterDigital
R1-1709484	WF on non-codebook based transmission for UL	NTT DOCOMO, InterDigital, Intel
R1-1708450	Beam determination for non-codebook based transmission for uplink	NTT DOCOMO, INC.

R1-1707350	On non-codebook based UL transmission	Intel Corporation
R1-1706923	Non codebook based transmission for UL MIMO	Huawei, HiSilicon
R1-1707114	Non-Codebook based and Hybrid based UL transmission	ZTE
R1-1707471	Further discussion on non-codebook basded UL transmission	CATT
R1-1707601	Discussion on non-codebook based transmission for UL	LG Electronics
R1-1707945	Discussion on Non-Codebook-Based UL Transmission	Samsung
R1-1708582	Non-codebook based UL transmission	Qualcomm Incorporated
R1-1708670	UL MIMO procedures for non-codebook based transmission	Ericsson
R1-1708895	Non-codebook based UL-MIMO transmission	Nokia, Alcatel-Lucent Shanghai Bell

#####	Diversity transmission for UL
Limit to 1 contribution per 1 company/organization/university
R1-1707602	Discussion on diversity transmission for UL	LG Electronics
R1-1708671	Robust Transmission Scheme for PUSCH	Ericsson

R1-1709800	Summary of AI 7.1.2.1.5 UL transmit diversity	Mitsubishi

**Agreements:**

* For UL transmit diversity for CP-OFDM, down-select between the following alternatives
o	Alt. 1: transmit diversity is not explicitly supported for PUSCH in Rel. 15
o	Alt. 2 non-transparent UL transmit diversity for CP-OFDM (e.g., SFBC, Non-transparent precoder cycling)
* For UL transmit diversity for DFTsOFDM and CP-OFDM, companies are encouraged to provide evaluation results and implementation analysis for the next RAN1 meeting

R1-1707115	Diversity based uplink transmission schemes	ZTE
R1-1707351	On diversity based UL transmission	Intel Corporation
R1-1707472	Further discussion on transmission diversity scheme in UL	CATT
R1-1707739	TxD for UL	AT&T
R1-1707798	UL diversity transmission for DFTsOFDM	Mitsubishi Electric RCE
R1-1707946	Diversity transmission for UL	Samsung
R1-1708131	Diversity-based transmission for UL	Huawei, HiSilicon
R1-1708223	Uplink diversity scheme for DFT-S-OFDM	IITH
R1-1708583	On UL diversity transmission scheme	Qualcomm Incorporated
R1-1708896	UL diversity schemes	Nokia, Alcatel-Lucent Shanghai Bell
#####	PRB bundling for DL
Limit to 1 contribution per 1 company/organization/university
R1-1708672	On DL PRB bundling	Ericsson
R1-1708584	Discussion on PRB bundling for DL	Qualcomm Incorporated

R1-1709354	Summary of Issues on DL PRB bundling	Xinwei
R1-1709622	WF on DL PRB Bundling Size Indication Xinwei, HW, HiSilicon, CATT, MTK, Intel, Ericsson, Samsung, ZTE, LG, Nokia, Alcatel-Lucent Shanghai Bell
R1-1709623	WF on DL PRB Bundling Size Value Set 	Xinwei, HW, HiSilicon, CATT, MTK, Intel, ZTE
R1-1709791	WF on DL PRB Bundling Size Value Set 	Xinwei, CATT, MTK, Intel, ZTE

**Agreements:**

* For DL data transmission
* PRB bundling size include (including possible downselection)
* Case 1: value(s) based on RBG
* FFS RBG/k, where k is integer, FFS the value(s) of k
* FFS m * RBG, where m is integer, FFS whether m is always equal to 1
* Case 2: other values based on bandwidth part, and/or scheduled bandwidth and/or UE capability etc.
* E.g., Consecutive scheduled bandwidth 
* FFS restrictions
* E.g., Values equal or larger than scheduled BW
* FFS restrictions 
* FFS other cases;
* FFS the relationship between above values with e.g. DMRS patterns
* FFS UE feedback assisted PRB bundling size with respect to UE complexity, feedback overhead increase and performance gains.
* FFS joint or separate indication of PRB bundling size on data and DMRS

R1-1707084	Further Evaluation and Discussion on PRB Bundling Size	Beijing Xinwei Telecom Techn.
R1-1707116	On PRB Bundling	ZTE
R1-1707473	Discussion on PRB bundling for DL	CATT
R1-1707947	PRB bundling for NR DMRS	Samsung
R1-1708133	PRB bundling size for DL data precoding	Huawei, HiSilicon
R1-1708332	PRG Size Indication in NR	InterDigital, Inc.
R1-1708897	On details of PRB Bundling	Nokia, Alcatel-Lucent Shanghai Bell
#####	Multi-TRP and Multi-panel transmission
Limit to 1 contribution per 1 company/organization/university for UL and DL, independently
R1-1709299	Remaining issues on multi-TRP and multi-panel transmission	CATT

**Agreements:**

* Adopt the following for NR reception:
* Single NR-PDCCH schedules single NR-PDSCH where separate layers are transmitted from separate TRPs
* Multiple NR-PDCCHs each scheduling a respective NR-PDSCH where each NR-PDSCH is transmitted from a separate TRP 
* Note: the case of single NR-PDCCH schedules single NR-PDSCH where each layer is transmitted from all TRPs jointly can be done in a spec-transparent manner
* Note: CSI feedback details for the above case can be discussed separately

R1-1709350, “WF on control channel for multi-TRP transmission”, Huawei, HiSilicon, Ericsson, ATT, CATT, MediaTek, Interdigital, China Telecom, China Unicom, BT, Nokia, Alcatel-Lucent Shanghai Bell, Qualcomm

**Agreements:**

* For the reception of multiple NR-PDCCHs each scheduling a respective NR-PDSCH where each NR-PDSCH is transmitted from a separate TRP, NR supports:
* The maximum supported number of NR-PDCCHs/PDSCHs is either 2 or 3 or 4
* To be decided next meeting
* FFS signaling (explicit or implicit) of the maximum number of NR-PDCCHs/PDSCHs for a UE, including the case of signaling a single NR-PDCCH/PDSCH
R1-1709735	Way Forward on Uplink Multi-panel and Multi-TRP operation		Intel, Ericsson, InterDigital

R1-1708898	Non-coherent Multi-node Transmission in the 5G New Radio	Nokia, Alcatel-Lucent Shanghai Bell

R1-1707117	Multi-TRP Transmission and interference coordination	ZTE
R1-1707352	Discussion on uplink multi-panel and multi-TRP operation	Intel Corporation
R1-1707353	Support of downlink NC-JT in NR	Intel Corporation
R1-1707474	Further discussuin on multi-panel/multi-TRP transmission	CATT
R1-1707603	Discussion on cooperative transmission	LG Electronics
R1-1707760	Support multiple DCI based transmission	AT&T
R1-1707837	Multi-TRP and Multi-panel transmissions	MediaTek Inc.
R1-1707948	Discussions on NR DL multi-TRP and multi-panel support	Samsung
R1-1707949	Discussions on NR UL multi-TRP and multi-panel support	Samsung
R1-1708132	NR-PDCCH design for Multi-TRP coordinated transmission	Huawei, HiSilicon
R1-1708333	On Multi-TRP/Panel Transmission for DL	InterDigital, Inc.
R1-1708378	NR-PDCCH for multi-TRP transmission	China Telecommunications
R1-1708585	OTA calibration for multi-TRP transmission	Qualcomm Incorporated
R1-1708673	On Multi-TRP and Multi-panel transmission	Ericsson
R1-1708674	UL multi-panel transmission	Ericsson
#####	Other 
R1-1706924	Discussion on transmission parameter sets	Huawei, HiSilicon
R1-1707118	On Transmission Setting	ZTE
R1-1707740	Multi Codeword MIMO Implementation using Multiple DCI	AT&T
R1-1707950	Continuous precoding for NR DMRS in time domain	Samsung
R1-1707951	Multi-TA procedures for Multi-TRP	Samsung
R1-1708675	On transmission parameter sets	Ericsson
R1-1708899	DL transmission mode configuration for NR	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708900	On frequency selective precoding for UL-MIMO	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708901	UL DCI signaling details	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708902	Performance Evaluation of DPS CoMP scheme for NR	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708903	erformance Evaluation of DPS CoMP in 28 GHz	Nokia, Alcatel-Lucent Shanghai Bell
####	Beam management
#####	Beam management details 
Limit to 1 contribution per 1 company/organization/university for UL and DL, independently	

R1-1709496	Potential agreements on beam management	Qualcomm

**Agreements:**

* Support spatial QCL assumption between antenna port(s) within a CSI-RS resource(s) and antenna port of an SS Block (or SS block time index) of a cell 
* The other QCL parameters not precluded 
* FFS: indication either explicit or implicit or  configurable or a default
* Note: default assumption may be no QCL
* Configuration of QCL for UE specific NR-PDCCH is by RRC and MAC-CE signalling
¬	Note that MAC-CE is not always needed
¬	FFS: necessity of DCI signalling
¬	Note: For example, DL RS QCLed with DMRS of PDCCH for delay spread, Doppler spread, Doppler shift, and average delay parameters, spatial parameters


**Agreements:**

* Cell-specifically configured CSI-RS is not supported for beam management

Continue offline discussion until Thursday by utilizing R1-1709496  – Sundar (Qualcomm)
R1-1709774	Potential agreements on beam management	Qualcomm

**Agreements:**

* The following beam grouping criteria are considered:
* A1 (based on Alt 1): Different TRP TX beams reported for the same group can be received simultaneously at the UE. 
* A2 (based on Alt 2): Different TRP TX beams reported for different groups can be received simultaneously at the UE.
* Down selection of the beam grouping criteria by next meeting
* FFS in addition to the above grouping criteria, the following grouping criteria can be considered
* C1 (in combination with A1): Different TRP TX beams reported for different groups cannot be received simultaneously at the UE.
* C2(in combination with A2): Different TRP TX beams reported for the same group cannot be received simultaneously at the UE.

**Agreements:**

* For beam management with beam group reporting the following quantities should be considered
* the max number of groups supported in the specification M, 
* the max number of Tx beams per group supported in the specification N
* the number of groups to report L 
* the number of Tx beams per group in the report Q
* FFS: UE-specific configuration of the parameters L, Q incorporating UE-capability information
* L = 1, Q = 1 are supported which implies no impact to reporting and indication overhead
* Companies are encouraged to evaluate performance to determine values of M, N, L, Q for the first release of NR 
* Decide on the values of L, M, N, Q supported by the spec to be able to determine impact on reporting and indication overhead 
R1-1709617	WF on CSI-RS design for beam management	Samsung, Intel, KT, Ericsson
R1-1709797 	WF on CSI-RS pattern for beam management Huawei, HiSilicon, CATT, ZTE, OPPO
R1-1709668	WF on CSI-RS for beam management	ZTE, LG Electronics, ASTRI, Huawei, HiSi, Samsung, Ericsson, InterDigital, CATT
Also supported by Nokia, Intel, Qualcomm

**Agreements:**

* NR supports CSI-RS configuration to support Tx and/or Rx beam sweeping for beam management conveying at least the following information
* Information related to CSI-RS resource configuration
* E.g., CSI-RS RE pattern, number of CSI-RS antenna ports, CSI-RS periodicity (if applicable) etc.
* Information related to number of CSI-RS resources 
* Information related to number of time-domain repetitions (if any) associated with each CSI-RS resource
* FFS: details of time-domain repetitions, e.g., signaling for time-domain repetitions may not be explicit
* FFS signaling details, e.g., explicit indication vs implicit indication
* Note this does not imply particular option (IFDMA or subcarrier scaling or DFT based) for sub time unit partition 
* FFS: whether different sub-time units have same or different ports

R1-1709554	WF on  aperiodic SRS for UL beam management OPPO, Xinwei, Xiaomi, Coolpad, Spreadtrum, Nokia, ASB, CATT, China Telecom, Intel, Samsung, MediaTek, CATR, NTT DoCoMo, Ericsson, Huawei, HiSilicon


**Agreements:**

* For aperiodic SRS transmission triggered by single aperiodic SRS triggering field, the UE can be configured to transmit N(N>1) SRS resources for UL beam management
* FFS transmit power for the N SRS resources for UL beam management  

R1-1709808	WF on using SS block for beam management	ZTE

R1-1709773	WF on UL Beam Management	Huawei, HiSilicon, Intel, Xinwei, MediaTek, InterDigital

R1-1709483	WF on beam switching	CATT

R1-1707355	Details for DL Beam Management	Intel Corporation
R1-1707953	Downlink beam management details	Samsung
R1-1706925	UL beam management	Huawei, HiSilicon

R1-1707697	Discussion on the UL Beam Management	Guangdong OPPO Mobile Telecom.

R1-1707085	Discussion on DL Beam Management	Beijing Xinwei Telecom Techn.
R1-1707119	DL beam management for NR MIMO	ZTE
R1-1707120	UL beam management for NR MIMO	ZTE
R1-1707244	DL beam management and beam reporting	vivo
R1-1707354	Details for UL Beam Management	Intel Corporation
R1-1707475	Discussion on DL beam management	CATT
R1-1707476	Discussion on UL beam management	CATT
R1-1707604	Discussion on DL beam management	LG Electronics
R1-1707605	Discussion on UL beam management	LG Electronics
R1-1707696	Discussion on the DL Beam Management	Guangdong OPPO Mobile Telecom.
R1-1707750	DL beam mangement details	AT&T
R1-1707830	Details on DL Beam management	MediaTek Inc.
R1-1707831	Discussion on UL beam management with imperfect beam correspondence	MediaTek Inc.
R1-1707952	UL beam management	Samsung
R1-1708134	DL beam management	Huawei, HiSilicon
R1-1708258	Considerations on beam reporting	Sony
R1-1708270	Discussion on Nested Usage of RS for Beam Measurement	National Instruments Corp.
R1-1708334	On Beam Management for DL Control and Data Channels	InterDigital, Inc.
R1-1708335	On Efficient UL Beam Management	InterDigital, Inc.
R1-1708451	Views on beam management details	NTT DOCOMO, INC.
R1-1708586	Beam management for NR	Qualcomm Incorporated
R1-1708676	DL beam management details	Ericsson
R1-1708677	UL beam management details	Ericsson
R1-1708904	Reference signals and measurements for beam management	Nokia, Alcatel-Lucent Shanghai Bell
R1-1709046	Considerations on UE Beamforming Management	ASUSTEK COMPUTER (SHANGHAI)
#####	Mechanism to recover from beam failure
Limit to 1 contribution per 1 company/organization/university
Continue offline discussion until Tuesday – Chia-Hao (Mediatek)
R1-1709606	Summary from offline for beam recovery mechanism	MediaTek
Working assumption:
* Support at least the following triggering condition(s) for beam failure recovery request transmission:
* Condition 1: when beam failure is detected and candidate beam is identified at least for the case when only CSI-RS is used for new candidate beam identification
* FFS Condition 2: Beam failure is detected alone at least for the case of no reciprocity
* FFS how the recovery request is transmitted without knowledge of candidate beam
* Note: if both conditions are supported, which triggering condition to use by UE also depends on both gNB configuration and UE capability

R1-1709309	WF on beam recovery	ZTE, MediaTek, vivo, Spreadtrum, Qualcomm, ASTRI, AT&T,  OPPO, Ericsson, LGE, Xinwei

**Conclusion:**

* FFS SS-block in addition to CSI-RS is at least supported for P-1 in beam management 
* FFS with or without L1-RSRP reporting


**Agreements:**

* Support the following channel(s) for beam failure recovery request transmission:
* Non-contention based channel based on PRACH, which uses a resource orthogonal to resources of other PRACH transmissions, at least for the FDM case
* FFS other ways of achieving orthogonality, e.g., CDM/TDM with other PRACH resources
* FFS whether or not have different sequence and/or format than those of PRACH for other purposes 
* Note: this does not prevent PRACH design optimization attempt for beam failure recovery request transmission from other agenda item 
* FFS: Retransmission behavior on this PRACH  resource is similar to regular RACH procedure
* Support using PUCCH for beam failure recovery request transmission
* FFS whether PUCCH is with beam sweeping or not
* Note: this may or may not impact PUCCH design
* FFS Contention-based PRACH resources as supplement to contention-free beam failure recovery resources
* From traditional RACH resource pool
* 4-step RACH procedure is used
* Note: contention-based PRACH resources is used e.g., if a new candidate beam does not have resources for contention-free PRACH-like transmission 
* FFS whether a UE is semi-statically configured to use one of them or both, if both, whether or not support dynamic selection of one of the channel(s) by a UE if the UE is configured with both 

R1-1709639	WF on handling beam failure recovery for unexpected cases	vivo, Qualcomm, KT Corp, Ericsson


**Agreements:**

* To receive gNB response for beam failure recovery request, a UE monitors NR PDCCH with the assumption that the corresponding PDCCH DM-RS is spatial QCL’ed with RS of the UE-identified candidate beam(s)
* FFS whether the candidate beam(s) is identified from a preconfigured set or not
* Detection of a gNB’s response for beam failure recovery request during a time window is supported
* FFS the time window is configured or pre-determined
* FFS the number of monitoring occasions within the time window
* FFS the size/location of the time window
* If there is no response detected within the window, the UE may perform re-tx of the request
* FFS details
* If not detected after a certain number of transmission(s), UE notifies higher layer entities
* FFS the number of transmission(s) or possibly further in combination with or solely determined by a timer 

R1-1707782	Discussion on beam recovery	Spreadtrum Communications

R1-1708135	Beam failure recovery	Huawei, HiSilicon

R1-1707121	Discussion on beam recovery mechanism	ZTE
R1-1707245	Beam recovery based on NR-PDCCH and NR-PDSCH	vivo
R1-1707255	Discussion on beam failure recovery procedure	Fujitsu
R1-1707356	Discussion for Mechanism to Recover from Beam Failure	Intel Corporation
R1-1707477	Discussion on DL beam recovery	CATT
R1-1707606	Discussion on beam failure recovery	LG Electronics
R1-1707698	On Beam Recovery Mechanism	Guangdong OPPO Mobile Telecom.
R1-1707751	Design principles of beam recovery mechanism	AT&T
R1-1707814	Low latency beam failure recovery by PRACH/PRACH-like	NEC
R1-1707832	Discussion on Beam Recovery Mechanism	MediaTek Inc.
R1-1707954	Discussion on beam recovery procedure	Samsung
R1-1708336	Remaining Issues on Beam Recovery for NR	InterDigital, Inc.
R1-1708369	Discussion on mechanisms for beam failure recovery	Sharp
R1-1708380	Discussion on beam failure recovery	CHTTL
R1-1708452	Further views on mechanism to recover from beam failure	NTT DOCOMO, INC.
R1-1708587	Beam recovery procedures	Qualcomm Incorporated
R1-1708678	Beam failure recovery mechanism	Ericsson
R1-1708874	Discussion on beam failure recovery mechanism	Institute for Information Industry (III)
R1-1708905	Beam Recovery in NR	Nokia, Alcatel-Lucent Shanghai Bell
R1-1709127	Discussion on beam failure recovery mechanism	Institute for Information Industry (III)
#####	Other
R1-1706928	Beam management across multiple carriers	Huawei, HiSilicon
R1-1707122	Beam grouping evaluation for beam management	ZTE
R1-1707357	On Timing Advance for multi-beam operation	Intel Corporation
R1-1707478	Discussion on additional beam management RS	CATT
R1-1707479	Discussion on need of DL and UL RS association	CATT
R1-1707699	Beam association relationship between data and control channels	Guangdong OPPO Mobile Telecom.
R1-1707955	Link level simulation assumptions for beam management	Samsung
R1-1707956	System level simulation assumptions for beam management	Samsung
R1-1707957	Discussion on Tx beam grouping	Samsung
R1-1708136	Multi-beam transmission for robustness	Huawei, HiSilicon
R1-1708271	Discussion on Robust Beam Management	National Instruments Corp.
R1-1708453	Evaluation on beam management	NTT DOCOMO, INC.
R1-1708588	Control channel multi-beam operation	Qualcomm Incorporated
R1-1708679	On cell specific CSI-RS	Ericsson
R1-1708680	On the use of SS for beam management	Ericsson
R1-1708681	Beam management in C-DRX	Ericsson
R1-1708682	Further results on beam management without beam indication	Ericsson
R1-1708683	Performance of beam grouping for different UE antenna architectures	Ericsson
R1-1708871	Discussion on beam correspondence validity	China Unicom
R1-1708906	BPL definition and Spatial QCL time indication	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708907	On beam grouping and reporting	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708908	Multi beam transmission of UL channels	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708909	Multi-beam control channel transmission	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708910	Beam management  - QCL association between  DL RS and DMRS for NR-PDCCH	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708911	Beam Measurements and TX/RX Beam Correspondence	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708912	SRS transmission for beam management	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708947	Evaluation results of beam selection based on multiple panel	CATR
R1-1708984	void	CATR
R1-1709033	System level evaluation results for beam management	Samsung
R1-1709034	Link level evaluation results for beam management	Samsung
R1-1709035	Beam measurement and reporting	Samsung
R1-1709036	Discussion on Rx beam set based reporting	Samsung
####	CSI acquisition
#####	CSI framework
Including beam management framework
Limit to 1 contribution per 1 company/organization/university
R1-1708454	Views on CSI framework	NTT DOCOMO, INC.
R1-1708684	Further details of CSI framework	Ericsson

R1-1709447	WF on CSI-RS framework		CATT, Ericsson, Nokia, ASB, Intel, OPPO
R1-1709485	WF on Triggering Mechanism for CSI Reporting NTT DOCOMO, LGE, Huawei, HiSilicon, Sharp, Mitsubishi
Also supported by Intel
Regarding dynamic signaling at least focusing on SPS CSI-RS and SPS CSI-RS feedback, discuss further offline especially on the resulting overhead associated with DCI-based vs. MAC CE-based approaches, taking into account maximum number of CSI reporting settings (N value), maximum number of resources settings (M value), maximum number of resource sets (S value), the number of links (L), and/or maximum number resources per resource set  (Ks value) in both non-CA and CA scenarios (note: multiple sets of values may be used for the overhead analysis) – Rakesh (CATT)

R1-1709775	Summary of offline discussion on CSI framework	CATT

**Agreements:**

* Maximum value of Ks for CSI acquisition is no more than 8

Email discussion till next meeting on the following – Rakesh (CATT)
* Maximum number of CSI reporting settings (N value), maximum number of resources settings (M value), maximum number of resource sets (S value), the number of links (L), and/or maximum number resources per resource set  (Ks value) in both non-CA and CA scenarios

R1-1709396	WF on CSI timing	LG Electronics, ZTE, Intel, InterDigital, NTT DOCOMO, Samsung, Nokia, Alcatel-Lucent Shanghai Bell, Ericsson


R1-1709604	Offline discussion summary on CSI feedback framework 	ATT

**Agreements:**

1. 	RAN1 supports aperiodic CSI report on PUSCH, including two cases: 
1. 	Case-1: CSI reports multiplexing with uplink data in PUSCH
1. 	Case-2: CSI reports only in PUSCH (no uplink data)
1. 	Note: how to multiplex UCI with PUSCH is under discussing in UCI multiplexing A.I. 
1. 	FFS: aperiodic CSI report on PUCCH

R1-1709609 	WF on CSI timing	LG Electronics, AT&T, KT Corp., Xinwei, WILUS Inc., InterDigital, Samsung, ZTE

R1-1709535	WF on PDSCH rate matching Electronics, AT&T, Huawei, Hisilicon, NTT DOCOMO, Panasonic, Ericsson

R1-1706926	Discussion on CSI Framework Design	Huawei, HiSilicon
R1-1707086	Discussion on CSI Framework and Aperiodic CSI-RS Resources and Reports Activation	Beijing Xinwei Telecom Techn.
R1-1707123	On CSI framework details	ZTE
R1-1707358	On NR CSI framework	Intel Corporation
R1-1707480	Further discussion on CSI framework	CATT
R1-1707607	Discussion on CSI framework	LG Electronics
R1-1707752	Considerations on CSI acquisition framework	AT&T
R1-1707958	CSI Acquisition and Beam Management Framework	Samsung
R1-1708216	ZP CSI-RS for PDSCH rate matching	PANASONIC
R1-1708337	On CSI framework for NR	InterDigital, Inc.
R1-1708589	Details of CSI framework	Qualcomm Incorporated
#####	Details of CSI acquisition 
Including channel and interference measurement and reporting
Limit to 1 contribution per 1 company/organization/university
R1-1706927	Channel and interference measurement for CSI acquisition	Huawei, HiSilicon
R1-1708455	On CSI measurement for NR	NTT DOCOMO, INC.

R1-1709515	WF on CSI Measurement Details NTT DOCOMO, Nokia, ASB, Samsung	
R1-1709295	WF on NZP CSI-RS for interference measurement Huawei, HiSilicon, Xinwei, MediaTek, AT&T, CeWiT, Intel, ZTE, ZTE Microelectronics, IITH, IITM, China Unicom, Tejas Networks, Softbank, Qualcomm, LGE, Ericsson, KDDI, Deutsche Telekom, Mitsubishi Electric, InterDigital, NEC, SONY, Spreadtrum, China Telecom, CATR, SHARP
Working assumption:
* Support at least NZP CSI-RS based interference measurement 
* select at least one of following scheme
* Scheme-1: Estimation on NZP CSI-RS for channel estimation (by subtracting NZP CSI-RS from Rx signal)
* Scheme-2: Emulation on NZP CSI-RS which is represented by multiplied value of channel and precoding matrix
* Aim to conclude whether to support one of them or both in the next RAN1 meeting
* FFS whether or not to support signaling of power boosting for NZP CSI-RS
* Other schemes are not precluded

* FFS whether or not support DM-RS based interference measurement, aim to decide in the next RAN1 meeting
* Companies are strongly encouraged to carry out analysis of the resulting overhead comparing NZP CSI-RS and DM-RS based approaches (e.g., as in contribution R1-1709452)

R1-1709815	Summary of CSI Acquisition Details	DCM
R1-1709779	WF on CSI acquisition	Samsung, Ericsson

**Agreements:**

* Support following features for NR CSI acquisition
* FFS Frequency domain subset restriction
* FFS on number of configurable subsets
* FFS on detailed signaling/configuration
* FFS measurement restriction of interference measurement
* FFS on measurement restriction of channel measurement 
* For time domain, measurement restriction of channel and interference measurement
* CSI reporting via short duration PUCCH
* FFS on detailed setting in CSI reporting setting
* CSI reporting via long duration PUCCH
* FFS on detailed setting in CSI reporting setting
* PUCCH reporting which is contained in a single slot
* FFS on PUCCH reporting which is contained in multiple slots

R1-1707124	Details of CSI acquisition	ZTE
R1-1707359	Discussion on Interference Measurement for CSI	Intel Corporation
R1-1707481	Discussion on additional IMR resource	CATT
R1-1707608	Discussion on interference measurement and rate matching for NR	LG Electronics
R1-1707761	On the details of CSI acuisition	AT&T
R1-1707959	Discussions on CSI measurements and reporting for NR	Samsung
R1-1708259	Considerations on interference measurement	Sony
R1-1708338	Remaining Issues on CSI acquisition for NR	InterDigital, Inc.
R1-1708391	Joint selection and CSI feedback for analog and digital beam	CMCC
R1-1708590	On interference measurement resource	Qualcomm Incorporated
R1-1708685	On CSI acquisition and reporting	Ericsson
R1-1708913	Performance analysis of interference estimation in NR	Nokia, Alcatel-Lucent Shanghai Bell
#####	CSI acquisition for reciprocity based operation
Limit to 1 contribution per 1 company/organization/university
R1-1708137	Discussion on reciprocity based CSI acquisition mechanism	Huawei, HiSilicon
R1-1708686	CSI acquisition for reciprocity-based operation	Ericsson

R1-1709786	Summary of offline discussion of CSI acquisition for reciprocity based	ZTE
R1-1709768	WF on reciprocity based CSI acquisition, Huawei

R1-1707125	On reciprocity based CSI acquisition	ZTE
R1-1707482	Further discussion on reciprocity based CSI acquisition	CATT
R1-1707609	Discussion on CSI acquisition for reciprocity based operation	LG Electronics
R1-1707834	CSI acquisition for reciprocity based operations	MediaTek Inc.
R1-1707960	CSI Reporting for Reciprocity Operation	Samsung
R1-1708591	CSI acquisition for reciprocity based operation	Qualcomm Incorporated
R1-1708914	On the channel reciprocity support for CSI acquisition	Nokia, Alcatel-Lucent Shanghai Bell
#####	CSI feedback Type I 
Limit to 1 contribution per 1 company/organization/university
R1-1707610	Discussion on CSI feedback Type I	LG Electronics
R1-1707961	Type I CSI reporting	Samsung
R1-1708456	CSI Feedback Type I for NR MIMO	NTT DOCOMO, INC.
R1-1708687	Codebook design for Type I single-panel CSI feedback	Ericsson’
R1-1709268 	On type I CSI feedback in NR	Nokia, Alcatel-Lucent Shanghai Bell
Revision of R1-1708915	

R1-1707126	On Type I CSI feedback details	ZTE
R1-1707360	On CSI feedback Type I	Intel Corporation
R1-1707483	Discussion on Type I CSI feedback	CATT
R1-1707762	Design principle of CSI feedback	AT&T
R1-1707835	CSI feedback Type I	MediaTek Inc.
R1-1708138	Design and evaluation results for Type I codebook	Huawei, HiSilicon
R1-1708339	On Type I CSI feedback for Multi-panel	InterDigital, Inc.
R1-1708592	On Type I CSI feedback	Qualcomm Incorporated
R1-1708665	Discussion on Type I CSI feedback	ITRI
#####	CSI feedback Type II
Limit to 1 contribution per 1 company/organization/university
R1-1707127	Type II CSI feedback based on linear combination	ZTE
R1-1708139	Category 1 codebook design for Type II codebook	Huawei, HiSilicon
R1-1708593	On Type II CSI feedback	Qualcomm Incorporated
R1-1708688	Codebook design for Type II CSI feedback	Ericsson
R1-1709183 	Discussion on CSI feedback Type II	LG Electronics
R1-1707611

R1-1709232	WF on Type I and II CSI codebooks	Samsung, Ericsson, Huawei, HiSilicon, NTT DOCOMO, Intel Corporation, CATT, ZTE, Nokia, Alcatel-Lucent Shanghai Bell, AT&T, BT, CATR, China Telecom, CHTTL, Deutsche Telekom, Fujitsu, Interdigital, KDDI, Mitsubishi Electric, NEC, OPPO, Reliance Jio, SK Telecom, Sharp, Sprint, Verizon, Xiaomi, Xinwei, CEWiT, IITH, Tejas Networks, IITM


**Agreements:**

* Slides 4 to 24 in R1-1709232 are agreed
o	For slide 20, FFS whether or not support frequency-dependent parameterization and if so, the details
o	FFS whether or not to further enhance analog beamforming related operations especially for >1 layers

R1-1707361	On CSI feedback Type II	Intel Corporation
R1-1707484	Type II CSI feedback design	CATT

R1-1707763	High level view on type II codebook	AT&T
R1-1707790	On the type II feedback configurations	Spreadtrum Communications
R1-1707856	Overhead reduction on CSI feedback Type II	MediaTek Inc.
R1-1707962	Type II CSI reporting	Samsung
R1-1708457	CSI Feedback Type II for NR MIMO	NTT DOCOMO, INC.
R1-1708916	On type II CSI feedback in NR	Nokia, Alcatel-Lucent Shanghai Bell
#####	Other
R1-1707963	Discussion on CSI-RS Resource Allocation	Samsung
R1-1707964	Differential reporting for Type II CSI	Samsung
R1-1707965	System-level evaluation for Type II CSI	Samsung
R1-1707966	CSI parameters and multiplexing	Samsung
R1-1707967	CSI Feedback Overhead Reduction for NCJT	Samsung
R1-1707968	Discussions on channel and interference measurements for NR	Samsung
R1-1707969	Discussions on service specific CSI for NR	Samsung
R1-1708140	The remaining issues for Type II codebook	Huawei, HiSilicon
R1-1708689	On Dynamic Triggering for CSI Reports and CSI-RS	Ericsson
R1-1708690	A comparison of CSI-RS activation schemes based on MAC CE and DCI	Ericsson
R1-1708691	Identifying bounds on parameters in CSI framework	Ericsson
R1-1708692	Semi-persistent  CSI reporting on PUSCH	Ericsson
R1-1708693	Scalable codebook for up to 32 ports	Ericsson
R1-1708694	PDSCH rate matching	Ericsson
R1-1708695	Multi-panel codebook	Ericsson
R1-1708696	NR CSI Computation Capability	Ericsson
R1-1708697	On CSI reporting for short PUCCH	Ericsson
R1-1708698	Frequency parametrization for Type II CSI codebook	Ericsson
R1-1708699	Type II CSI for beamformed CSI-RS and hybrid operation	Ericsson
R1-1708700	Further details of measurement restriction configuration	Ericsson
R1-1708818	Multi-panel and Multi-level Codebook Design	ZTE
R1-1708917	Interference estimation options and configuration in NR	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708918	On the CRI definition and usability in NR	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708919	On the CSI timing relationhips	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708920	On hybrid CSI report: from LTE MIMO to NR MIMO	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708921	Codebook design for multi-panel operation	Nokia, Alcatel-Lucent Shanghai Bell
####	Reference signals and QCL
#####	CSI-RS
Limit to 2 contributions per 1 company/organization/university
R1-1707981	Remaining issues on NR CSI-RS	Samsung, Huawei, HiSilicon
R1-1709204	Summary of remaining issues and views on NR CSI-RS	Huawei, HiSilicon, Samsung


**Agreements:**

* At least for CSI acquisition, for N=2 OFDM symbols, support adjacent OFDM symbols for one CSI-RS resource
-	For N=4 OFDM symbols, down-selection between 2 and 4 for the minimum number of adjacent OFDM symbols for one CSI-RS resource
* At least for CSI acquisition, for N=2 OFDM symbols, support a uniform RE mapping pattern wherein the same sub-carriers are occupied in each symbol of one CSI-RS resource 
-	FFS: For N=4 OFDM symbols, the RE mapping pattern of one CSI-RS resource

R1-1709456	Summary of offline discussion on CSI-RS	Huawei, HiSilicon

**Agreements:**

* Support at least OCC as one type of CDM sequence 
o	FFS: CDM of CSI-RS antenna ports on an RE-level comb based on phase rotation (cyclic shift) sequences
* Support at least CDM 8 for an X-port CSI-RS resource at least when X=32 
o	FFS:  Support for other pairings of CDM value and number of ports X 
* For an X-port CSI-RS resource, at least for X = 1, support density D >= 1 RE/port/PRB
o	FFS: Support for D > 1 for other values of X
o	Note: For X = 1, CDM code value(s) assumed to be 1 	

R1-1709303	Way Forward on CSI-RS for Beam Management Intel, InterDigital, Samsung, MediaTek, Nokia, Alcatel Lucent Shanghai Bell, CATT, KT, NEC, Xinwei, Ericsson, Qualcomm, ZTE, China Telecom, vivo, AT&T, OPPO, LG, Huawei, Hisilicon

**Agreements:**

* Confirm the WA of CSI-RS for Beam Management in RAN1 #88bis (copied below).
* For CSI-RS for Beam Management, NR supports sub-time units equal to and smaller than an OFDM symbol in a reference numerology
* FFS details including configurability, e.g., taking into account UE implementation complexity/capability and impact on CSI-RS design 
* FFS the case of time unit larger than an OFDM symbol in a reference numerology
* E.g., 
* Opt-1: IFDMA 
* Opt-2: Larger subcarrier spacing 
* Opt-3: DFT-based
* Down-select from the below options when sub-time unit smaller than an OFDM symbol in a reference numerology:
* Opt-1: IFDMA 
* Opt-2: Larger subcarrier spacing 
* Opt-3: DFT-based 
* Note: for beam management, the reference numerology for a bandwidth part is determined based on the UE-specific configuration for the bandwidth part

R1-1709608	WF on location of CSI-RS OFDM symbols	Samsung, InterDigital, LGE

**Conclusion:**

* FFS how NZP CSI-RS REs can be mapped (e.g., matching-around or puncturing) in a slot, considering potential overlapping with other channels/signals (e.g., DMRS, PTRS, SS block, some CORESET, etc.)

R1-1709572	WF on CSI-RS pattern design	Huawei, HiSilicon, ZTE

**Agreements:**

* At least for CSI acquisition, for density D=1 RE/port/PRB and X>4 ports,
* For N=1 OFDM symbol, support X=8, 12 ports
* For N=2 OFDM symbols, support X= 8, 12, 16ports
* FFS the case of X=24
* For N=4 OFDM symbols, support at least X=32 ports
* FFS the case of X=8/16/24


**Agreements:**

* At least for CSI acquisition, for density D=1 RE/port/PRB and X>4 ports, at least the following option is supported:
* For N=1 OFDM symbol, support [2 or 4] as the minimum number of adjacent REs in frequency domain for one CSI-RS resource
* FFS whether it’s 2 or 4
* For N=2 OFDM symbols, support [2 or 4 ] as the minimum number of adjacent REs in frequency domain for one CSI-RS resource
* FFS whether it’s 2 or 4
* For N=4 OFDM symbols, support [2 or 4] as the minimum number of adjacent REs in frequency domain for one CSI-RS resource
* FFS whether it’s 2 or 4
* FFS whether or not to support other options such as CDM CSI-RS antenna ports on a RE level comb based on phase rotation [cyclic shifts/sequences] including D=1 and D≠1

R1-1709599	WF on CDM pattern of CSI-RS for CSI acquisition	ZTE, Huawei, HiSilicon

**Agreements:**

* For CDM pattern(s) per X port CSI-RS for CSI acquisition 
* For X=2 with CSI-RS RE pattern (M,N)=(2,1), 
* FFS support no CDM 
* Support FD-CDM2
* For X=4 with CSI-RS RE pattern (M,N)=(4,1)
* FSS support no CDM
* Support FD-CDM2
* FFS CDM4
* For X=4 with CSI-RS RE pattern (M,N)=(2,2)
* FFS support no CDM
* Support FD-CDM2
* FFS support TD-CDM2
* FFS CDM4

R1-1709317	WF on CSI-RS for beam management	ZTE, LGE, ASTRI

R1-1707363	On CSI-RS for CSI acquisition	Intel Corporation
R1-1708594	Discussion on CSI-RS design	Qualcomm Incorporated

R1-1706931	CSI-RS design for beam management	Huawei, HiSilicon
R1-1706932	CSI-RS design for CSI acquisition	Huawei, HiSilicon
R1-1707128	On CSI-RS for beam management	ZTE
R1-1707129	On CSI-RS for CSI acquisition	ZTE
R1-1707246	On CSI-RS design for NR	vivo
R1-1707362	On CSI-RS for beam management	Intel Corporation
R1-1707485	Discussion on CSI-RS for CSI acquisition	CATT
R1-1707486	Discussion on CSI-RS for beam management	CATT
R1-1707612	On CSI-RS design for beam management	LG Electronics
R1-1707613	On CSI-RS design for CSI acquisition	LG Electronics
R1-1707700	CSI-RS design for beam management	Guangdong OPPO Mobile Telecom.
R1-1707748	CSI-RS design principle	AT&T
R1-1707783	On using sub-time unit in CSI-RS for beam management	Spreadtrum Communications
R1-1707810	On CSI-RS design for beam management	NEC
R1-1707853	On CSI-RS design for potential extension to support  fine time and frequency tracking	MediaTek Inc.
R1-1707970	Discussions on CSI-RS design for NR MIMO	Samsung
R1-1707971	CSI-RS for beam management	Samsung
R1-1708340	On CSI-RS Design for Beam Management	InterDigital, Inc.
R1-1708458	Views on CSI-RS	NTT DOCOMO, INC.
R1-1708701	On CSI-RS design	Ericsson
R1-1708702	On CSI-RS design for beam management	Ericsson
R1-1708922	On the CSI-RS configurations for NR CSI acquisition	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708923	On CSI-RS Design for DL Beam Management	Nokia, Alcatel-Lucent Shanghai Bell
R1-1709146	CSI-RS design for DL beam management	KT Corp.
#####	DMRS
Limit to maximum 2 contributions (one for discussion, another for evaluation) per 1 company/organization/university for DL and UL, independently
R1-1708603	Remaining issues on NR DM-RS 	Qualcomm
R1-1709305	WF on additional DMRS structure	Samsung, Qualcomm Incorporated, Ericsson, CATT, Nokia, Alcatel-Lucent Shanghai Bell, vivo, Mitsubishi Electric Co., NTT DOCOMO, INC., ETRI, KT Corp., MediaTek Inc.
Also supported by Interdigital

**Agreements:**

* Support additional DMRS symbols with same density in frequency domain compared to front loaded DMRS
* FFS: Necessity of reduced DMRS density in additional DMRS symbols

R1-1709310	WF on DL DMRS for self-contained feedback	ZTE, Qualcomm, Intel, MediaTek, Xinwei
R1-1709420	WF on DL DMRS for self-contained feedback	ZTE, Qualcomm, Mitsubishi Electric Co., Xinwei

**Conclusion:**

o	When ACK/NACK feedback is configured in the same slot with corresponding DL data transmission 
* For 7-symbol slot. down selection should be done in next meeting
* Alt.1:   Only support front loaded DMRS
* Alt.2 :  Support  front loaded DMRS +additional DMRS
* Alt.3 :  Configurable between Alt.1 and Alt.2
* For  14-symbol slot, down selection should be done in next meeting
* Alt.1:   Only support front loaded DMRS
* Alt.2 :  Support  front loaded DMRS +additional DMRS
* Alt.3 :  Configurable between Alt.1 and Alt.2
* Companies are encouraged to provide simulation results for additional DMRS position for mobility scenarios and the assumed number of symbols for front loaded DMRS and additional DMRS, and consider the minimum time to support fast demodulation for DM-RS pattern related design 

R1-1709477	WF on DL DMRS multiplexing in the time domain	ZTE, Qualcomm
Working assumptions:
* For DMRS port multiplexing schemes on 2 adjacent front-loaded DMRS symbols in the time domain:
* Support DMRS configurations with two alternatives
* Time domain OCC (TD-OCC) of antenna ports is supported. In addition, for the other alternative only one of following is supported:
* Option 1A: TDM of antenna ports
* Option 1B: Time domain repetition of all antenna ports
* Notes: 
* This is for both SU-MIMO and MU-MIMO
* If  1B is chosen then whether and/or not pattern shift is used must be decided
Objected by Huawei, HiSilicon

R1-1709588	WF on DMRS port multiplexing in the frequency domain	Samsung, ZTE, Intel, Mediatek, Huawei, HiSilicon, CATT, ITL, KRRI, Spreadtrum, Mitsubishi Electric Co., ETRI, China Unicom, Deutsche Telekom, China Telecom, ITRI, CHTTL, CATR
R1-1709287	WF on DM-RS for CP-OFDM	NTT DOCOMO, Qualcomm, CEWiT, IIT-H, IIT-M, Cohere Technologies, Ericsson, Nokia, ASB, LG Electronics, Xinwei, InterDigital, AT&T, NEC, KDDI, OPPO, Sharp, Fujitsu
Also supported by KT

R1-1709618	WF on UL DMRS pattern for DFT-S-OFDM	LG Electronics, Qualcomm, NTT DOCOMO, Ericsson, InterDigital, Nokia, ASB, CATT, KDDI, NEC, AT&T, Xinwei, Cohere Technologies, OPPO

R1-1709833	WF on Front-load DMRS design	Qualcomm, Huawei, HiSilicon, ZTE, Mediatek, Ericsson, Mitsubishi, LGE, ITL, Docomo, ETRI, CATT
Working assumption:
* UEs in a cell are higher layer configured with 2 DMRS configurations for the front-load DMRS for UL/DL CP-OFDM
* Front-load DMRS Configuration 1: Supports up to 8 ports
* IFDM based pattern with Comb [2] and/or [4] w cyclic shifts (CS)
* One OFDM symbol: 
* To be down selected to 1 Alt:
* Alt 1: Comb 2 + 2 CS, up to 4 ports
* Alt 2: Comb 4 + 2 CS, up to 8 ports
* Two OFDM symbols: 
* To be down selected to 2 Alts:
* Alt. 1: Comb 2 + 2 CS + TD-OCC ({1 1} and {1 -1}), up to 8 ports
* Alt. 2: Comb 2 + 4 CS + TD-OCC ({1 1}), up to 8 ports
* Alt. 3: Comb 4 + 2 CS + TD-OCC ({1 1}), up to 8 ports
* Front-load DMRS Configuration 2: Supports up to 12 ports
* FD-OCC pattern with adjacent REs in the frequency domain
* One OFDM symbol:
* To be down selected to 1 Alt:
* Alt. 1: 2-FD-OCC across adjacent REs in the frequency domain up to 6 ports
* Alt. 2: 2-FD-OCC across adjacent REs in the frequency domain up to 4 ports
* Alt. 3: 2-FD-OCC across adjacent REs in the frequency domain up to 2 ports
* Two OFDM symbols: 
* 2-FD-OCC across adjacent REs in the frequency domain + TDM up to 12 ports
* 2-FD-OCC across adjacent REs in the frequency domain + TD-OCC (both {1,1} and {1,-1}) up to 12 ports
* FFS: DMRS pattern before configuration, e.g., SIB1

R1-1706934	Evaluation results of DMRS design for DL data channel	Huawei, HiSilicon
R1-1708704	Evaluation results for DL DMRS	Ericsson

R1-1707972	Discussion on DL DMRS design for NR	Samsung

R1-1708597	Evaluation of UL DMRS design	Qualcomm Incorporated
R1-1707135	DL DMRS simulation results	ZTE
R1-1708703	On DL DMRS design	Ericsson

R1-1706933	Design of DL DMRS for data transmission	Huawei, HiSilicon
R1-1706935	UL DMRS design for data transmission	Huawei, HiSilicon
R1-1706936	Evaluation results of DMRS design for UL data channel	Huawei, HiSilicon
R1-1707087	Further evalution on DMRS Design Details	Beijing Xinwei Telecom Techn.
R1-1707130	Discussion on downlink DMRS design	ZTE
R1-1707131	Discussion on uplink DMRS design	ZTE
R1-1707247	On DL DMRS design for NR	vivo
R1-1707364	DM-RS design for DL	Intel Corporation
R1-1707365	DM-RS design for UL	Intel Corporation
R1-1707487	Discussion on DMRS design for DL	CATT
R1-1707488	Discussion on DMRS design for UL	CATT
R1-1707614	On DL DMRS design	LG Electronics
R1-1707615	On UL DMRS design	LG Electronics
R1-1707784	On front-loaded DMRS pattern and port multiplexing	Spreadtrum Communications
R1-1707811	Considerations on the sequence design of DMRS	NEC
R1-1707854	On downlink DMRS pattern	MediaTek Inc.
R1-1707973	Evaluation results on DL DMRS for NR	Samsung
R1-1707974	Discussion on UL DMRS design for NR	Samsung
R1-1707975	Evaluation results on UL DMRS for NR	Samsung
R1-1708094	Discussion on downlink DMRS design	ETRI
R1-1708095	Discussion on uplink DMRS design	ETRI
R1-1708321	Considerations on DMRS pattern for NR	Innovative Technology Lab Co.
R1-1708341	On DM-RS design for NR	InterDigital, Inc.
R1-1708459	Views on DM-RS	NTT DOCOMO, INC.
R1-1708460	Evaluation results of DM-RS	NTT DOCOMO, INC.
R1-1708595	Discussion on UL DMRS design	Qualcomm Incorporated
R1-1708596	Discussion on DL DMRS design	Qualcomm Incorporated
R1-1708598	Evaluation of DL DMRS design	Qualcomm Incorporated
R1-1708705	On UL DMRS design	Ericsson
R1-1708706	Evaluation results for UL DMRS	Ericsson
R1-1708924	On details of DL DM-RS for NR physical data channels	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708925	DL DM-RS patterns link performance evaluation	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708926	On details of UL DM-RS for NR physical data channels	Nokia, Alcatel-Lucent Shanghai Bell
R1-1709023	DMRS designs for NR MIMO: views on density reduction for DMRS	Mitsubishi Electric Co.
R1-1709025	DMRS designs for NR MIMO: evaluation results	Mitsubishi Electric Co.
R1-1709027	DMRS designs for NR MIMO: evaluation results	Mitsubishi Electric Co.
#####	PT-RS
Limit to 1 contribution per 1 company/organization/university for DL and UL, independently
R1-1707803	Summary of PTRS open issues and companies views		Ericsson

R1-1709286	WF on PT-RS	NTT DOCOMO, Mitsubishi Electric, Ericsson, Sharp, IITH, CEWIT, IITM, Tejas Networks, Reliance Jio, Spreadtrum, Qualcomm, LGE, Nokia, InterDigital
Also supported by CMCC

**Agreements:**

* Confirm the following working assumption.
* Uplink PTRS for DFT-s-OFDM waveform is supported.
* Presence of PTRS for DFT-s-OFDM is UE-specifically configurable
* Multiple pattern/density of PTRS for DFT-s-OFDM is supported
* FFS: implicit or explicit signaling
* Working assumption: Support Pre-DFT PT-RS insertion for UL DFT-S-OFDM.

R1-1709502	WF on PTRS position for CP-OFDM	ZTE, vivo, Nokia, Alcatel-Lucent Shanghai Bell, Xinwei, ASTRI, Ericsson, Huawei, HiSilicon, Samsung, LG Electronics, NTT DOCOMO

**Agreements:**

* The RBs containing PTRS can be derived from the scheduled RBs and the associated frequency density
* For a given RB, if present, one PTRS port should be mapped on one subcarrier carrying one or more DMRS ports of the associated DMRS port group
* FFS: to support different subcarriers by complementary option  
* Support non-overlapping between PTRS and CSI-RS
* FFS whether PTRS or CSI-RS should be punctured or shifted on overlapping part if PTRS and CSI-RS are collided
* Support non-overlapping between PTRS and SRS
* FFS whether PTRS or SRS should be punctured or shifted on overlapping part if PTRS and SRS are collided
* FFS: Support non-overlapping between PTRS and SS block
* FFS whether PTRS or SS block should be punctured or shifted on overlapping part if PTRS and SS block are collided

R1-1709521	WF on PTRS for CP-OFDM	Huawei, HiSilicon, National Instruments, Xinwei, NTT DOCOMO, Panasonic, Samsung, ZTE, Nokia, Alcatel-Lucent Shanghai Bell, Ericsson

**Agreements:**

* For SU-MIMO, support predefined and RRC-configured association between PTRS densities and scheduled MCS/BW
* FFS: RRC configuration can override the predefined association 
* Table 1 in R1-1709521 to represent association between PTRS time density and scheduled MCS
* Table 2 in R1-1709521 to represent association between PTRS frequency density and scheduled BW
* Note: The number of rows in Table 1 and 2 can be reduced if the densities are down-selected
* FFS: UE to suggest MCS/BW thresholds in Table 1 and 2
* FFS: complementary DCI signaling 
* For CP-OFDM and the tables on next page, the time-densities (TD) of PTRS include every 4th symbol, every 2nd symbol, and every symbol, while the frequency-densities (FD) of PTRS include occupying one subcarrier (not necessarily in all REs, depending on the time density) in [every RB], every 2nd RB, every 4th RB, [every 8th RB, and every 16th RB]
* The time density of PTRS is expected to increase with increasing the scheduled MCS (except for those reserved MCSs).
* The frequency density of PTRS is expected to decrease with increasing the scheduled BW (i.e., the number of scheduled RBs)
* FFS: frequency localized mapping
* FFS: The frequency density of PTRS is expected to increase with increasing the scheduled MCS
* For a UE, the configured PTRS ports are FDMed
* FFS: TDM and/or CDM
* Support association between one PTRS port and one DMRS port per DMRS port group
* FFS: Configurable or fixed association
* FFS: Signalling methods, e.g., RRC, MAC-CE, DCI
* FFS: Support association between one or multiple PTRS ports and multiple DMRS ports per DMRS port group
* Study the benefits of configuring the number of PTRS ports for a UE, based on UE capability or UE report on
* Panels/TXRUs sharing a common oscillator or not, and/or
* Maximum number of independent oscillators at this UE, and/or
* Whether phase errors measured on PTRS ports are same or different

R1-1709414	WF on PT-RS configuration LG Electronics, Samsung, ZTE

**Agreements:**

* For CP-OFDM,
* For SU-MIMO, dynamic presence of PTRS is determined by allocated MCS, BW, and subcarrier spacing
* FFS: For MU-MIMO case
* For SU-MIMO, time pattern of PTRS is determined by allocated MCS, and subcarrier spacing
* FFS: For MU-MIMO case

R1-1709772	WF on Orthogonal multiplexing of PT-RS LG Electronics, Samsung, ZTE, Sharp
Also supported by Panasonic

Prepare draft LS to RAN4 in R1-1709658 until Thursday – Mattias (Ericsson)
* No consensus to send an LS during this meeting

R1-1708142	PTRS for DFT-s-OFDM	Huawei, HiSilicon
R1-1708707	On DL PTRS design	Ericsson

R1-1708599	Phase and frequency tracking reference signal considerations	Qualcomm Incorporated

R1-1706937	PTRS for CP-OFDM	Huawei, HiSilicon
R1-1707088	Evaluation and Discussion on DL Phase Tracking RS Design	Beijing Xinwei Telecom Techn.
R1-1707132	Discussion on RS for phase tracking	ZTE
R1-1707189	DL PT-RS port association, multiplexing and indication	Panasonic Corporation
R1-1707248	Discussion on PTRS design	vivo
R1-1707366	On PT-RS for CP-OFDM	Intel Corporation
R1-1707367	On PT-RS for DFT-s-OFDM	Intel Corporation
R1-1707489	Further discssion on RS for phase tracking	CATT
R1-1707616	On DL PT-RS design	LG Electronics
R1-1707617	On UL PT-RS design	LG Electronics
R1-1707785	PT-RS design for DFT-s-OFDM	Spreadtrum Communications
R1-1707976	On DL PTRS design	Samsung
R1-1707977	On PTRS for DFT-s-OFDM	Samsung
R1-1708226	pre-DFT multiplexing of PT-RS for DFT-S-OFDM	IITH
R1-1708272	Discussion on explicit and implicit signaling for PT-RS	National Instruments Corp.
R1-1708342	Remaining Issues on PTRS for DFT-s-OFDM	InterDigital, Inc.
R1-1708392	Phase-tracking reference signal design for DL CP-OFDM	CMCC
R1-1708393	Phase-tracking reference signal for DFT-s-OFDM systems	CMCC
R1-1708461	Views on PT-RS	NTT DOCOMO, INC.
R1-1708708	On UL PTRS design	Ericsson
R1-1708927	Discussion on PT-RS design for CP-OFDM	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708997	UL PTRS for DFTsOFDM waveform	Mitsubishi Electric RCE
#####	SRS
Limit to 1 contribution per 1 company/organization/university
R1-1709164	Open issues on SRS design	Sony

**Agreements:**

* ZC based sequences shall be used for NR SRS sequence design


**Conclusion:**

* Regarding SRS sequence design, companies are encouraged to perform evaluations considering:
* Alt-1 SRS sequence generation is not a function of allocated PRB position
* Alt-2 SRS sequence generation is a function of allocated PRB position
* Aim to conclude next meeting

R1-1709363	Open issues on SRS design	Sony

R1-1709528	WF on SRS partial band hopping	CATT, Nokia, Huawei, Sony

**Agreements:**

* Support switching between partial bands for SRS transmissions in a CC
¬	At least when an UE is not capable of simultaneous transmission in partial bands in a CC 
¬	Consider RF retuning requirement for partial band switching
* Note: definition of partial band is equivalent to “bandwidth part” definition in wider bandwidth operation agenda item

R1-1709378	WF on Number of symbols for SRS		Ericsson, Sony, Mitsubishi Electric

**Agreements:**

Ý	NR supports configuration of an X-port SRS resource spanning N adjacent OFDM symbols within the same slot where
* N = 1, 2, 4 at least

R1-1709379	WF on Frequency hopping for SRS	Ericsson, Sony, Mitsubishi Electric

**Conclusion:**

* Send an LS to RAN4 regarding the following:
* RAN1 is discussing the possibility of enabling SRS hopping within a slot. For an X-port SRS resource spanning N adjacent OFDM symbols within the same slot, all X ports may be sounded as frequently as up to each of the N symbols in a different portion of the band. In addition to other aspects that need to be investigated in RAN1, RAN1 is also wondering UE RF implementation aspects that may place constraints on the design (e.g., total SRS hopping bandwidth) of the hopping pattern, e.g., required time for frequency re-tuning (if re-tuning needed) or transient period if re-tuning is not needed. Note that RAN1 also made an agreement as follows (Mattias to copy previous agreements on SRS switching across bandwidth parts)
* Draft LS by Mattias (Ericsson) R1-1709819, which is endorsed. Final LS approved in R1-1709836

R1-1709376	WF on SRS Tx beam determination		LG Electronics, Intel Corporation

**Agreements:**

* When UE beam correspondence is not hold, 
* NR supports a UL RS indication for a configured SRS resource, where UE transmits the SRS using the beam used for transmitting the indicated UL RS
* The UL RS indication can be SRI (SRS resource indicator), at least
* FFS: The indication via MAC CE and/or DCI

**Agreements:**

* When UE beam correspondence holds,
* NR supports the indication for a configured SRS resource, where the transmission of the SRS resource is performed with the same spatial filtering as the one used for the reception of the indicated DL RS
* The indication can be based on CSI-RS resource, 
* FFS: signaling details (e.g., a low overhead mechanism, reciprocal QCL (if supported))
* FFS: The indication via MAC CE and/or DCI
* NR supports a UL RS indication for a configured SRS resource, where UE transmits the SRS using the beam used for transmitting the indicated UL RS
* The UL RS indication can be SRI (SRS resource indicator), at least
* FFS: The indication via MAC CE and/or DCI

R1-1709610	WF on SRS framework	CATT
R1-1709764	WF on SRS configuration	CATT, Ericsson, LG

**Agreements:**

* For the purposes of DL/UL CSI acquisition and beam management
* A UE can be configured with K >= 1 SRS resources where
* A given X-port SRS resource spans N = 1,2, or 4 adjacent symbols within a slot where all X ports are mapped to each symbol of the resource
* FFS whether or not support N adjacent sub-time-units
* FFS whether or not to additionally support non-adjacent symbols/sub-time-units
* FFS whether to not to additionally N>4
* FFS the details for transmission of SRS (e.g., w.r.t., beams, etc.) within the N symbols/sub-time-units
* FFS whether or not/how to support antenna switching using SRS
* A given SRS resource can be configured as aperiodic, periodic, or semi-persistent, where
* Periodic: The resource is configured with a slot-level periodicity and slot-offset
* Semi-persistent: The resource is configured with a slot-level periodicity and slot-offset
* Multiple SRS resources can be activated/deactivated with a single message
* FFS: Activation/deactivation details
* Aperiodic: The resource is configured without a slot-level periodicity and slot offset
* Multiple SRS resources can be triggered with a single message
* Note: For periodic/semi-persistent, different resources may have different periodicities and/or slot offsets
* FFS the location(s) of SRS symbol(s) within a slot
* FFS: Configuration details including grouping of SRS resources to allow low signaling overhead for indicating allocated SRS resources

R1-1709662	WF on the Number of Ports for UL Transmission Samsung, Nokia, Alcatel-Lucent Shanghai Bells, Xinwei, AT&T, National Instruments, Motorola Mobility, Lenovo

R1-1709638	WF on SRS sequence generation	Mitsubishi Electric, Huawei, HiSilicon, Nokia
R1-1709699	WF on SRS sequence generation 	Mitsubishi Electric, Huawei, HiSilicon, Nokia, AT&T, Intel, ZTE, LG Electronics, Panasonic, Ericsson

**Agreements:**

* Support SRS sequence ID to generate SRS sequences where SRS sequence ID is UE specifically configured using
* RRC
* FFS: UE specific ID (example: C-RNTI) which can be overwritten by RRC signaling
* FFS: for combination of RRC and DCI
* Root(s) of Zadoff-Chu based sequence(s) of an SRS sequence is at least a function of SRS sequence ID
* FFS on details of the function, 
* Examples: 
* The function is parameterized only by SRS sequence ID
* The function is parameterized by SRS sequence ID, length of SRS sequence, SRS sequence scheduled time
* The function is a random number generator, intended for sequence hopping, with a SRS sequence ID as a random seed
* The function is parameterized by SRS sequence ID, scheduled time and frequency location of the SRS sequence
* FFS: sub-time-units for SRS (if supported),  SRS sequence generation details, e.g., block wise sequence generation and concatenation (one/multiple roots), long sequence based designs (one root), etc.

R1-1709551	WF on Sequence design for SRS	Ericsson, Panasonic

R1-1709006	Views on SRS sequence ID and generation of SRS sequences	Mitsubishi Electric Co.

R1-1706938	UL SRS design for  beam management, CSI acquisition	Huawei, HiSilicon
R1-1707133	Discussion on SRS design for NR	ZTE
R1-1707368	Discussion on SRS for NR	Intel Corporation
R1-1707490	Further discussion on SRS transmission	CATT
R1-1707618	On SRS design and related operations	LG Electronics
R1-1707701	On SRS design for NR	Guangdong OPPO Mobile Telecom.
R1-1707764	Discussion of SRS resource configuration	Lenovo, Motorola Mobility
R1-1707836	SRS design in NR	MediaTek Inc.
R1-1707978	NR-SRS design for NR	Samsung
R1-1708085	Discussion on SRS transmission for NR	Panasonic Corporation
R1-1708343	On SRS for NR	InterDigital, Inc.
R1-1708600	Discussion on SRS design	Qualcomm Incorporated
R1-1708709	SRS Design	Ericsson
R1-1708928	UL SRS design considerations in NR	Nokia, Alcatel-Lucent Shanghai Bell
#####	QCL
Limit to 1 contribution per 1 company/organization/university
R1-1707795	Summary of [88b-12] Email discussion on QCL types for NR	ZTE
R1-1709298	Summary of QCL	Nokia

R1-1709636	WF on QCL	Nokia

**Conclusion:**

* RAN1 considers a generic term “spatial Rx parameters” and defers to RAN4 performance testing the exact interpretation of “spatial Rx parameters”.
* The following interpretation alternatives for “spatial Rx parameters” can be further considered by RAN4:
* One or more of: AoA, Dominant AoA, average AoA, Power Angular Spectrum (PAS) of AoA, average AoD, PAS of AoD, transmit/receive channel correlation, transmit/receive beamforming, spatial channel correlation etc.
*  Prepare an LS – Mihai (Nokia) R1-1709822, endorsed by updating the 3rd paragraph with the above agreements, final LS agreed in R1-1709837


**Conclusion:**

* FFS For CSI-RS RSRP determination, CSI-RS RSRP is measured per CSI-RS port
* FFS reporting per CSI-RS port or not (if not per CSI-RS port, detailed reporting approaches)
* FFS impact due to sub-time-unit CSI-RS


**Agreements:**

* PDSCH DMRS ports in a PDSCH DMRS group per [bundled PRB] in CC are implicitly assumed QCLed w.r.t average gain, delay spread, Doppler spread, Doppler shift, and average delay parameters, spatial Rx parameters). 
* PTRS port and PDSCH DMRS port can be assumed QCL 
* w.r.t average gain, delay spread, Doppler spread, Doppler shift, and average delay parameters, spatial Rx parameters (e.g. PTRS and PDSCH DMRS sharing the same beam)
* w.r.t Doppler spread, Doppler shift  (e.g. PTRS and PDSCH DMRS sharing the same RF chain)
* FFS impact due to configurable association between PTRS port and PDSCH DM-RS port (if supported)
* CSI-RS ports within a CSI-RS resource have at least two types of QCL assumptions
* QCL w.r.t average gain, delay spread, Doppler spread, Doppler shift, and average delay parameters, spatial Rx parameters
* Not QCL’ed (e.g. for beam selection based on beamformed CSI-RS codebook)
* FFS whether some parameters can still be QCL’ed

R1-1708710	On QCL	Ericsson

R1-1706940	Details of QCL assumptions and related RS design considerations	Huawei, HiSilicon
R1-1707134	QCL/QCB design for UL and DL MIMO	ZTE
R1-1707369	On QCL for NR	Intel Corporation
R1-1707491	Discussion on QCL for NR	CATT
R1-1707619	Discussion on QCL for NR	LG Electronics
R1-1707979	On QCL for NR	Samsung
R1-1708344	On QCL assumption for NR	InterDigital, Inc.
R1-1708601	Discussion on QCL	Qualcomm Incorporated
R1-1708888	Discussion on QCL for NR	CATT
R1-1708929	On QCL Framework and Configurations in NR	Nokia, Alcatel-Lucent Shanghai Bell
#####	Fine time/frequency tracking of channel 
Limit to 1 contribution per 1 company/organization/university

R1-1709290	Summary of issues and views on fine time and frequency tracking of channel	Mediatek
R1-1709640	WF on RS design requirement for fine time and frequency tracking	MediaTek, Huawei, Hisilicon, Ericsson, Samsung
Also supported by Intel


**Agreements:**

* Fine/time frequency tracking RS (TRS) structure may include burst structure and TRS structure inside a burst
* Whether the term “TRS” appear in specifications is FFS
* RS(s) can be the existing ones, revision of the existing ones, or new ones
* The parameters for burst structure are at least
* X: the length of TRS burst in terms of number of slots
* Y: the TRS burst periodicity in terms of number of slots
* TRS supports a single port
* FFS: Other numbers of TRS ports, resources, etc
* TRS has an equal RE spacing in frequency domain within a TRS bandwidth
* FFS: Whether multiple values are supported
* Note that more than one equal RE spacing can be considered
* FFS on TRS configuration details


**Conclusions:**

* All proponents are recommended to evaluate TRS until the next meeting
* Evaluation assumptions for TRS
* The parameters for TRS structure inside a burst are least
* Sf: TRS subcarrier spacing
* St: TRS symbol spacing within a slot
* N: Number of OFDM symbols per TRS within a slot
* B: TRS bandwidth in terms of number of RBs
* The different slots in a TRS burst may have different TRS parameters (N,B, Sf , St )  (FFS)
* FFS: TRS may have a repetition or staggered structure in time domain within a slot
* FFS: Whether symbol spacing is equal or non-equal within slot
* Note that pages 6 – 9 in R1-1706940 are candidate parameters for evaluations
* Note that other candidate parameters are not precluded

R1-1706939	Reference signal for fine time and frequency tracking	Huawei, HiSilicon

R1-1707855	RS design requirement for fine time and frequency tracking	MediaTek Inc.

R1-1707136	Discussion on fine time/frequency tracking of channel	ZTE
R1-1707370	On RS for time/frequency offset tracking	Intel Corporation
R1-1707620	Discussion on fine time/frequency tracking of channel	LG Electronics
R1-1707980	Discussions on fine time/frequency tracking for NR	Samsung
R1-1708260	Considerations on fine time/frequency tracking	Sony
R1-1708602	Further analysis on fine time/frequency tracking RS design	Qualcomm Incorporated
R1-1708711	On time and frequency tracking of the channel	Ericsson
R1-1708930	Views on the fTFT-RS in NR	Nokia, Alcatel-Lucent Shanghai Bell
#####	Other
R1-1707371	Control signalling to support 12 MIMO layers in MU-MIMO	Intel Corporation
R1-1707802	Summary of PTRS open issues	Ericsson
R1-1707803	Summary of PTRS open issues and companies views	Ericsson LM
R1-1707981	Remaining issues on NR CSI-RS	Samsung
R1-1707982	RS options for P1 beam management	Samsung
R1-1708141	Common UL/DL DMRS design	Huawei, HiSilicon
R1-1708170	DMRS design and simulation results for ECP	Huawei, HiSilicon
R1-1708171	UL SRS sequence design in NR	Huawei, HiSilicon
R1-1708261	Open issues on SRS design	Sony
R1-1708603	Remaining issues for DMRS	Qualcomm Incorporated
R1-1708712	On a unified CSI-RS design to support multiple use cases	Ericsson
R1-1708713	On the collision between DMRS and DC subcarrier	Ericsson
R1-1708931	On the PT-RS Design for DFT-s-OFDM	Nokia, Alcatel-Lucent Shanghai Bell
####	Other
Including MIMO calibration
R1-1707794	Draft CR for TR38.802  Section 7.1.6 MIMO calibration	ZTE
Companies are encouraged to check the CR especially w.r.t. the tdoc number cited.
R1-1709832	TR38.802_CR_Section_7.1.6_MIMO calibration	ZTE

R1-1706929	Considerations on timing advance design in NR	Huawei, HiSilicon
R1-1706979	Discussion on phase3 system-level calibration for NR-MIMO	Huawei, HiSilicon
R1-1706980	Higher layer implications of NC-JT transmission from multiple TRPs	Huawei, HiSilicon
R1-1707089	NR MIMO System Level Phase 3 Calibration Results	Beijing Xinwei Telecom Techn.
R1-1707138	Further clarification for Phase 3 NR MIMO calibration	ZTE
R1-1707139	Calibration results for Phase 1 NR MIMO system level calibration	ZTE
R1-1707140	Calibration results for Phase 2 NR MIMO link level calibration	ZTE
R1-1707141	Calibration results for Phase 2 NR MIMO system level calibration	ZTE
R1-1707372	Calibration results for Phase 1 NR MIMO link level calibration	Intel Corporation
R1-1707373	Calibration results for Phase 1 NR MIMO system level calibration	Intel Corporation
R1-1707374	Calibration results for Phase 2 NR MIMO link level calibration	Intel Corporation
R1-1707621	Phase 2 and Phase 3 SLS Calibration Results for NR MIMO	LG Electronics
R1-1707622	Phase 2 LLS Calibration Results for NR MIMO	LG Electronics
R1-1707983	System level evaluation for NCJT	Samsung
R1-1707984	Evaluation results for dense urban scenario on 30GHz frequency band	Samsung
R1-1708096	NR MIMO Phase 2 SLS calibration results	ETRI
R1-1708274	Calibration results for Phase 1 NR MIMO link level calibration	ZTE
R1-1708275	Calibration results for Phase 3 NR MIMO calibration	ZTE
R1-1708462	Phase-3 SLS MIMO Calibration Results	NTT DOCOMO, INC.
R1-1708604	MIMO calibration results for sub6GHz	Qualcomm Incorporated
R1-1708605	MIMO calibration results for above 6GHz	Qualcomm Incorporated
R1-1708932	Phase 3 SLS NR MIMO calibration results on 30 GHz	Nokia, Alcatel-Lucent Shanghai Bell
R1-1708948	Phase 1 calibration Results of NR MIMO	CATR
R1-1708949	Phase 2 calibration Results of NR MIMO	CATR
R1-1708985	void	CATR
R1-1708986	void	CATR
R1-1709037	MIMO Phase-2 SLS calibration results on 30GHz frequency band	Samsung
R1-1709038	MIMO Phase-2 LLS calibration results on 30GHz frequency band	Samsung
R1-1709050	Calibration results for Phase 1 NR MIMO system level calibration	MOTOROLA MOBILITY LLC
R1-1709125	Calibration results for Phase 2 NR MIMO system level calibration	Intel Corporation


