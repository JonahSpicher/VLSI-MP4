v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 460 -550 460 -480 { lab=Vout}
N 460 -630 460 -610 { lab=VP}
N 460 -420 460 -400 { lab=VN}
N 400 -450 430 -450 { lab=Vin}
N 400 -580 400 -450 { lab=Vin}
N 400 -580 430 -580 { lab=Vin}
N 370 -510 400 -510 { lab=Vin}
N 460 -510 500 -510 { lab=Vout}
C {madvlsi/nmos3.sym} 460 -450 0 0 {name=M1
L=\{tlen\}
W=\{twid\}
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
C {madvlsi/pmos3.sym} 460 -580 0 0 {name=M2
L=\{tlen\}
W=\{twid\}
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
C {devices/iopin.sym} 460 -630 3 0 {name=p1 lab=VP}
C {devices/iopin.sym} 460 -400 1 0 {name=p2 lab=VN}
C {devices/ipin.sym} 370 -510 0 0 {name=p3 lab=Vin}
C {devices/iopin.sym} 500 -510 0 0 {name=p4 lab=Vout}
