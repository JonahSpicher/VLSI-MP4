v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 670 -620 700 -620 { lab=b0}
N 670 -600 700 -600 { lab=b1}
N 670 -580 700 -580 { lab=b2}
N 670 -560 700 -560 { lab=b3}
N 670 -540 700 -540 { lab=b4}
N 670 -520 700 -520 { lab=b5}
N 670 -500 700 -500 { lab=b6}
N 790 -660 790 -640 { lab=VDD}
N 790 -480 790 -460 { lab=GND}
N 730 -650 730 -640 { lab=#net1}
N 610 -650 730 -650 { lab=#net1}
N 610 -440 610 -420 { lab=GND}
N 610 -650 610 -500 { lab=#net1}
N 1040 -560 1070 -560 { lab=#net2}
N 1080 -560 1120 -560 { lab=#net3}
N 1120 -560 1120 -540 { lab=#net3}
C {/home/jonah/VLSI/VLSI-MP4/design-files/dacfull.sym} 350 -1410 1 0 {name=X1}
C {madvlsi/gnd.sym} 90 -680 0 0 {name=l1 lab=GND}
C {madvlsi/vsource.sym} 90 -710 0 0 {name=Vb0
value=1.8}
C {madvlsi/gnd.sym} 160 -680 0 0 {name=l2 lab=GND}
C {madvlsi/vsource.sym} 160 -710 0 0 {name=Vb1
value=1.8}
C {madvlsi/gnd.sym} 220 -680 0 0 {name=l3 lab=GND}
C {madvlsi/vsource.sym} 220 -710 0 0 {name=Vb2
value=1.8}
C {madvlsi/gnd.sym} 290 -680 0 0 {name=l4 lab=GND}
C {madvlsi/vsource.sym} 290 -710 0 0 {name=Vb3
value=1.8}
C {madvlsi/gnd.sym} 350 -680 0 0 {name=l5 lab=GND}
C {madvlsi/vsource.sym} 350 -710 0 0 {name=Vb4
value=1.8}
C {madvlsi/gnd.sym} 420 -680 0 0 {name=l6 lab=GND}
C {madvlsi/vsource.sym} 420 -710 0 0 {name=Vb5
value=1.8}
C {madvlsi/gnd.sym} 480 -680 0 0 {name=l7 lab=GND}
C {madvlsi/vsource.sym} 480 -710 0 0 {name=Vb6
value=1.8}
C {madvlsi/gnd.sym} 550 -680 0 0 {name=l8 lab=GND}
C {madvlsi/vsource.sym} 550 -710 0 0 {name=Vdd
value=1.8}
C {madvlsi/vdd.sym} 550 -740 0 0 {name=l9 lab=VDD}
C {devices/lab_pin.sym} 90 -740 1 0 {name=l10 sig_type=std_logic lab=b0}
C {devices/lab_pin.sym} 160 -740 1 0 {name=l11 sig_type=std_logic lab=b1}
C {devices/lab_pin.sym} 220 -740 1 0 {name=l12 sig_type=std_logic lab=b2}
C {devices/lab_pin.sym} 290 -740 1 0 {name=l13 sig_type=std_logic lab=b3}
C {devices/lab_pin.sym} 350 -740 1 0 {name=l14 sig_type=std_logic lab=b4}
C {devices/lab_pin.sym} 420 -740 1 0 {name=l15 sig_type=std_logic lab=b5}
C {devices/lab_pin.sym} 480 -740 1 0 {name=l16 sig_type=std_logic lab=b6}
C {devices/lab_pin.sym} 670 -620 0 0 {name=l17 sig_type=std_logic lab=b0}
C {devices/lab_pin.sym} 670 -600 0 0 {name=l18 sig_type=std_logic lab=b1}
C {devices/lab_pin.sym} 670 -580 0 0 {name=l19 sig_type=std_logic lab=b2}
C {devices/lab_pin.sym} 670 -560 0 0 {name=l20 sig_type=std_logic lab=b3}
C {devices/lab_pin.sym} 670 -540 0 0 {name=l21 sig_type=std_logic lab=b4}
C {devices/lab_pin.sym} 670 -520 0 0 {name=l22 sig_type=std_logic lab=b5}
C {devices/lab_pin.sym} 670 -500 0 0 {name=l23 sig_type=std_logic lab=b6}
C {madvlsi/vdd.sym} 790 -660 0 0 {name=l24 lab=VDD}
C {madvlsi/gnd.sym} 790 -460 0 0 {name=l25 lab=GND}
C {madvlsi/resistor.sym} 610 -470 0 0 {name=R1
value=\{Rbias*1000\}
m=1}
C {madvlsi/gnd.sym} 610 -420 0 0 {name=l26 lab=GND}
C {madvlsi/ammeter1.sym} 1070 -560 3 0 {name=Viout}
C {madvlsi/gnd.sym} 1120 -480 0 0 {name=l27 lab=GND}
C {madvlsi/vsource.sym} 1120 -510 0 0 {name=Vout
value=1.8}
C {devices/code.sym} 440 -590 0 0 {name=SPICE1 only_toplevel=false value="
.param llen=1.4
.param lwid=5.7
.param blen=0.5
.param bwid=1.4
.param brlen=0.3
.param brwid=3.15
.param Rbias=250
.control
	
	let mc_runs = 5
	let run = 1
	dowhile run <= mc_runs
		set wr_vecnames
		set wr_singlescale
		set appendwrite = FALSE 
		let code = 0
		while code < 128
			if code eq 0
				let nb0 = 0
			else
				let nb0 = (code % 2)*1.8
			end
			if floor(code / 2) eq 0
				let nb1 = 0
			else
				let nb1 = (floor(code / 2) % 2)*1.8
			end
			if floor(code / 4) eq 0
				let nb2 = 0
			else
				let nb2 = (floor(code / 4) % 2)*1.8
			end
			if floor(code / 8) eq 0
				let nb3 = 0
			else
				let nb3 = (floor(code / 8) % 2)*1.8
			end
			if floor(code / 16) eq 0
				let nb4 = 0
			else
				let nb4 = (floor(code / 16) % 2)*1.8
			end
			if floor(code / 32) eq 0
				let nb5 = 0
			else
				let nb5 = (floor(code / 32) % 2)*1.8
			end
			if floor(code / 64) eq 0
				let nb6 = 0
			else
				let nb6 = (floor(code / 64) % 2)*1.8
			end
			alter Vb0 $&nb0
			alter Vb1 $&nb1
			alter Vb2 $&nb2
			alter Vb3 $&nb3
			alter Vb4 $&nb4
			alter Vb5 $&nb5
			alter Vb6 $&nb6
			save i(Viout) v(b0) v(b1) v(b2) v(b3) v(b4) v(b5) v(b6) 
			op
			wrdata ~/VLSI/VLSI-MP4/design-files/opt/dacdataMC\{$&run\}.txt i(Viout)
			if code eq 0
				set appendwrite
				set wr_vecnames = FALSE
			end
			let code = code + 1

		end
	reset 
	let run = run + 1
	end
	quit
.endc"
}
C {madvlsi/tt_models.sym} 290 -590 0 0 {
name=TT_MODELS
only_toplevel=false
value=".option wnflag=1
.param MC_SWITCH=0
.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/sky130.lib.spice tt"
}
