v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -300 -520 -60 -520 {
lab=VDD}
N -170 -100 -100 -100 {
lab=OUT_N}
N -170 -380 -100 -380 {
lab=OUT_P}
N -260 -380 -170 -380 {
lab=OUT_P}
N -300 -140 -300 -130 {
lab=OUT_N}
N -170 -340 -170 -260 {
lab=OUT_P}
N -170 -190 -170 -100 {
lab=OUT_N}
N -250 -100 -170 -100 {
lab=OUT_N}
N -60 -340 -60 -130 {
lab=OUT_P}
N -170 -380 -170 -340 {
lab=OUT_P}
N -170 -340 -60 -340 {
lab=OUT_P}
N -60 -350 -60 -340 {
lab=OUT_P}
N -300 -140 -250 -140 {
lab=OUT_N}
N -300 -350 -300 -140 {
lab=OUT_N}
N -250 -140 -250 -100 {
lab=OUT_N}
N -260 -100 -250 -100 {
lab=OUT_N}
N -170 -260 -170 -250 {
lab=OUT_P}
N -210 -260 -210 -220 {
lab=OUT_P}
N -210 -260 -170 -260 {
lab=OUT_P}
N -250 -140 100 -140 {
lab=OUT_N}
N -60 -340 180 -340 {
lab=OUT_P}
N -320 -100 -300 -100 {lab=VSS}
N -320 -100 -320 -30 {lab=VSS}
N -320 -30 -300 -30 {lab=VSS}
N -300 -70 -300 -30 {lab=VSS}
N -60 -70 -60 -40 {lab=#net1}
N -60 -100 -10 -100 {lab=VSS}
N -300 -450 -300 -410 {lab=VDD}
N -310 -380 -300 -380 {lab=VDD}
N -310 -450 -310 -380 {lab=VDD}
N -310 -450 -300 -450 {lab=VDD}
N -300 -520 -300 -450 {lab=VDD}
N -60 -520 -60 -410 {lab=VDD}
N -60 -380 -50 -380 {lab=VDD}
N -50 -520 -50 -380 {lab=VDD}
N -60 -520 -50 -520 {lab=VDD}
N -170 -220 -145 -220 {
lab=VSS}
N -60 50 -10 50 {
lab=VSS}
N -60 20 -60 50 {lab=VSS}
N -300 -30 -300 50 {lab=VSS}
N -10 -100 -10 50 {lab=VSS}
N -300 50 -60 50 {
lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} -80 -380 0 0 {name=M3
l=2.5u
w=12u
ng=2
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -80 -100 0 0 {name=M2
l=6.4u
w=12u
ng=2
m=8
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -280 -380 0 1 {name=M4
l=2.5u
w=12u
ng=2
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -280 -100 0 1 {name=M1
l=6.4u
w=12u
ng=2
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -190 -220 0 0 {name=M5
l=1u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -60 -10 0 0 {name=R2
w=1e-6
l=11.5e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {iopin.sym} -300 -520 2 0 {name=p1 lab=VDD}
C {iopin.sym} -300 50 2 0 {name=p2 lab=VSS}
C {opin.sym} 180 -340 0 0 {name=p9 lab=OUT_P}
C {opin.sym} 100 -140 0 0 {name=p7 lab=OUT_N}
C {lab_wire.sym} -145 -220 2 0 {name=p4 sig_type=std_logic lab=VSS}
