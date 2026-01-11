v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -300 -520 -60 -520 {
lab=VDD}
N -60 -520 -60 -380 {
lab=VDD}
N -170 -100 -100 -100 {
lab=OUT_N}
N -170 -380 -100 -380 {
lab=OUT_P}
N -260 -380 -170 -380 {
lab=OUT_P}
N -300 -140 -300 -130 {
lab=OUT_N}
N -120 60 -60 60 {
lab=VSS}
N -300 -520 -300 -380 {
lab=VDD}
N -170 -340 -170 -260 {
lab=OUT_P}
N -170 -190 -170 -100 {
lab=OUT_N}
N -250 -100 -170 -100 {
lab=OUT_N}
N -170 -220 -120 -220 {
lab=VSS}
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
N -60 20 -60 60 {
lab=VSS}
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
N -300 -100 -300 60 {
lab=VSS}
N -60 -100 -60 -40 {
lab=#net1}
N -120 -220 -120 60 {
lab=VSS}
N -300 60 -120 60 {
lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} -80 -380 0 0 {name=M3
l=2u
w=22u
ng=4
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -80 -100 0 0 {name=M2
l=9.86u
w=9.86u
ng=1
m=15
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -280 -380 0 1 {name=M4
l=2u
w=22u
ng=4
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -280 -100 0 1 {name=M1
l=9.86u
w=9.86u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -190 -220 0 0 {name=M5
l=1u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -60 -10 0 0 {name=R2
w=0.6e-6
l=14e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {iopin.sym} -300 -520 2 0 {name=p1 lab=VDD}
C {iopin.sym} -300 60 2 0 {name=p2 lab=VSS}
C {lab_wire.sym} -180 60 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {opin.sym} 180 -340 0 0 {name=p9 lab=OUT_P}
C {opin.sym} 100 -140 0 0 {name=p7 lab=OUT_N}
