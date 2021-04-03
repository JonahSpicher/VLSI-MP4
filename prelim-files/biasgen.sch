v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 860 -820 880 -820 { lab=#net1}
N 870 -820 870 -780 { lab=#net1}
N 830 -780 870 -780 { lab=#net1}
N 830 -790 830 -780 { lab=#net1}
N 830 -860 830 -850 { lab=VP}
N 910 -860 910 -850 { lab=VP}
N 830 -860 910 -860 { lab=VP}
N 830 -920 830 -860 { lab=VP}
N 830 -780 830 -660 { lab=#net1}
N 910 -790 910 -660 { lab=Vbp}
N 780 -630 800 -630 { lab=#net2}
N 940 -630 960 -630 { lab=Vbn}
N 790 -670 790 -630 { lab=#net2}
N 750 -670 790 -670 { lab=#net2}
N 750 -670 750 -660 { lab=#net2}
N 950 -670 950 -630 { lab=Vbn}
N 950 -670 990 -670 { lab=Vbn}
N 990 -670 990 -660 { lab=Vbn}
N 950 -820 960 -820 { lab=Vbp}
N 950 -820 950 -760 { lab=Vbp}
N 910 -760 950 -760 { lab=Vbp}
N 780 -820 790 -820 { lab=Vbp}
N 790 -820 790 -760 { lab=Vbp}
N 790 -760 910 -760 { lab=Vbp}
N 750 -790 750 -670 { lab=#net2}
N 750 -920 750 -850 { lab=VP}
N 990 -920 990 -850 { lab=VP}
N 750 -600 750 -580 { lab=Rval}
N 680 -580 750 -580 { lab=Rval}
N 830 -600 830 -540 { lab=VN}
N 910 -600 910 -540 { lab=VN}
N 990 -600 990 -540 { lab=VN}
N 960 -630 1120 -630 { lab=Vbn}
N 960 -820 1100 -820 { lab=Vbp}
N 1100 -820 1120 -820 { lab=Vbp}
N 750 -920 990 -920 { lab=VP}
N 750 -940 750 -920 { lab=VP}
N 830 -540 990 -540 { lab=VN}
N 990 -540 990 -520 { lab=VN}
N 990 -790 990 -740 { lab=#net3}
N 990 -730 990 -670 { lab=Vbn}
C {madvlsi/nmos3.sym} 830 -630 0 0 {name=M1
L=\{isourcelen\}
W=\{isourcewid\}
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
C {madvlsi/nmos3.sym} 750 -630 2 0 {name=M5
L=\{isourcelen\}
W=\{isourcewid\}
body=GND
nf=1
mult=\{M\}
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/iopin.sym} 680 -580 2 0 {name=p1 lab=Rval}
C {devices/iopin.sym} 990 -520 1 0 {name=p2 lab=VN}
C {devices/iopin.sym} 750 -940 3 0 {name=p3 lab=VP}
C {devices/iopin.sym} 1120 -820 0 0 {name=p4 lab=Vbp}
C {devices/iopin.sym} 1120 -630 0 0 {name=p5 lab=Vbn}
C {madvlsi/ammeter1.sym} 990 -740 0 0 {name=Viout}
C {madvlsi/pmos3.sym} 750 -820 2 0 {name=M8
L=\{isourcelen\}
W=\{isourcewid\}
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
C {madvlsi/pmos3.sym} 830 -820 2 0 {name=M3
L=\{isourcelen\}
W=\{isourcewid\}
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
C {madvlsi/pmos3.sym} 910 -820 0 0 {name=M2
L=\{isourcelen\}
W=\{isourcewid\}
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
C {madvlsi/pmos3.sym} 990 -820 0 0 {name=M7
L=\{isourcelen\}
W=\{isourcewid\}
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
C {madvlsi/nmos3.sym} 910 -630 2 0 {name=M4
L=\{isourcelen\}
W=\{isourcewid\}
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
C {madvlsi/nmos3.sym} 990 -630 0 0 {name=M6
L=\{isourcelen\}
W=\{isourcewid\}
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
