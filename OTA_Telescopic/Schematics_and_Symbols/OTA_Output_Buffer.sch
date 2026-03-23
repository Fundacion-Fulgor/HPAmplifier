v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 260 1170 260 1190 {lab=Vout}
N 260 1170 340 1170 {lab=Vout}
N 260 1150 260 1170 {lab=Vout}
N 180 1120 220 1120 {lab=Vin}
N 260 1260 260 1280 {lab=VSS}
N 260 1120 270 1120 {lab=VSS}
N 270 1120 270 1260 {lab=VSS}
N 260 1260 270 1260 {lab=VSS}
N 260 1250 260 1260 {lab=VSS}
N 260 1030 260 1090 {lab=VDD}
C {sg13g2_pr/sg13_lv_nmos.sym} 240 1120 0 0 {name=M1
l=0.15u
w=10u
ng=1
m=50
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} 260 1220 0 0 {name=R1
w=2e-6
l=40e-6
model=rppd
body=VSS
spiceprefix=X
b=0
m=1
}
C {iopin.sym} 260 1280 1 0 {name=p1 lab=VSS}
C {iopin.sym} 260 1030 3 0 {name=p2 lab=VDD}
C {ipin.sym} 180 1120 0 0 {name=p4 lab=Vin}
C {opin.sym} 340 1170 0 0 {name=p5 lab=Vout}
