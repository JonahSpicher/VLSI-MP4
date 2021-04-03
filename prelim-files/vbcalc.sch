v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 240 -200 240 -190 { lab=VDD}
N 240 -130 240 -120 { lab=GND}
N 200 -150 220 -150 { lab=#net1}
N 200 -150 200 -130 { lab=#net1}
N 320 -150 340 -150 { lab=Vbn}
N 320 -170 340 -170 { lab=Vbp}
N 510 -250 510 -200 { lab=#net2}
N 690 -250 690 -200 { lab=GND}
N 510 -330 510 -310 { lab=VDD}
N 690 -330 690 -310 { lab=#net3}
N 510 -380 510 -340 { lab=VDD}
N 690 -380 690 -340 { lab=VDD}
N 510 -340 510 -330 { lab=VDD}
N 690 -200 690 -190 { lab=GND}
N 510 -190 510 -180 { lab=GND}
N 690 -190 690 -180 { lab=GND}
N 650 -280 660 -280 { lab=Vbn}
N 470 -280 480 -280 { lab=Vbp}
N 90 -480 90 -470 { lab=GND}
N 90 -550 90 -540 { lab=VDD}
C {/home/jonah/VLSI/MP4/biasgen.sym} 30 60 0 0 {name=X1}
C {madvlsi/gnd.sym} 240 -120 0 0 {name=l1 lab=GND}
C {madvlsi/vdd.sym} 240 -200 0 0 {name=l2 lab=VDD}
C {madvlsi/resistor.sym} 200 -100 0 0 {name=R1
value=330K
m=1}
C {madvlsi/gnd.sym} 200 -70 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 340 -150 2 0 {name=l4 sig_type=std_logic lab=Vbn}
C {devices/lab_pin.sym} 340 -170 2 0 {name=l5 sig_type=std_logic lab=Vbp}
C {madvlsi/pmos3.sym} 510 -280 0 0 {name=M1
L=\{ladderlen\}
W=\{ladderwid\}
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {madvlsi/nmos3.sym} 690 -280 0 0 {name=M2
L=\{ladderlen\}
W=\{ladderwid\}
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {madvlsi/ammeter1.sym} 510 -200 0 0 {name=Vip}
C {madvlsi/ammeter1.sym} 690 -340 0 0 {name=Vin}
C {madvlsi/gnd.sym} 510 -180 0 0 {name=l6 lab=GND}
C {madvlsi/gnd.sym} 690 -180 0 0 {name=l7 lab=GND}
C {madvlsi/vdd.sym} 510 -380 0 0 {name=l8 lab=VDD}
C {madvlsi/vdd.sym} 690 -380 0 0 {name=l9 lab=VDD}
C {devices/lab_pin.sym} 470 -280 0 0 {name=l10 sig_type=std_logic lab=Vbp}
C {devices/lab_pin.sym} 650 -280 0 0 {name=l11 sig_type=std_logic lab=Vbn}
C {madvlsi/tt_models.sym} 50 -380 0 0 {
name=TT_MODELS
only_toplevel=false
value=".option wnflag=1
.param MC_SWITCH=0.0
.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/sky130.lib.spice tt"
}
C {devices/code_shown.sym} 230 -410 0 0 {name=SPICE only_toplevel=false value=".param ladderlen=15
.param ladderwid=3.2
.param M=8
.dc Vdd 0 1.8 0.01
.save all"}
C {madvlsi/vsource.sym} 90 -510 0 0 {name=Vdd
value=1.8}
C {madvlsi/vdd.sym} 90 -550 0 0 {name=l12 lab=VDD}
C {madvlsi/gnd.sym} 90 -470 0 0 {name=l13 lab=GND}
