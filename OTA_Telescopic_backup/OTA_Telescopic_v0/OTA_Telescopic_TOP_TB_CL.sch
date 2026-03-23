v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {dc 0.9 pwl(0 0.8 0.005u 0.8 0.005u 0.9 0.15m 0.9 0.15m 0)} -1010 500 0 0 0.4 0.4 {}
N -450 140 -450 220 {lab=#net1}
N -450 280 -450 300 {lab=GND}
N -885 225 -885 245 {lab=GND}
N -885 105 -885 165 {lab=VDD}
N -795 225 -795 245 {lab=GND}
N -795 105 -795 165 {lab=VREF}
N 160 60 160 90 {lab=GND}
N 260 60 260 90 {lab=GND}
N 260 -80 260 0 {lab=Vout2}
N -330 110 -330 140 {lab=#net1}
N -450 140 -330 140 {lab=#net1}
N -330 0 -330 50 {lab=VN}
N -330 0 -300 0 {lab=VN}
N -560 -40 -560 140 {lab=#net1}
N -560 -180 -560 -100 {lab=VP}
N -560 -180 -300 -180 {lab=VP}
N -560 140 -450 140 {lab=#net1}
N 70 -100 160 -100 {lab=Vout1}
N 160 -100 160 0 {lab=Vout1}
N 70 -80 260 -80 {lab=Vout2}
N -300 -180 -300 -150 {lab=VP}
N -300 -150 -230 -150 {lab=VP}
N -300 -35 -300 -0 {lab=VN}
N -300 -35 -230 -35 {lab=VN}
N -230 -130 -230 -110 {lab=#net2}
N -230 -75 -230 -55 {lab=#net3}
N -80 0 -80 10 {lab=GND}
N -115 -200 -115 -180 {lab=VREF}
N -80 -200 -80 -180 {lab=VDD}
N -35 0 10 -0 {lab=#net4}
C {vsource.sym} -450 250 0 0 {name=V7 value=1.25 savecurrent=false}
C {gnd.sym} -450 300 0 0 {name=l5 lab=GND}
C {vsource.sym} -560 -70 0 0 {name=V5 value="0 SIN(0 0.0558 100000000) AC 0.5" savecurrent=false}
C {vsource.sym} -885 195 0 0 {name=V1 value=1.62 savecurrent=false}
C {gnd.sym} -885 245 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -885 105 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -795 195 0 0 {name=V2 value="dc 0.9" savecurrent=false}
C {gnd.sym} -795 245 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -795 105 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {capa-2.sym} 160 30 0 0 {name=C1
m=1
value=500f
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 160 90 0 0 {name=l10 lab=GND}
C {capa-2.sym} 260 30 0 0 {name=C2
m=1
value=500f
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 260 90 0 0 {name=l7 lab=GND}
C {lab_wire.sym} 260 -80 0 0 {name=p19 sig_type=std_logic lab=Vout2}
C {lab_wire.sym} 160 -40 0 0 {name=p18 sig_type=std_logic lab=Vout1}
C {devices/code.sym} -990 -250.390625 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib cornerMOSlv.lib mos_ss
.lib cornerRES.lib res_typ
.temp 125
"}
C {code.sym} -860 -250 0 0 {name=AC only_toplevel=true value="
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
C {devices/launcher.sym} -530 -250 0 0 {name=h3
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
C {code.sym} -740 -245 0 0 {name=save only_toplevel=false value="
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
spice_ignore=true
}
C {code.sym} -850 -100 0 0 {name=TRAN
only_toplevel=true
value="

.control

set wr_singlescale
set wr_vecnames

save all
tran 2.44140625p 1000n
*write NMOS_diode_large_signal.raw

let Vout1 = v(Vout1)
let Vout2 = v(Vout2)
let Vin = v(VP)-v(VN)

let Vout = v(Vout1)-v(Vout2)
wrdata Vout_ss_100_sym.txt Vout
wrdata Vin_ss_100_sym.txt Vin

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
C {lab_wire.sym} -365 -180 0 0 {name=p7 sig_type=std_logic lab=VP}
C {lab_wire.sym} -320 0 0 0 {name=p8 sig_type=std_logic lab=VN}
C {vsource.sym} -330 80 2 0 {name=V3 value="0 SIN(0 0.0558 100000000) AC 0.5" savecurrent=false}
C {code.sym} -740 -100 0 0 {name=STEP
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
C {OTA_Telescopic_TOP.sym} -80 -90 0 0 {name=x1}
C {gnd.sym} -80 10 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -115 -200 0 0 {name=p2 sig_type=std_logic lab=VREF}
C {lab_wire.sym} -80 -200 0 0 {name=p3 sig_type=std_logic lab=VDD}
