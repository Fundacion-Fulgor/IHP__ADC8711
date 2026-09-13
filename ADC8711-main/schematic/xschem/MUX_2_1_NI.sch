v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 680 -420 750 -420 {lab=VOUT}
N 400 -800 470 -800 {lab=VS}
N 520 -860 520 -840 {lab=VDD}
N 520 -760 520 -740 {lab=VSS}
N 500 -660 500 -620 {lab=VSS}
N 500 -500 500 -480 {lab=VDD}
N 540 -500 540 -470 {lab=VSB}
N 540 -660 540 -620 {lab=VS}
N 640 -560 680 -560 {lab=VOUT}
N 680 -560 680 -420 {lab=VOUT}
N 590 -800 680 -800 {lab=VSB}
N 640 -300 680 -300 {lab=VOUT}
N 540 -240 540 -210 {lab=VS}
N 500 -240 500 -210 {lab=VDD}
N 500 -400 500 -360 {lab=VSS}
N 540 -400 540 -360 {lab=VSB}
N 330 -560 440 -560 {lab=VINA}
N 330 -300 440 -300 {lab=VINB}
N 680 -420 680 -300 {lab=VOUT}
C {opin.sym} 750 -420 0 0 {name=p2 lab=VOUT}
C {ipin.sym} 330 -560 0 0 {name=p3 lab=VINA}
C {ipin.sym} 330 -300 0 0 {name=p1 lab=VINB}
C {ipin.sym} 400 -800 0 0 {name=p4 lab=VS}
C {lab_wire.sym} 520 -860 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 520 -740 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 500 -480 2 1 {name=p17 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 500 -660 0 0 {name=p18 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 500 -400 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 540 -210 2 0 {name=p21 sig_type=std_logic lab=VS}
C {lab_wire.sym} 540 -660 0 1 {name=p22 sig_type=std_logic lab=VS}
C {lab_wire.sym} 540 -400 2 0 {name=p24 sig_type=std_logic lab=VSB}
C {/foss/designs/GRO-TDC/std_cells/TG_2C.sym} 400 -720 2 1 {name=x6[1:0]}
C {/foss/designs/GRO-TDC/std_cells/TG_2C.sym} 400 -460 2 1 {name=x2[1:0]}
C {lab_wire.sym} 500 -210 2 1 {name=p19 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 540 -470 2 1 {name=p5 sig_type=std_logic lab=VSB}
C {lab_wire.sym} 680 -800 2 0 {name=p6 sig_type=std_logic lab=VSB}
C {iopin.sym} 160 -740 0 0 {name=p7 lab=VDD}
C {iopin.sym} 160 -700 0 0 {name=p8 lab=VSS}
C {/foss/designs/GRO-TDC/std_cells/INV_D3.sym} 430 -660 0 0 {name=x1}
