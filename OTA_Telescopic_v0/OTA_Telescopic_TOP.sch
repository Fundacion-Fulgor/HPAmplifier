v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1130 -660 1130 -640 {lab=VSS}
N 1110 -660 1110 -600 {lab=xxx}
N 1230 -720 1260 -720 {lab=VOUTN}
N 1060 -330 1060 -320 {lab=VSS}
N 920 -390 970 -390 {lab=CMFBout}
N 940 -1045 1050 -1045 {lab=VPout}
N 1110 -1045 1260 -1045 {lab=VOUTP}
N 940 -640 940 -550 {lab=VNout}
N 940 -550 1040 -550 {lab=VNout}
N 1100 -550 1260 -550 {lab=VOUTN}
N 1260 -720 1260 -550 {lab=VOUTN}
N 1200 -370 1415 -370 {lab=VOUTN}
N 1200 -410 1305 -410 {lab=VOUTP}
N 1060 -470 1060 -450 {lab=VDD}
N 1110 -470 1110 -450 {lab=VREF}
N 1110 -330 1110 -270 {lab=#net1}
N 920 -640 940 -640 {lab=VNout}
N 920 -820 940 -820 {lab=VPout}
N 1230 -760 1260 -760 {lab=VOUTP}
N 1030 -240 1070 -240 {
lab=vbn}
N 840 -640 860 -640 {lab=VN}
N 840 -820 860 -820 {lab=VP}
N 1415 -720 1585 -720 {lab=VOUTN}
N 1305 -760 1585 -760 {lab=VOUTP}
N 1110 -240 1155 -240 {lab=VSS}
N 1155 -240 1155 -195 {lab=VSS}
N 1110 -195 1155 -195 {lab=VSS}
N 1110 -210 1110 -195 {lab=VSS}
N 1110 -195 1110 -175 {lab=VSS}
N 1110 -940 1110 -930 {lab=VDD}
N 1110 -900 1170 -900 {lab=VDD}
N 1170 -940 1170 -900 {lab=VDD}
N 1110 -940 1170 -940 {lab=VDD}
N 1110 -970 1110 -940 {lab=VDD}
N 1195 -1195 1215 -1195 {lab=VDD}
N 1195 -1155 1215 -1155 {lab=vbn}
N 1195 -1135 1215 -1135 {lab=VSS}
N 1305 -760 1305 -410 {lab=VOUTP}
N 1260 -760 1305 -760 {lab=VOUTP}
N 1415 -720 1415 -370 {lab=VOUTN}
N 1260 -720 1415 -720 {lab=VOUTN}
N 1010 -700 1030 -700 {lab=VNin}
N 1010 -780 1030 -780 {lab=VPin}
N 940 -820 960 -820 {lab=VPout}
N 940 -640 960 -640 {lab=VNout}
N 1195 -1175 1215 -1175 {lab=vbp}
N 1030 -900 1070 -900 {
lab=vbp}
N 940 -1045 940 -820 {lab=VPout}
N 1260 -1045 1260 -760 {lab=VOUTP}
N 1130 -840 1130 -820 {lab=VDD}
N 1130 -840 1200 -840 {lab=VDD}
N 1110 -870 1110 -820 {lab=#net2}
C {res.sym} 890 -820 1 0 {name=R5
value=3k
footprint=1206
device=resistor
m=1
}
C {res.sym} 890 -640 1 0 {name=R6
value=3k
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} 1200 -840 2 0 {name=p10 sig_type=std_logic lab=VDD}
C {OTA_Telescopic_core_v2.sym} 1110 -740 0 0 {name=x1}
C {OTA_Telescopic_CMFB2.sym} 1120 -390 0 1 {name=x2}
C {lab_wire.sym} 1060 -470 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {res.sym} 1070 -550 1 0 {name=R1
value=6.72k
footprint=1206
device=resistor
m=1}
C {res.sym} 1080 -1045 1 0 {name=R2
value=6.72k
footprint=1206
device=resistor
m=1}
C {sg13g2_pr/sg13_lv_pmos.sym} 1090 -900 0 0 {name=M3
l=2u
w=22u
ng=4
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_wire.sym} 1110 -970 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1215 -1195 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_lv_nmos.sym} 1090 -240 0 0 {name=M2
l=9.86u
w=9.86u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 1030 -240 0 0 {name=p13 sig_type=std_logic lab=vbn}
C {lab_wire.sym} 1215 -1155 0 1 {name=p16 sig_type=std_logic lab=vbn}
C {currentRef.sym} 1045 -1165 0 0 {name=x3}
C {lab_wire.sym} 1130 -640 2 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1060 -320 2 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1110 -175 2 0 {name=p17 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1215 -1135 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {ipin.sym} 840 -820 0 0 {name=p21 lab=VP}
C {ipin.sym} 840 -640 0 0 {name=p7 lab=VN}
C {opin.sym} 1585 -760 0 0 {name=p8 lab=VOUTP}
C {opin.sym} 1585 -720 0 0 {name=p22 lab=VOUTN}
C {ipin.sym} 1010 -780 0 0 {name=p6 lab=VPin}
C {ipin.sym} 1010 -700 0 0 {name=p9 lab=VNin}
C {opin.sym} 960 -820 0 0 {name=p12 lab=VPout}
C {opin.sym} 960 -640 0 0 {name=p18 lab=VNout}
C {iopin.sym} 860 -1055 2 0 {name=p19 lab=VDD}
C {iopin.sym} 860 -1025 2 0 {name=p23 lab=VSS}
C {iopin.sym} 1110 -470 0 0 {name=p11 lab=VREF}
C {lab_wire.sym} 1215 -1175 0 1 {name=p24 sig_type=std_logic lab=vbp}
C {lab_wire.sym} 1030 -900 0 0 {name=p25 sig_type=std_logic lab=vbp}
C {ipin.sym} 1110 -600 0 0 {name=p3 lab=CMFBin}
C {opin.sym} 920 -390 2 0 {name=p14 lab=CMFBout}
