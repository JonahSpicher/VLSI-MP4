v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 810 -590 810 -550 { lab=#net1}
N 1140 -590 1140 -550 { lab=VDD}
N 890 -500 940 -500 { lab=#net2}
N 890 -500 890 -460 { lab=#net2}
N 940 -570 940 -500 { lab=#net2}
N 1120 -550 1140 -550 { lab=VDD}
N 1120 -650 1120 -550 { lab=VDD}
N 1070 -650 1120 -650 { lab=VDD}
N 1030 -570 1090 -570 { lab=#net2}
N 1040 -650 1070 -650 { lab=VDD}
N 810 -590 840 -590 { lab=#net1}
N 1090 -620 1090 -570 { lab=#net2}
N 1040 -620 1090 -620 { lab=#net2}
N 840 -600 890 -600 { lab=#net1}
N 840 -600 840 -590 { lab=#net1}
N 940 -570 1030 -570 { lab=#net2}
N 920 -700 920 -680 { lab=VDD}
N 920 -580 920 -560 {}
C {madvlsi/vsource.sym} 890 -430 0 0 {name=V1
value=1}
C {madvlsi/vsource.sym} 810 -520 0 0 {name=V2
value=0}
C {madvlsi/vsource.sym} 1210 -600 0 0 {name=Vdd
value=1.8}
C {madvlsi/vdd.sym} 1140 -590 0 0 {name=l1 lab=VDD}
C {madvlsi/vdd.sym} 1210 -630 0 0 {name=l2 lab=VDD}
C {madvlsi/gnd.sym} 890 -400 0 0 {name=l3 lab=GND}
C {madvlsi/gnd.sym} 810 -490 0 0 {name=l4 lab=GND}
C {madvlsi/gnd.sym} 1210 -570 0 0 {name=l5 lab=GND}
C {madvlsi/tt_models.sym} 1360 -640 0 0 {
name=TT_MODELS
only_toplevel=false
value=".option wnflag=1
.param MC_SWITCH=0.0
.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/sky130.lib.spice tt"
}
C {devices/code_shown.sym} 1200 -470 0 0 {name=SPICE only_toplevel=false value=".dc V1 0 1.8 0.01
.save v(vdd)"}
C {/home/jonah/VLSI/VLSI-MP4/design-files/biasgen.sym} 250 -460 0 0 {name=X1}
C {madvlsi/vdd.sym} 920 -700 0 0 {name=l6 lab=VDD}
C {madvlsi/gnd.sym} 920 -560 0 0 {name=l7 lab=GND}
