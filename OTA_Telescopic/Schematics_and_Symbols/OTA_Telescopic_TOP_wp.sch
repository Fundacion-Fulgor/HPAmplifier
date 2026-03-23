v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1100 -660 1100 -640 {lab=VSS}
N 1080 -660 1080 -600 {lab=CMFBin}
N 1060 -380 1060 -370 {lab=VSS}
N 920 -440 970 -440 {lab=CMFBout}
N 1200 -420 1415 -420 {lab=Vop}
N 1200 -460 1360 -460 {lab=Von}
N 1060 -520 1060 -500 {lab=VDD}
N 1110 -520 1110 -500 {lab=VREF}
N 1110 -380 1110 -320 {lab=I_N}
N 980 -690 1000 -690 {lab=VNout}
N 980 -790 1000 -790 {lab=VPout}
N 1450 -720 1600 -720 {lab=Vop}
N 980 -710 1000 -710 {lab=VNin}
N 980 -770 1000 -770 {lab=VPin}
N 1230 -1060 1250 -1060 {lab=I_P}
N 1100 -840 1100 -820 {lab=VDD}
N 1100 -840 1170 -840 {lab=VDD}
N 1080 -870 1080 -820 {lab=I_P}
N 1450 -760 1600 -760 {lab=Von}
N 1200 -760 1360 -760 {lab=Von}
N 1200 -720 1415 -720 {lab=Vop}
N 810 -920 870 -920 {lab=VDD}
N 810 -890 870 -890 {lab=VSS}
N 1080 -1110 1080 -1090 {lab=VDD}
N 1080 -970 1080 -950 {lab=VSS}
N 980 -730 1000 -730 {lab=VN}
N 980 -750 1000 -750 {lab=VP}
N 1415 -720 1415 -420 {lab=Vop}
N 1360 -760 1360 -460 {lab=Von}
N 1600 -870 1600 -760 {lab=Von}
N 1600 -870 1620 -870 {lab=Von}
N 1600 -720 1600 -610 {lab=Vop}
N 1600 -610 1620 -610 {lab=Vop}
N 1800 -610 1880 -610 {lab=VOUTP}
N 1800 -870 1880 -870 {lab=VOUTN}
N 1680 -990 1680 -940 {lab=I_P2}
N 1700 -950 1700 -930 {lab=VDD}
N 1700 -950 1770 -950 {lab=VDD}
N 1680 -730 1680 -680 {lab=I_P3}
N 1700 -690 1700 -670 {lab=VDD}
N 1700 -690 1770 -690 {lab=VDD}
N 1700 -810 1700 -790 {lab=VSS}
N 1700 -550 1700 -530 {lab=VSS}
N 1230 -1040 1280 -1040 {lab=I_P2}
N 1230 -1020 1300 -1020 {lab=I_P3}
N 1230 -1000 1360 -1000 {lab=I_N}
N 1450 -850 1450 -760 {lab=Von}
N 1360 -760 1450 -760 {lab=Von}
N 1450 -850 1460 -850 {lab=Von}
N 1450 -720 1450 -660 {lab=Vop}
N 1415 -720 1450 -720 {lab=Vop}
C {lab_wire.sym} 1170 -840 2 0 {name=p10 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1060 -520 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1080 -1110 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1110 -320 2 0 {name=p13 sig_type=std_logic lab=I_N}
C {lab_wire.sym} 1360 -1000 0 1 {name=p16 sig_type=std_logic lab=I_N}
C {lab_wire.sym} 1100 -640 2 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1060 -370 2 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1080 -950 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {ipin.sym} 980 -750 0 0 {name=p21 lab=VP}
C {ipin.sym} 980 -730 0 0 {name=p7 lab=VN}
C {opin.sym} 1880 -610 0 0 {name=p8 lab=VOUTP}
C {opin.sym} 1880 -870 0 0 {name=p22 lab=VOUTN}
C {ipin.sym} 980 -770 0 0 {name=p6 lab=VPin}
C {ipin.sym} 980 -710 0 0 {name=p9 lab=VNin}
C {opin.sym} 980 -790 2 0 {name=p12 lab=VPout}
C {opin.sym} 980 -690 2 0 {name=p18 lab=VNout}
C {iopin.sym} 810 -920 2 0 {name=p19 lab=VDD}
C {iopin.sym} 810 -890 2 0 {name=p23 lab=VSS}
C {iopin.sym} 1110 -520 0 0 {name=p11 lab=VREF}
C {lab_wire.sym} 1250 -1060 0 1 {name=p24 sig_type=std_logic lab=I_P}
C {lab_wire.sym} 1080 -870 0 0 {name=p25 sig_type=std_logic lab=I_P}
C {ipin.sym} 1080 -600 0 0 {name=p3 lab=CMFBin}
C {opin.sym} 920 -440 2 0 {name=p14 lab=CMFBout}
C {OTA_Telescopic_currentRef.sym} 1080 -1030 0 0 {name=x3}
C {OTA_Telescopic_CMFB.sym} 1120 -440 0 1 {name=x2}
C {OTA_Telescopic_FB.sym} 1090 -740 0 0 {name=x1}
C {Buffer.sym} 1720 -780 0 0 {name=x4}
C {Buffer.sym} 1720 -520 0 0 {name=x5}
C {lab_wire.sym} 1770 -950 2 0 {name=p17 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1770 -690 2 0 {name=p27 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1700 -790 2 0 {name=p28 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1700 -530 2 0 {name=p29 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1280 -1040 0 1 {name=p30 sig_type=std_logic lab=I_P2}
C {lab_wire.sym} 1300 -1020 0 1 {name=p31 sig_type=std_logic lab=I_P3}
C {lab_wire.sym} 1680 -990 0 1 {name=p15 sig_type=std_logic lab=I_P2}
C {lab_wire.sym} 1680 -730 0 1 {name=p26 sig_type=std_logic lab=I_P3}
C {lab_wire.sym} 1450 -760 2 0 {name=p32 sig_type=std_logic lab=Von}
C {lab_wire.sym} 1450 -720 2 0 {name=p33 sig_type=std_logic lab=Vop}
C {opin.sym} 1460 -850 0 0 {name=p34 lab=Von}
C {opin.sym} 1450 -660 0 0 {name=p35 lab=Vop}
