v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 190 120 {}
N -360 90 -130 90 {lab=IB}
N -440 50 -440 60 {lab=IB}
N -220 -160 -220 -70 {lab=vm}
N -220 -10 -220 20 {lab=#net1}
N -220 20 -90 20 {lab=#net1}
N -90 20 -90 60 {lab=#net1}
N -90 20 30 20 {lab=#net1}
N 30 -10 30 20 {lab=#net1}
N 30 -120 30 -70 {lab=vota}
N -220 -300 -220 -250 {lab=VDD}
N -220 -300 30 -300 {lab=VDD}
N 30 -300 30 -250 {lab=VDD}
N -130 -220 -10 -220 {lab=vm}
N -130 -220 -130 -160 {lab=vm}
N -180 -220 -130 -220 {lab=vm}
N -220 -160 -130 -160 {lab=vm}
N -220 -190 -220 -160 {lab=vm}
N -220 -40 30 -40 {lab=VSS}
N -230 -300 -220 -300 {lab=VDD}
N -450 90 -440 90 {lab=VSS}
N -450 90 -450 160 {lab=VSS}
N -440 120 -440 160 {lab=VSS}
N -90 90 -80 90 {lab=VSS}
N -90 120 -90 160 {lab=VSS}
N -230 -220 -220 -220 {lab=VDD}
N -230 -300 -230 -220 {lab=VDD}
N 30 -220 40 -220 {lab=VDD}
N 40 -300 40 -220 {lab=VDD}
N 30 -300 40 -300 {lab=VDD}
N 30 -120 210 -120 {lab=vota}
N 30 -190 30 -120 {lab=vota}
N 40 -300 250 -300 {lab=VDD}
N -80 160 250 160 {lab=VSS}
N -290 -40 -260 -40 {lab=VIN}
N 250 -40 330 -40 {lab=VOUT}
N -440 50 -360 50 {lab=IB}
N -360 50 -360 90 {lab=IB}
N -400 90 -360 90 {lab=IB}
N -440 160 -90 160 {lab=VSS}
N -450 160 -440 160 {lab=VSS}
N -80 90 -80 160 {lab=VSS}
N -90 160 -80 160 {lab=VSS}
N -520 160 -450 160 {lab=VSS}
N -500 -300 -230 -300 {lab=VDD}
N -440 -150 -440 50 {lab=IB}
N 250 120 250 160 {lab=VSS}
N -30 90 210 90 {lab=IB}
N -30 90 -30 140 {lab=IB}
N -130 140 -30 140 {lab=IB}
N -130 90 -130 140 {lab=IB}
N 250 -40 250 60 {lab=VOUT}
N 250 -300 250 -150 {lab=VDD}
N 70 -40 250 -40 {lab=VOUT}
N 250 -90 250 -40 {lab=VOUT}
N 250 -120 280 -120 {lab=VSS}
N 250 90 260 90 {lab=VSS}
N 260 90 260 160 {lab=VSS}
N 250 160 260 160 {lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} -110 90 0 0 {name=M5
l=1u
w=3u
ng=1
m=3
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -420 90 0 1 {name=M6
l=1u
w=3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -240 -40 0 0 {name=M1
l=0.5u
w=10u
ng=1
m=16
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 50 -40 0 1 {name=M2
l=0.5u
w=10u
ng=1
m=16
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -200 -220 0 1 {name=M3
l=1u
w=10u
ng=1
m=4
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 10 -220 0 0 {name=M4
l=1u
w=10u
ng=1
m=4
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} -500 -300 2 0 {name=p19 lab=VDD}
C {iopin.sym} -520 160 2 0 {name=p23 lab=VSS}
C {ipin.sym} -290 -40 0 0 {name=p6 lab=VIN}
C {opin.sym} 325 -40 0 0 {name=p8 lab=VOUT}
C {ipin.sym} -440 -150 0 0 {name=p2 lab=IB}
C {lab_wire.sym} -110 -40 2 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 100 -120 2 0 {name=p1 sig_type=std_logic lab=vota}
C {lab_wire.sym} -90 -220 2 0 {name=p4 sig_type=std_logic lab=vm}
C {sg13g2_pr/sg13_lv_nmos.sym} 230 -120 0 0 {name=M7
l=0.15u
w=10u
ng=1
m=25
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 230 90 0 0 {name=M8
l=1u
w=3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 280 -120 2 0 {name=p5 sig_type=std_logic lab=VSS}
