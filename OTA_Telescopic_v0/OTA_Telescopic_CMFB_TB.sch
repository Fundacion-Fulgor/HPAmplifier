v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -90 40 -90 70 {lab=#net1}
N -90 130 -90 140 {lab=GND}
N -40 40 -40 60 {lab=GND}
N -620 120 -620 140 {lab=GND}
N -620 0 -620 60 {lab=VDD}
N -530 120 -530 140 {lab=GND}
N -530 0 -530 60 {lab=VREF}
N -90 -190 -90 -80 {lab=VREF}
N -40 -190 -40 -80 {lab=VDD}
N -350 80 -350 100 {lab=#net2}
N -350 160 -350 180 {lab=GND}
N -350 0 -350 20 {lab=#net3}
N -350 -0 -180 0 {lab=#net3}
N 50 -20 110 -20 {lab=Vout}
N 110 -40 110 -20 {lab=Vout}
N -350 -40 -180 -40 {lab=#net3}
N -350 -40 -350 -0 {lab=#net3}
C {isource.sym} -90 100 0 0 {name=I0 value=95u}
C {gnd.sym} -90 140 0 0 {name=l6 lab=GND}
C {gnd.sym} -40 60 0 0 {name=l1 lab=GND}
C {vsource.sym} -620 90 0 0 {name=V1 value=1.62 savecurrent=false}
C {gnd.sym} -620 140 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -620 0 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -530 90 0 0 {name=V2 value=0.9 savecurrent=false}
C {gnd.sym} -530 140 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -530 0 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {lab_wire.sym} -90 -190 0 0 {name=p2 sig_type=std_logic lab=VREF}
C {lab_wire.sym} -40 -190 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {vsource.sym} -350 50 2 0 {name=V6 value="0 AC 1" savecurrent=false}
C {vsource.sym} -350 130 0 0 {name=V7 value=0.9 savecurrent=false}
C {gnd.sym} -350 180 0 0 {name=l5 lab=GND}
C {noconn.sym} 110 -40 0 0 {name=l2}
C {devices/code.sym} -740 -230.390625 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice ss
.temp 125


"
spice_ignore=false}
C {code.sym} -610 -230 0 0 {name=AC only_toplevel=true value="
.control
save all

* AC simulation
ac dec 10 1 1T
let Av = db(v(Vout))
meas ac Ao MAX Av
let ABW = Ao-3
meas ac BW WHEN Av=ABW
meas ac UGBW WHEN Av=0
let phase_vec = 180/pi*cph(v(Vout))

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


*DC simulation

op
let vout_dc = v(Vout1)
print vout_dc
write OTA_Telescopic_CMFB_TB.raw

.endc
"
}
C {lab_wire.sym} 100 -20 0 0 {name=p5 sig_type=std_logic lab=Vout}
C {devices/launcher.sym} -670 -320 0 0 {name=h3
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
C {code.sym} -490 -230 0 0 {name=save only_toplevel=false value="
.op

.save all
.save @m.x1.xm0.msky130_fd_pr__pfet_01v8_lvt[id]

.save @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]

.save @m.x1.xm3.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x1.xm4.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x1.xm6.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm6.msky130_fd_pr__pfet_01v8_lvt[gm]

.save @m.x1.xm7.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.x1.xm8.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm8.msky130_fd_pr__nfet_01v8_lvt[gm]

.control

*let vdssat_M1 = @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[vdsat]
*let vdssat_M3 = @m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[vdsat]
*let vdssat_M5 = @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[vdsat]
*let vdssat_M7 = @m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[vdsat]
*let vdssat_M0 = @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[vdsat]

*print vdssat_M1
*print vdssat_M3
*print vdssat_M5
*print vdssat_M7
*print vdssat_M0

.endc

"
}
C {OTA_Telescopic_CMFB2.sym} -100 -20 0 0 {name=x1}
