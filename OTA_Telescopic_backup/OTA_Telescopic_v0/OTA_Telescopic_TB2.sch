v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 240 -60 420 -60 {lab=Vout2}
N 260 -20 360 -20 {lab=Vout1}
N -400 130 -400 150 {lab=#net1}
N -400 70 -400 130 {lab=#net1}
N -400 210 -400 230 {lab=GND}
N 140 40 140 60 {lab=GND}
N -730 190 -730 210 {lab=GND}
N -730 70 -730 130 {lab=VDD}
N -640 190 -640 210 {lab=GND}
N -640 70 -640 130 {lab=VREF}
N 360 -20 360 20 {lab=Vout1}
N 360 80 360 110 {lab=GND}
N 460 -20 460 20 {lab=Vout2}
N 460 80 460 110 {lab=GND}
N 460 -60 460 -20 {lab=Vout2}
N 420 -60 460 -60 {lab=Vout2}
N -400 -30 -400 -10 {lab=#net2}
N -400 -100 -400 -90 {lab=#net3}
N 40 0 40 60 {lab=VN}
N -400 50 -400 70 {lab=#net1}
N -400 -120 -400 -100 {lab=#net3}
N 40 -120 40 -80 {lab=VP}
N 120 40 120 100 {lab=cmfb}
N 235 240 345 240 {lab=Vout2}
N 345 180 345 240 {lab=Vout2}
N 235 280 455 280 {lab=Vout1}
N 455 200 455 280 {lab=Vout1}
N 20 -120 40 -120 {lab=VP}
N 20 60 40 60 {lab=VN}
N -220 -120 -40 -120 {lab=VP}
N -400 -120 -280 -120 {lab=#net3}
N -400 60 -280 60 {lab=#net1}
N -220 60 -40 60 {lab=VN}
N -40 -120 20 -120 {lab=VP}
N -40 60 20 60 {lab=VN}
N 140 -290 140 -120 {lab=VDD}
N 70 -160 70 -140 {lab=#net4}
N 70 -140 120 -140 {lab=#net4}
N 120 -140 120 -120 {lab=#net4}
N 70 -280 70 -220 {lab=VDD}
N 240 -20 260 -20 {lab=Vout1}
N 150 160 150 200 {lab=VREF}
N 100 320 100 330 {lab=GND}
N 150 410 150 440 {lab=GND}
N 150 320 150 350 {lab=#net5}
N -40 260 10 260 {lab=cmfb}
N 100 150 100 200 {lab=VDD}
C {vsource.sym} -400 -60 0 0 {name=V6 value="0 AC 1" savecurrent=false}
C {vsource.sym} -400 180 0 0 {name=V7 value=1.35 savecurrent=false}
C {gnd.sym} -400 230 0 0 {name=l5 lab=GND}
C {vsource.sym} -400 20 0 0 {name=V5 value="0 SIN(0 0.5m 100k)" savecurrent=false}
C {gnd.sym} 140 60 0 0 {name=l2 lab=GND}
C {vsource.sym} -730 160 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -730 210 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -730 70 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -640 160 0 0 {name=V2 value=0.9 savecurrent=false}
C {gnd.sym} -640 210 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -640 70 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {capa-2.sym} 360 50 0 0 {name=C1
m=1
value=500f
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 360 110 0 0 {name=l10 lab=GND}
C {capa-2.sym} 460 50 0 0 {name=C2
m=1
value=500f
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 460 110 0 0 {name=l7 lab=GND}
C {lab_wire.sym} 460 -60 0 0 {name=p19 sig_type=std_logic lab=Vout2}
C {lab_wire.sym} 360 -20 0 0 {name=p18 sig_type=std_logic lab=Vout1}
C {devices/code.sym} -820 -200.390625 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code.sym} -690 -200 0 0 {name=AC only_toplevel=true value="
.control
save all
 set color0 = white

* AC simulation
ac dec 100 1 1T
let Av = db(v(Vout1)-v(Vout2))
meas ac Ao MAX Av
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

write AC_OL.raw


*DC simulation

op
let vout_dc = v(Vout1)
print vout_dc
write OTA_Telescopic_TB2.raw

.endc
"
}
C {devices/launcher.sym} -760 -30 0 0 {name=h3
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
C {code.sym} -570 -200 0 0 {name=save only_toplevel=false value="
.op

.save all
*OTA
.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.x1.xm2.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm2.msky130_fd_pr__nfet_01v8_lvt[gm]

.save @m.x1.xm9.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm9.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[gm]

.save @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[id]

.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[vdssat]


.save @m.x1.xm13.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm14.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm15.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm16.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm17.msky130_fd_pr__nfet_01v8_lvt[id]

.save @m.x1.xm18.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm19.msky130_fd_pr__nfet_01v8_lvt[id]

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

print ro_M1
print ro_M3
print ro_M5
print ro_M7
print ro_M0

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


*CMFB

let x2_vdssat_M0 = @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[vdsat]
let x2_vth_M0 = @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[vth]

print x2_vdssat_M0
print x2_vth_M0

.endc

"
}
C {code.sym} -940 -200 0 0 {name=TRAN
only_toplevel=true
value="

.temp 27
.control

save all
tran 1n 50u
*write NMOS_diode_large_signal.raw

let Vout = v(Vout1)-v(Vout2)
let Vout1 = v(Vout1)
let Vout2 = v(Vout2)
let Vin = v(VP)-v(VN)

plot Vin Vout
plot Vout1 Vout2

.endc
"
spice_ignore=true}
C {lab_wire.sym} -120 -120 0 0 {name=p7 sig_type=std_logic lab=VP}
C {lab_wire.sym} -120 60 0 0 {name=p8 sig_type=std_logic lab=VN}
C {lab_wire.sym} 455 200 0 0 {name=p6 sig_type=std_logic lab=Vout1}
C {lab_wire.sym} 345 180 0 0 {name=p9 sig_type=std_logic lab=Vout2}
C {res.sym} -250 -120 1 0 {name=R5
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -250 60 1 0 {name=R6
value=1k
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} 120 100 0 0 {name=p14 sig_type=std_logic lab=cmfb}
C {lab_wire.sym} 70 -280 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 140 -290 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {isource.sym} 70 -190 0 0 {name=I1 value=100u}
C {OTA_Telescopic_core_v2.sym} 120 -40 0 0 {name=x1}
C {OTA_Telescopic_CMFB2.sym} 160 260 0 1 {name=x2}
C {gnd.sym} 100 330 0 0 {name=l1 lab=GND}
C {isource.sym} 150 380 0 0 {name=I2 value=100u}
C {gnd.sym} 150 440 0 0 {name=l6 lab=GND}
C {lab_wire.sym} -40 260 0 0 {name=p3 sig_type=std_logic lab=cmfb}
C {lab_wire.sym} 100 150 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 150 160 0 0 {name=p11 sig_type=std_logic lab=VREF}
