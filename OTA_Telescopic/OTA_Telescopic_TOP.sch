v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1100 -660 1100 -640 {lab=VSS}
N 1080 -660 1080 -600 {lab=CMFBin}
N 1060 -265 1060 -255 {lab=VSS}
N 920 -325 970 -325 {lab=CMFBout}
N 1110 -1045 1320 -1045 {lab=VOUTP}
N 780 -640 780 -500 {lab=VNout}
N 1100 -500 1320 -500 {lab=VOUTN}
N 1320 -720 1320 -500 {lab=VOUTN}
N 1200 -305 1415 -305 {lab=VOUTN}
N 1200 -345 1360 -345 {lab=VOUTP}
N 1060 -405 1060 -385 {lab=VDD}
N 1110 -405 1110 -385 {lab=VREF}
N 1110 -265 1110 -205 {lab=#net1}
N 780 -640 800 -640 {lab=VNout}
N 780 -820 800 -820 {lab=VPout}
N 1030 -175 1070 -175 {
lab=vbn}
N 1110 -175 1155 -175 {lab=VSS}
N 1155 -175 1155 -130 {lab=VSS}
N 1110 -130 1155 -130 {lab=VSS}
N 1110 -145 1110 -130 {lab=VSS}
N 1110 -130 1110 -110 {lab=VSS}
N 1080 -940 1080 -930 {lab=VDD}
N 1080 -900 1140 -900 {lab=VDD}
N 1140 -940 1140 -900 {lab=VDD}
N 1080 -940 1140 -940 {lab=VDD}
N 1080 -970 1080 -940 {lab=VDD}
N 445 -805 465 -805 {lab=VDD}
N 445 -765 465 -765 {lab=vbn}
N 445 -745 495 -745 {lab=VSS}
N 1415 -720 1585 -720 {lab=VOUTN}
N 980 -700 1000 -700 {lab=VNin}
N 980 -780 1000 -780 {lab=VPin}
N 445 -785 465 -785 {lab=vbp}
N 1000 -900 1040 -900 {
lab=vbp}
N 780 -1045 780 -820 {lab=VPout}
N 1320 -1045 1320 -760 {lab=VOUTP}
N 1100 -840 1100 -820 {lab=VDD}
N 1100 -840 1170 -840 {lab=VDD}
N 1080 -870 1080 -820 {lab=#net2}
N 760 -640 780 -640 {lab=VNout}
N 780 -500 1040 -500 {lab=VNout}
N 760 -820 780 -820 {lab=VPout}
N 780 -1045 1050 -1045 {lab=VPout}
N 1360 -760 1585 -760 {lab=VOUTP}
N 1200 -760 1320 -760 {lab=VOUTP}
N 1200 -720 1320 -720 {lab=VOUTN}
N 380 -905 440 -905 {lab=VDD}
N 380 -875 440 -875 {lab=VSS}
N 645 -640 700 -640 {lab=VN}
N 645 -820 700 -820 {lab=VP}
N 1360 -760 1360 -345 {lab=VOUTP}
N 1320 -760 1360 -760 {lab=VOUTP}
N 1320 -720 1415 -720 {lab=VOUTN}
N 1415 -720 1415 -305 {lab=VOUTN}
C {lab_wire.sym} 1170 -840 2 0 {name=p10 sig_type=std_logic lab=VDD}
C {OTA_Telescopic_core.sym} 1080 -740 0 0 {name=x1}
C {OTA_Telescopic_CMFB.sym} 1120 -325 0 1 {name=x2}
C {lab_wire.sym} 1060 -405 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_lv_pmos.sym} 1060 -900 0 0 {name=M3
l=2.5u
w=12u
ng=2
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_wire.sym} 1080 -970 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 465 -805 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_lv_nmos.sym} 1090 -175 0 0 {name=M2
l=6.5u
w=12.5u
ng=2
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 1030 -175 0 0 {name=p13 sig_type=std_logic lab=vbn}
C {lab_wire.sym} 465 -765 0 1 {name=p16 sig_type=std_logic lab=vbn}
C {lab_wire.sym} 1100 -640 2 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1060 -255 2 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1110 -110 2 0 {name=p17 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 495 -745 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {ipin.sym} 645 -820 0 0 {name=p21 lab=VP}
C {ipin.sym} 645 -640 0 0 {name=p7 lab=VN}
C {opin.sym} 1585 -760 0 0 {name=p8 lab=VOUTP}
C {opin.sym} 1585 -720 0 0 {name=p22 lab=VOUTN}
C {ipin.sym} 980 -780 0 0 {name=p6 lab=VPin}
C {ipin.sym} 980 -700 0 0 {name=p9 lab=VNin}
C {opin.sym} 800 -820 0 0 {name=p12 lab=VPout}
C {opin.sym} 800 -640 0 0 {name=p18 lab=VNout}
C {iopin.sym} 380 -905 2 0 {name=p19 lab=VDD}
C {iopin.sym} 380 -875 2 0 {name=p23 lab=VSS}
C {iopin.sym} 1110 -405 0 0 {name=p11 lab=VREF}
C {lab_wire.sym} 465 -785 0 1 {name=p24 sig_type=std_logic lab=vbp}
C {lab_wire.sym} 1000 -900 0 0 {name=p25 sig_type=std_logic lab=vbp}
C {ipin.sym} 1080 -600 0 0 {name=p3 lab=CMFBin}
C {opin.sym} 920 -325 2 0 {name=p14 lab=CMFBout}
C {sg13g2_pr/rppd.sym} 730 -640 1 0 {name=R3
w=0.6e-6
l=6.73e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 730 -820 3 0 {name=R4
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
C {sg13g2_pr/rppd.sym} 1070 -500 3 0 {name=R2
w=0.6e-6
l=15.4e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {OTA_Telescopic_currentRef.sym} 295 -775 0 0 {name=x3}
