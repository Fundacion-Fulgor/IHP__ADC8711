v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 170 -970 210 -970 {lab=IN}
N 650 -970 690 -970 {lab=VDD}
N 650 -930 690 -930 {lab=VSS}
N 440 -970 480 -970 {lab=OUT}
N 370 -640 420 -640 {lab=#net1}
N 540 -640 580 -640 {lab=#net2}
N 700 -640 730 -640 {lab=#net3}
N 210 -640 250 -640 {lab=IN}
N 300 -600 300 -580 {lab=VSS}
N 470 -600 470 -580 {lab=VSS}
N 630 -600 630 -580 {lab=VSS}
N 780 -600 780 -580 {lab=VSS}
N 300 -700 300 -680 {lab=VDD}
N 470 -700 470 -680 {lab=VDD}
N 630 -700 630 -680 {lab=VDD}
N 780 -700 780 -680 {lab=VDD}
N 850 -640 890 -640 {lab=OUT}
C {ipin.sym} 170 -970 0 0 {name=p25 lab=IN}
C {iopin.sym} 650 -970 0 1 {name=p31 lab=VDD}
C {iopin.sym} 650 -930 0 1 {name=p32 lab=VSS}
C {opin.sym} 440 -970 0 1 {name=p37 lab=OUT}
C {INV_D1.sym} 210 -500 0 0 {name=x5[1:0]}
C {INV_D1.sym} 380 -500 0 0 {name=x6[3:0]}
C {INV_D1.sym} 540 -500 0 0 {name=x7[7:0]}
C {INV_D1.sym} 690 -500 0 0 {name=x8[15:0]}
C {lab_wire.sym} 300 -580 0 0 {name=p89 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 470 -580 0 0 {name=p90 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 630 -580 0 0 {name=p91 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 780 -580 0 0 {name=p92 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 300 -700 0 0 {name=p93 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 470 -700 0 0 {name=p94 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 630 -700 0 0 {name=p95 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 780 -700 0 0 {name=p96 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 210 -640 0 0 {name=p98 sig_type=std_logic lab=IN
}
C {lab_wire.sym} 890 -640 0 1 {name=p101 sig_type=std_logic lab=OUT
}
