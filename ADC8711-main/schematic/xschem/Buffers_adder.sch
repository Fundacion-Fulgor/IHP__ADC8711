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
N 190 -640 230 -640 {lab=IN}
N 280 -600 280 -580 {lab=VSS}
N 470 -600 470 -580 {lab=VSS}
N 650 -600 650 -580 {lab=VSS}
N 840 -600 840 -580 {lab=VSS}
N 280 -700 280 -680 {lab=VDD}
N 470 -700 470 -680 {lab=VDD}
N 650 -700 650 -680 {lab=VDD}
N 840 -700 840 -680 {lab=VDD}
N 910 -640 950 -640 {lab=OUT}
N 350 -740 350 -640 {lab=2*net1}
N 420 -740 420 -640 {lab=4*net1}
N 540 -740 540 -640 {lab=4*net2}
N 600 -740 600 -640 {lab=8*net2}
N 720 -740 720 -640 {lab=8*net3}
N 790 -740 790 -640 {lab=16*net3}
C {ipin.sym} 170 -970 0 0 {name=p25 lab=IN}
C {iopin.sym} 650 -970 0 1 {name=p31 lab=VDD}
C {iopin.sym} 650 -930 0 1 {name=p32 lab=VSS}
C {opin.sym} 440 -970 0 1 {name=p37 lab=OUT}
C {INV_D1.sym} 190 -500 0 0 {name=x5[1:0]}
C {INV_D1.sym} 380 -500 0 0 {name=x6[3:0]}
C {INV_D1.sym} 560 -500 0 0 {name=x7[7:0]}
C {INV_D1.sym} 750 -500 0 0 {name=x8[15:0]}
C {lab_wire.sym} 280 -580 0 0 {name=p89 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 470 -580 0 0 {name=p90 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 650 -580 0 0 {name=p91 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 840 -580 0 0 {name=p92 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 280 -700 0 0 {name=p93 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 470 -700 0 0 {name=p94 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 650 -700 0 0 {name=p95 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 840 -700 0 0 {name=p96 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 190 -640 0 0 {name=p98 sig_type=std_logic lab=IN
}
C {lab_wire.sym} 950 -640 0 1 {name=p101 sig_type=std_logic lab=OUT
}
C {lab_wire.sym} 350 -740 0 0 {name=p1 sig_type=std_logic lab=2*net1
}
C {lab_wire.sym} 420 -740 0 0 {name=p2 sig_type=std_logic lab=4*net1
}
C {lab_wire.sym} 540 -740 0 0 {name=p3 sig_type=std_logic lab=4*net2
}
C {lab_wire.sym} 600 -740 0 0 {name=p4 sig_type=std_logic lab=8*net2
}
C {lab_wire.sym} 720 -740 0 0 {name=p5 sig_type=std_logic lab=8*net3
}
C {lab_wire.sym} 790 -740 0 0 {name=p6 sig_type=std_logic lab=16*net3
}
