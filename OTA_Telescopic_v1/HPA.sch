v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1100 -660 1100 -640 {lab=VSS}
N 1060 -225 1060 -205 {lab=VSS}
N 945 -285 970 -285 {lab=CMFB}
N 1110 -1045 1320 -1045 {lab=VOUTp}
N 860 -700 860 -460 {lab=#net1}
N 1100 -460 1320 -460 {lab=VOUTn}
N 1320 -720 1320 -460 {lab=VOUTn}
N 1200 -265 1415 -265 {lab=VOUTn}
N 1200 -305 1360 -305 {lab=VOUTp}
N 1060 -370 1060 -345 {lab=VDD}
N 1110 -225 1110 -165 {lab=#net2}
N 860 -700 1000 -700 {lab=#net1}
N 860 -780 1000 -780 {lab=#net3}
N 1030 -135 1070 -135 {
lab=vbn}
N 1110 -135 1155 -135 {lab=VSS}
N 1155 -135 1155 -90 {lab=VSS}
N 1110 -90 1155 -90 {lab=VSS}
N 1110 -105 1110 -90 {lab=VSS}
N 1110 -90 1110 -70 {lab=VSS}
N 1080 -940 1080 -930 {lab=VDD}
N 1080 -900 1130 -900 {lab=VDD}
N 1130 -940 1130 -900 {lab=VDD}
N 1080 -940 1130 -940 {lab=VDD}
N 1080 -970 1080 -940 {lab=VDD}
N 445 -675 465 -675 {lab=vbn}
N 445 -705 465 -705 {lab=vbp}
N 1000 -900 1040 -900 {
lab=vbp}
N 860 -1045 860 -780 {lab=#net3}
N 1320 -1045 1320 -760 {lab=VOUTp}
N 1100 -840 1100 -820 {lab=VDD}
N 1080 -870 1080 -820 {lab=#net4}
N 760 -700 860 -700 {lab=#net1}
N 860 -460 1040 -460 {lab=#net1}
N 760 -780 860 -780 {lab=#net3}
N 860 -1045 1050 -1045 {lab=#net3}
N 1200 -760 1320 -760 {lab=VOUTp}
N 1200 -720 1320 -720 {lab=VOUTn}
N 380 -905 440 -905 {lab=VDD}
N 380 -875 440 -875 {lab=VSS}
N 1360 -760 1360 -305 {lab=VOUTp}
N 1320 -760 1360 -760 {lab=VOUTp}
N 1415 -720 1415 -265 {lab=VOUTn}
N 295 -765 295 -745 {lab=VDD}
N 295 -625 295 -605 {lab=VSS}
N 650 -780 700 -780 {
lab=VINp}
N 1415 -720 1485 -720 {
lab=VOUTn}
N 1320 -720 1415 -720 {lab=VOUTn}
N 1360 -760 1485 -760 {
lab=VOUTp}
N 1110 -370 1110 -340 {
lab=VREF}
N 380 -935 440 -935 {lab=VREF}
N 1080 -660 1080 -640 {
lab=CMFB}
N 650 -700 700 -700 {
lab=VINn}
C {lab_wire.sym} 1100 -840 0 1 {name=p10 sig_type=std_logic lab=VDD}
C {OTA_Telescopic_CMFB.sym} 1120 -285 0 1 {name=x2}
C {sg13g2_pr/sg13_lv_pmos.sym} 1060 -900 0 0 {name=M3
l=2.5u
w=12u
ng=2
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_wire.sym} 1080 -970 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 295 -765 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_lv_nmos.sym} 1090 -135 0 0 {name=M2
l=6.5u
w=12.5u
ng=2
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 1030 -135 0 0 {name=p13 sig_type=std_logic lab=vbn}
C {lab_wire.sym} 465 -675 0 1 {name=p16 sig_type=std_logic lab=vbn}
C {lab_wire.sym} 1100 -640 2 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1060 -205 2 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1110 -70 2 0 {name=p17 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 295 -605 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {iopin.sym} 380 -905 2 0 {name=p19 lab=VDD}
C {iopin.sym} 380 -875 2 0 {name=p23 lab=VSS}
C {lab_wire.sym} 465 -705 0 1 {name=p24 sig_type=std_logic lab=vbp}
C {lab_wire.sym} 1000 -900 0 0 {name=p25 sig_type=std_logic lab=vbp}
C {sg13g2_pr/rppd.sym} 730 -700 1 0 {name=R3
w=0.6e-6
l=6.73e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 730 -780 3 0 {name=R4
w=0.6e-6
l=6.73e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 1080 -1045 3 0 {name=R5
w=0.6e-6
l=15.4e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 1070 -460 3 0 {name=R2
w=0.6e-6
l=15.4e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {OTA_Telescopic_currentRef.sym} 295 -685 0 0 {name=x3}
C {lab_wire.sym} 1110 -370 0 0 {name=p11 sig_type=std_logic lab=VREF}
C {lab_wire.sym} 1060 -370 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {OTA_Telescopic_core.sym} 1080 -740 0 0 {name=x14}
C {iopin.sym} 380 -935 2 0 {name=p6 lab=VREF}
C {lab_wire.sym} 945 -285 2 1 {name=p8 sig_type=std_logic lab=CMFB}
C {lab_wire.sym} 1080 -640 2 1 {name=p9 sig_type=std_logic lab=CMFB}
C {ipin.sym} 650 -780 0 0 {name=p12 lab=VINp}
C {ipin.sym} 650 -700 0 0 {name=p3 lab=VINn}
C {opin.sym} 1485 -720 0 0 {name=p7 lab=VOUTn}
C {opin.sym} 1485 -760 0 0 {name=p14 lab=VOUTp}
