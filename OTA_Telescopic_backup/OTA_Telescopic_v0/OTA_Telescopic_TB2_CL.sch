v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {dc 0.9 pwl(0 0.8 0.005u 0.8 0.005u 0.9 0.15m 0.9 0.15m 0)} -930 300 0 0 0.4 0.4 {}
N 180 -320 370 -320 {lab=Vout2}
N 180 -280 270 -280 {lab=Vout1}
N -370 -60 -370 20 {lab=#net1}
N -370 80 -370 100 {lab=GND}
N 50 -220 50 -200 {lab=GND}
N -805 25 -805 45 {lab=GND}
N -805 -95 -805 -35 {lab=VDD}
N -715 25 -715 45 {lab=GND}
N -715 -95 -715 -35 {lab=VREF}
N 270 -280 270 -240 {lab=Vout1}
N 270 -180 270 -150 {lab=GND}
N 370 -180 370 -150 {lab=GND}
N 370 -320 370 -240 {lab=Vout2}
N -50 -260 -50 -200 {lab=#net2}
N -50 -380 -50 -340 {lab=vcm_opam}
N 30 -220 30 -160 {lab=cmfb}
N 225 -30 225 30 {lab=Vout2}
N 335 -10 335 70 {lab=Vout1}
N -20 -420 -20 -400 {lab=#net3}
N -20 -400 30 -400 {lab=#net3}
N 30 -400 30 -380 {lab=#net3}
N 150 -280 180 -280 {lab=Vout1}
N -20 110 -20 120 {lab=GND}
N -160 50 -110 50 {lab=cmfb}
N -140 -560 -30 -560 {lab=vcm_opam}
N 30 -560 180 -560 {lab=Vout2}
N -140 -200 -140 -110 {lab=#net2}
N -140 -110 -40 -110 {lab=#net2}
N 20 -110 180 -110 {lab=Vout1}
N 180 -280 180 -110 {lab=Vout1}
N -250 -90 -250 -60 {lab=#net1}
N -370 -60 -250 -60 {lab=#net1}
N -250 -200 -250 -150 {lab=VN}
N 120 70 335 70 {lab=Vout1}
N 120 30 225 30 {lab=Vout2}
N -250 -200 -220 -200 {lab=VN}
N -140 -200 -50 -200 {lab=#net2}
N -140 -380 -50 -380 {lab=vcm_opam}
N -480 -240 -480 -60 {lab=#net1}
N -480 -380 -480 -300 {lab=VP}
N -480 -380 -220 -380 {lab=VP}
N -20 -490 -20 -480 {lab=VDD}
N 50 -490 50 -380 {lab=VDD}
N -140 -560 -140 -380 {lab=vcm_opam}
N 180 -560 180 -320 {lab=Vout2}
N -20 -30 -20 -10 {lab=VDD}
N 30 -30 30 -10 {lab=VREF}
N 30 110 30 120 {lab=#net4}
N 30 180 30 190 {lab=GND}
N -480 -60 -370 -60 {lab=#net1}
N -160 -200 -140 -200 {lab=#net2}
N -160 -380 -140 -380 {lab=vcm_opam}
N 150 -320 180 -320 {lab=Vout2}
C {vsource.sym} -370 50 0 0 {name=V7 value=1.25 savecurrent=false}
C {gnd.sym} -370 100 0 0 {name=l5 lab=GND}
C {vsource.sym} -480 -270 0 0 {name=V5 value="0 SIN(0 0.0558 400000000) AC 0.5" savecurrent=false}
C {gnd.sym} 50 -200 0 0 {name=l2 lab=GND}
C {vsource.sym} -805 -5 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -805 45 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -805 -95 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -715 -5 0 0 {name=V2 value="dc 0.9" savecurrent=false}
C {gnd.sym} -715 45 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -715 -95 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {capa-2.sym} 270 -210 0 0 {name=C1
m=1
value=500f
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 270 -150 0 0 {name=l10 lab=GND}
C {capa-2.sym} 370 -210 0 0 {name=C2
m=1
value=500f
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 370 -150 0 0 {name=l7 lab=GND}
C {lab_wire.sym} 310 -320 0 0 {name=p19 sig_type=std_logic lab=Vout2}
C {lab_wire.sym} 250 -280 0 0 {name=p18 sig_type=std_logic lab=Vout1}
C {devices/code.sym} -910 -450.390625 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib cornerMOSlv.lib mos_tt
.temp 65
"}
C {code.sym} -780 -450 0 0 {name=AC only_toplevel=true value="
.control
save all
 set color0 = white

* AC simulation
ac dec 1000 1 1T
let Av = db(v(Vout1)-v(Vout2))
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

print GM
plot Av
plot phase_vec

write AC_OL.raw
wrdata AvCL_ Av

*DC simulation

op
let vout_dc = v(Vout1)
print vout_dc
write OTA_Telescopic_TB2_CL.raw

.endc
"
}
C {devices/launcher.sym} -450 -450 0 0 {name=h3
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
C {code.sym} -660 -445 0 0 {name=save only_toplevel=false value="
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

let vdssat_M9 = @m.x1.xm9.msky130_fd_pr__pfet_01v8_lvt[vdsat]
let vdssat_M11 = @m.x1.xm11.msky130_fd_pr__nfet_01v8_lvt[vdsat]

print vdssat_M1
print vdssat_M3
print vdssat_M5
print vdssat_M7
print vdssat_M0
print vdssat_M9
print vdssat_M11

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
spice_ignore=true}
C {code.sym} -770 -300 0 0 {name=TRAN
only_toplevel=true
value="

.control

set wr_singlescale
set wr_vecnames

save all
tran 0.6103515625p 248n
*write NMOS_diode_large_signal.raw

let Vout1 = v(Vout1)
let Vout2 = v(Vout2)
let Vin = v(VP)-v(VN)

let Vout = v(Vout1)-v(Vout2)
wrdata Vout_tt_400 Vout
wrdata Vin_tt_400 Vin

plot Vin Vout
plot Vout1 Vout2
plot v(VP)-v(VN)
*plot v(VP) v(VN)

let Vo1 = v(x1.Vo1)
let Vo2 = v(x1.Vo2)

let Vo = Vo1-Vo2

wrdata Vo Vo

reset    
noise v(Vout1) V5 dec 100 1 0.5e9 1
setplot noise1
*plot onoise_spectrum
setplot noise2
print onoise_total

.endc
"
spice_ignore=true}
C {lab_wire.sym} -285 -380 0 0 {name=p7 sig_type=std_logic lab=VP}
C {lab_wire.sym} -240 -200 0 0 {name=p8 sig_type=std_logic lab=VN}
C {lab_wire.sym} 335 -10 0 0 {name=p6 sig_type=std_logic lab=Vout1}
C {lab_wire.sym} 225 -30 0 0 {name=p9 sig_type=std_logic lab=Vout2}
C {res.sym} -190 -380 1 0 {name=R5
value=3k
footprint=1206
device=resistor
m=1
}
C {res.sym} -190 -200 1 0 {name=R6
value=3k
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} 30 -160 0 0 {name=p14 sig_type=std_logic lab=cmfb}
C {lab_wire.sym} -20 -490 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 50 -490 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {isource.sym} -20 -450 0 0 {name=I1 value=100u}
C {OTA_Telescopic_core_v2.sym} 30 -300 0 0 {name=x1}
C {OTA_Telescopic_CMFB2.sym} 40 50 0 1 {name=x2}
C {gnd.sym} -20 120 0 0 {name=l1 lab=GND}
C {isource.sym} 30 150 0 0 {name=I2 value=100u}
C {gnd.sym} 30 190 0 0 {name=l6 lab=GND}
C {lab_wire.sym} -160 50 0 0 {name=p3 sig_type=std_logic lab=cmfb}
C {lab_wire.sym} -20 -30 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 30 -30 0 0 {name=p11 sig_type=std_logic lab=VREF}
C {res.sym} -10 -110 1 0 {name=R1
value=6.72k
footprint=1206
device=resistor
m=1}
C {res.sym} 0 -560 1 0 {name=R2
value=6.72k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -250 -120 2 0 {name=V3 value="0 SIN(0 0.0558 400000000) AC 0.5" savecurrent=false}
C {lab_wire.sym} -55 -380 0 0 {name=p12 sig_type=std_logic lab=vcm_opam}
C {code.sym} -660 -300 0 0 {name=STEP
only_toplevel=true
value="

.temp 27
.control

save all
tran 0.001n 0.05u

plot v(Vout2)
plot v(VREF)

.endc
"
spice_ignore=true}
