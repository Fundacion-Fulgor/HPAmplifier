v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -30 -890 770 -490 {flags=graph
y1=9.6895e-05
y2=0.000104455
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.62
x2=1.98
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=I(Vd2)
color=""
dataset=-1
unitx=1
logx=0
logy=0
}
N 10 -380 250 -380 {
lab=VDD}
N 250 -380 250 -240 {
lab=VDD}
N 140 40 210 40 {
lab=#net1}
N 140 -240 210 -240 {
lab=#net2}
N 50 -240 140 -240 {
lab=#net2}
N 10 -0 10 10 {
lab=#net1}
N 10 70 10 200 {
lab=GND}
N 10 200 250 200 {
lab=GND}
N -40 40 10 40 {
lab=GND}
N 250 40 300 40 {
lab=GND}
N 10 -380 10 -240 {
lab=VDD}
N 140 -200 140 -180 {
lab=#net2}
N 140 -50 140 40 {
lab=#net1}
N 60 40 140 40 {
lab=#net1}
N 140 -80 190 -80 {
lab=GND}
N 140 -240 140 -200 {
lab=#net2}
N 140 -200 250 -200 {
lab=#net2}
N 250 -210 250 -200 {
lab=#net2}
N 10 -0 60 0 {
lab=#net1}
N 10 -210 10 -0 {
lab=#net1}
N 60 0 60 40 {
lab=#net1}
N 50 40 60 40 {
lab=#net1}
N 250 160 250 200 {
lab=GND}
N 250 70 250 100 {
lab=#net3}
N 140 -120 140 -110 {
lab=#net4}
N 100 -120 100 -80 {
lab=#net4}
N 100 -120 140 -120 {
lab=#net4}
N -560 -110 -440 -110 {
lab=#net5}
N -400 -190 -400 -110 {
lab=VDD}
N 250 -20 250 10 {
lab=#net6}
N 250 -200 250 -80 {
lab=#net2}
N -400 -80 -400 40 {
lab=#net7}
C {gnd.sym} -440 -340 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -440 -400 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_lv_pmos.sym} 230 -240 0 0 {name=M3
l=\{l_p\}
w=\{w_p\}
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 230 40 0 0 {name=M2
l=\{l_n\}
w=\{w_n\}
ng=1
m=\{k\}
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 30 -240 0 1 {name=M4
l=\{l_p\}
w=\{w_p\}
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 30 40 0 1 {name=M1
l=\{l_n\}
w=\{w_n\}
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 150 -380 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_lv_nmos.sym} 120 -80 0 0 {name=M5
l=1u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {code_shown.sym} -340 -380 0 0 {name=s1 only_toplevel=false value="

.include ../bandgap.spice
"}
C {gnd.sym} -40 40 0 0 {name=l2 lab=GND}
C {gnd.sym} 140 200 0 0 {name=l3 lab=GND}
C {gnd.sym} 300 40 0 0 {name=l4 lab=GND}
C {gnd.sym} 190 -80 0 0 {name=l5 lab=GND}
C {launcher.sym} 30 -420 0 0 {name=h1
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/bgr.raw dc
xschem setprop rect 2 0 fullxzoom

"
}
C {sg13g2_pr/rppd.sym} 250 130 0 0 {name=R2
w=0.6e-6
l=13e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {ammeter.sym} 140 -150 0 0 {name=Vd1}
C {/home/eg/hdd/Documents/fulgor/CASS_bandgap/testBkp.sym} -710 -100 0 0 {name=x1}
C {lab_wire.sym} -560 -130 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {gnd.sym} -560 -70 0 0 {name=l6 lab=GND}
C {sg13g2_pr/sg13_lv_pmos.sym} -420 -110 0 0 {name=M6
l=2u
w=15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_wire.sym} -400 -190 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {gnd.sym} -400 100 0 0 {name=l7 lab=GND}
C {vsource.sym} -400 70 0 0 {name=V2 value=0.1 savecurrent=false}
C {noconn.sym} -560 -90 2 0 {name=l8}
C {ammeter.sym} 250 -50 0 0 {name=Vd2}
C {vsource.sym} -440 -370 0 0 {name=V1 value="PULSE(0 1.8 1n 10p 10p 10n 10n)" savecurrent=false}
