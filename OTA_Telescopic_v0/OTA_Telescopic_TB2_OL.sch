v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 450 -100 640 -100 {lab=Vout2}
N 450 -60 540 -60 {lab=Vout1}
N -60 170 -60 190 {lab=GND}
N 320 0 320 20 {lab=GND}
N -480 150 -480 170 {lab=GND}
N -480 30 -480 90 {lab=VDD}
N -390 150 -390 170 {lab=GND}
N -390 30 -390 90 {lab=VREF}
N 540 -60 540 -20 {lab=Vout1}
N 540 40 540 70 {lab=GND}
N 640 40 640 70 {lab=GND}
N 640 -100 640 -20 {lab=Vout2}
N 160 -80 160 20 {lab=Vcm}
N 220 -40 220 20 {lab=Vcm}
N -60 20 -60 110 {lab=Vcm}
N -60 -160 -60 20 {lab=Vcm}
N 220 -160 220 -120 {lab=#net1}
N 300 0 300 60 {lab=cmfb}
N 345 230 455 230 {lab=Vout2}
N 455 170 455 230 {lab=Vout2}
N 345 270 565 270 {lab=Vout1}
N 565 190 565 270 {lab=Vout1}
N 160 -160 220 -160 {lab=#net1}
N 160 20 220 20 {lab=Vcm}
N 250 -200 250 -180 {lab=#net2}
N 250 -180 300 -180 {lab=#net2}
N 300 -180 300 -160 {lab=#net2}
N 420 -60 450 -60 {lab=Vout1}
N 210 310 210 320 {lab=GND}
N 70 250 120 250 {lab=cmfb}
N 300 -360 450 -360 {lab=Vout2}
N 290 90 450 90 {lab=Vout1}
N 50 -360 240 -360 {lab=#net3}
N 50 90 230 90 {lab=#net4}
N 120 -160 160 -160 {lab=#net1}
N 130 20 160 20 {lab=Vcm}
N 160 -160 160 -140 {lab=#net1}
N 50 -160 60 -160 {lab=#net3}
N -60 -160 -40 -160 {lab=Vcm}
N -60 20 -40 20 {lab=Vcm}
N 50 20 70 20 {lab=#net4}
N 250 -290 250 -260 {lab=VDD}
N 320 -290 320 -160 {lab=VDD}
N 50 -360 50 -160 {lab=#net3}
N 450 -360 450 -100 {lab=Vout2}
N 50 20 50 90 {lab=#net4}
N 450 -60 450 90 {lab=Vout1}
N 210 160 210 190 {lab=VDD}
N 260 160 260 190 {lab=VREF}
N 260 380 260 390 {lab=GND}
N 260 310 260 320 {lab=#net5}
N 20 20 50 20 {lab=#net4}
N 20 -160 50 -160 {lab=#net3}
N 420 -100 450 -100 {lab=Vout2}
C {vsource.sym} 160 -110 0 0 {name=V6 value="0 AC 1" savecurrent=false}
C {vsource.sym} -60 140 0 0 {name=V7 value=1.25 savecurrent=false}
C {gnd.sym} -60 190 0 0 {name=l5 lab=GND}
C {gnd.sym} 320 20 0 0 {name=l2 lab=GND}
C {vsource.sym} -480 120 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -480 170 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -480 30 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -390 120 0 0 {name=V2 value="dc 0.9 pwl(0 0.8 1u 0.8 1.01u 0.9 0.15m 0.9 0.15m 0)" savecurrent=false}
C {gnd.sym} -390 170 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -390 30 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {capa-2.sym} 540 10 0 0 {name=C1
m=1
value=500f
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 540 70 0 0 {name=l10 lab=GND}
C {capa-2.sym} 640 10 0 0 {name=C2
m=1
value=500f
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 640 70 0 0 {name=l7 lab=GND}
C {lab_wire.sym} 640 -100 0 0 {name=p19 sig_type=std_logic lab=Vout2}
C {lab_wire.sym} 540 -60 0 0 {name=p18 sig_type=std_logic lab=Vout1}
C {devices/code.sym} -390 -360.390625 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib cornerMOSlv.lib mos_tt
.temp 65
"
spice_ignore=false}
C {code.sym} -390 -210 0 0 {name=AC only_toplevel=true value="
.control
save all
 set color0 = white

* AC simulation
ac dec 1k 1 1T
let Av = db((v(Vout1)-v(Vout2)))
meas ac Ao FIND Av WHEN frequency=10
let ABW = Ao-3
meas ac BW WHEN Av=ABW
meas ac UGBW WHEN Av=0
let phase_vec = 180/pi*cph(v(Vout1)-v(Vout2))

* Phase margin (PM)
meas ac phase FIND phase_vec WHEN frequency=UGBW 
let PM = phase+180
print PM

* Gain margin (GM)
meas ac freq180 FIND frequency WHEN phase_vec=-180
meas ac gain FIND Av WHEN frequency=freq180
let GM = 0-gain

*BW in 7 dB
meas ac UGBW7dB WHEN Av=7
meas ac UGBW4dB WHEN Av=4

print GM
plot Av
plot phase_vec

plot db(v(x1.Vo1)-v(x1.Vo2))

write AC_OL.raw

wrdata AvOL_ Av
wrdata PhaseOL_ phase_vec


*DC simulation

op
let vout_dc = v(Vout1)
print vout_dc
write OTA_Telescopic_TB2_OL.raw


reset    
noise v(Vout1) V6 dec 100 1 0.5e9 1
setplot noise1
*plot onoise_spectrum
setplot noise2
print onoise_total

.endc
"
}
C {devices/launcher.sym} -360 -30 0 0 {name=h3
descr="save, netlist & simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
value="
.param wx=5u lx=0.13u vbx=0
.save all
.save @n.xm1.nsg13_lv_nmos[gm]
.save @n.xm1.nsg13_lv_nmos[ids]
.save @n.xm1.nsg13_lv_nmos[sid]
.save @n.xm1.nsg13_lv_nmos[sfl]

.control
set wr_vecnames
op
noise v(n) vg dec 10 1 1e11 1
noise v(n) vg lin  1 1 1 1
echo $plots
write noisetest_sg13g2_lv_nmos.raw noise1.all

setplot noise3
print onoise_spectrum
print onoise_n.xm1.nsg13_lv_nmos_flicker
print onoise_n.xm1.nsg13_lv_nmos_idid
print sqrt(@n.xm1.nsg13_lv_nmos[sfl])
print sqrt(@n.xm1.nsg13_lv_nmos[sid])
.endc
"}
C {code.sym} -270 -210 0 0 {name=save only_toplevel=false value="
.op

.save all
*OTA
.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.x1.xm2.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm2.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[cgg]

.save @m.x1.xm9.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm9.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[gm]

.save @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[gm]

.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[vdssat]


.save @m.x1.xm13.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm13.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.x1.xm14.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm15.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm16.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm17.msky130_fd_pr__nfet_01v8_lvt[id]

.save @m.x1.xm18.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm19.msky130_fd_pr__nfet_01v8_lvt[id]

.save @m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[gm]

*CMFB
.save @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm3.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm4.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm5.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm5.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm6.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm6.msky130_fd_pr__pfet_01v8_lvt[gm]

.save @m.x2.xm7.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x2.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.x2.xm8.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x2.xm8.msky130_fd_pr__nfet_01v8_lvt[gm]



.control

let vdssat_M1 = @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[vdsat]
let vdssat_M3 = @m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[vdsat]
let vdssat_M5 = @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[vdsat]
let vdssat_M7 = @m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[vdsat]
let vdssat_M0 = @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[vdsat]

print vdssat_M1
print vdssat_M3
print vdssat_M5
print vdssat_M7
print vdssat_M0

let ro_M1 = 1/@m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]
let ro_M3 = 1/@m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[gds]
let ro_M5 = 1/@m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[gds]
let ro_M7 = 1/@m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[gds]
let ro_M0 = 1/@m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[gds]
let ro_M9 = 1/@m.x1.xm9.msky130_fd_pr__pfet_01v8_lvt[gds]
let ro_M11 = 1/@m.x1.xm11.msky130_fd_pr__nfet_01v8_lvt[gds]

print ro_M1
print ro_M3
print ro_M5
print ro_M7
print ro_M0
print ro_M9
print ro_M11

let gm_M1 = @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm_M3 = @m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm_M5 = @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm_M7 = @m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm_M0 = @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[gm]

print gm_M1
print gm_M3
print gm_M5
print gm_M7
print gm_M0

let gmb_M3 = @m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[gmbs]
let gmb_M5 = @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[gmbs]

print gmb_M3
print gmb_M5


let cgg_M10 = @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[cgg]
print cgg_M10

let cgd_M10 = @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[cgd]
print cgd_M10

let cgd_M0 = @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[cgd]
print cgd_M0


*CMFB

let x2_vdssat_M0 = @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[vdsat]
let x2_vth_M0 = @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[vth]

print x2_vdssat_M0
print x2_vth_M0

.endc

"
}
C {lab_wire.sym} 565 190 0 0 {name=p6 sig_type=std_logic lab=Vout1}
C {lab_wire.sym} 455 170 0 0 {name=p9 sig_type=std_logic lab=Vout2}
C {res.sym} -10 -160 1 0 {name=R5
value=3k
footprint=1206
device=resistor
m=1}
C {res.sym} -10 20 1 0 {name=R6
value=3k
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} 300 60 0 0 {name=p14 sig_type=std_logic lab=cmfb}
C {lab_wire.sym} 250 -290 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 320 -290 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {isource.sym} 250 -230 0 0 {name=I1 value=100u}
C {OTA_Telescopic_core_v2.sym} 300 -80 0 0 {name=x1}
C {OTA_Telescopic_CMFB2.sym} 270 250 0 1 {name=x2}
C {gnd.sym} 210 320 0 0 {name=l1 lab=GND}
C {isource.sym} 260 350 0 0 {name=I2 value=100u}
C {gnd.sym} 260 390 0 0 {name=l6 lab=GND}
C {lab_wire.sym} 210 160 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 260 160 0 0 {name=p11 sig_type=std_logic lab=VREF}
C {res.sym} 260 90 1 0 {name=R1
value=6.72k
footprint=1206
device=resistor
m=1}
C {res.sym} 270 -360 1 0 {name=R2
value=6.72k
footprint=1206
device=resistor
m=1}
C {res.sym} 100 20 1 0 {name=R3
value=10G
footprint=1206
device=resistor
m=1}
C {res.sym} 90 -160 1 0 {name=R4
value=10G
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} 90 250 0 0 {name=p12 sig_type=std_logic lab=cmfb}
C {lab_wire.sym} -60 60 0 0 {name=p3 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} 160 -40 0 0 {name=p13 sig_type=std_logic lab=Vcm}
C {code.sym} -500 -210 0 0 {name=NGSPICE
only_toplevel=true
value="

.temp 27
.control

save all
tran 1n 2u

plot v(Vout1)
plot v(VREF)

.endc
"
spice_ignore=true}
