v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 330 -435 330 -375 {lab=VDD}
N 330 -195 330 -135 {lab=VSS}
N 295 -435 295 -375 {lab=VREF}
N 480 -295 565 -295 {lab=VOUTp}
N 480 -275 565 -275 {lab=VOUTn}
N 375 -195 420 -195 {lab=#net1}
N 180 -325 180 -305 {lab=#net2}
N 180 -265 180 -245 {lab=#net3}
N 140 -345 180 -345 {lab=VINp}
N 140 -225 180 -225 {lab=VINn}
N 480 -335 540 -335 {lab=Vop}
N 480 -315 540 -315 {lab=Von}
C {iopin.sym} 330 -435 3 0 {name=p19 lab=VDD}
C {iopin.sym} 330 -135 1 0 {name=p23 lab=VSS}
C {iopin.sym} 295 -435 3 0 {name=p6 lab=VREF}
C {ipin.sym} 140 -345 0 0 {name=p12 lab=VINp}
C {ipin.sym} 140 -225 0 0 {name=p3 lab=VINn}
C {opin.sym} 565 -275 0 0 {name=p7 lab=VOUTn}
C {opin.sym} 565 -295 0 0 {name=p14 lab=VOUTp}
C {OTA_Telescopic_TOP_wp.sym} 330 -285 0 0 {name=x1}
C {noconn.sym} 540 -335 2 0 {name=l6}
C {noconn.sym} 540 -315 2 0 {name=l8}
C {lab_wire.sym} 540 -335 0 0 {name=p5 sig_type=std_logic lab=Vop}
C {lab_wire.sym} 540 -315 0 0 {name=p9 sig_type=std_logic lab=Von}
