v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -460 80 -420 80 {lab=IN}
N -300 160 -300 180 {lab=VSS}
N -300 20 -300 40 {lab=VDD}
N -350 -120 -310 -120 {lab=VDD}
N -460 -120 -420 -120 {lab=IN}
N -220 -120 -180 -120 {lab=OUT1}
N -350 -90 -310 -90 {lab=VSS}
N 790 20 790 40 {lab=VDD}
N 1110 20 1110 40 {lab=VDD}
N 790 160 790 180 {lab=VSS}
N 1110 160 1110 180 {lab=VSS}
N 630 80 630 100 {lab=OUT1}
N 630 80 670 80 {lab=OUT1}
N 910 100 950 100 {lab=OUT2}
N 950 80 950 100 {lab=OUT2}
N 950 80 990 80 {lab=OUT2}
N 630 40 630 80 {lab=OUT1}
N -220 -90 -180 -90 {lab=OUT3}
N 950 40 950 80 {lab=OUT2}
N 1230 100 1290 100 {lab=OUT3}
N 650 120 650 160 {lab=CTRL[2:0]}
N 650 120 670 120 {lab=CTRL[2:0]}
N -440 120 -440 160 {lab=CTRL[2:0]}
N -440 120 -420 120 {lab=CTRL[2:0]}
N 970 120 970 160 {lab=CTRL[2:0]}
N 970 120 990 120 {lab=CTRL[2:0]}
N -460 -90 -420 -90 {lab=CTRL[2:0]}
N 90 20 90 40 {lab=VDD}
N 410 20 410 40 {lab=VDD}
N 90 160 90 180 {lab=VSS}
N 410 160 410 180 {lab=VSS}
N -70 80 -30 80 {lab=OUT00}
N 210 100 250 100 {lab=OUT0}
N 250 80 250 100 {lab=OUT0}
N 250 80 290 80 {lab=OUT0}
N -70 40 -70 80 {lab=OUT00}
N 250 40 250 80 {lab=OUT0}
N 530 100 630 100 {lab=OUT1}
N -50 120 -50 160 {lab=CTRL[2:0]}
N -50 120 -30 120 {lab=CTRL[2:0]}
N 270 120 270 160 {lab=CTRL[2:0]}
N 270 120 290 120 {lab=CTRL[2:0]}
N -180 100 -70 100 {lab=OUT00}
N -70 80 -70 100 {lab=OUT00}
C {lab_wire.sym} -300 180 0 0 {name=p23 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -300 20 0 0 {name=p27 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} -460 80 0 0 {name=p32 sig_type=std_logic lab=IN
}
C {ipin.sym} -460 -120 0 0 {name=p2 lab=IN}
C {iopin.sym} -350 -120 0 1 {name=p3 lab=VDD}
C {iopin.sym} -350 -90 0 1 {name=p5 lab=VSS}
C {opin.sym} -220 -120 0 1 {name=p6 lab=OUT1}
C {lab_wire.sym} 790 20 0 0 {name=p7 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 1110 20 0 0 {name=p8 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 790 180 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1110 180 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 630 40 0 0 {name=p11 sig_type=std_logic lab=OUT1
}
C {opin.sym} -220 -90 0 1 {name=p12 lab=OUT3}
C {lab_wire.sym} 950 40 0 1 {name=p13 sig_type=std_logic lab=OUT2
}
C {lab_wire.sym} 1290 100 0 1 {name=p14 sig_type=std_logic lab=OUT3
}
C {ipin.sym} -460 -90 0 0 {name=p1 lab=CTRL[2:0]}
C {lab_wire.sym} -440 160 3 0 {name=p15 sig_type=std_logic lab=CTRL[2:0]
}
C {lab_wire.sym} 650 160 3 0 {name=p16 sig_type=std_logic lab=CTRL[2:0]
}
C {lab_wire.sym} 970 160 3 0 {name=p17 sig_type=std_logic lab=CTRL[2:0]
}
C {delay_prog.sym} -280 120 0 0 {name=x1}
C {delay_prog.sym} 810 120 0 0 {name=x2}
C {delay_prog.sym} 1130 120 0 0 {name=x3}
C {lab_wire.sym} 90 20 0 0 {name=p4 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 410 20 0 0 {name=p18 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 90 180 0 0 {name=p19 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 410 180 0 0 {name=p20 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -70 40 0 0 {name=p21 sig_type=std_logic lab=OUT00}
C {lab_wire.sym} 250 40 0 1 {name=p22 sig_type=std_logic lab=OUT0
}
C {lab_wire.sym} -50 160 3 0 {name=p25 sig_type=std_logic lab=CTRL[2:0]
}
C {lab_wire.sym} 270 160 3 0 {name=p26 sig_type=std_logic lab=CTRL[2:0]
}
C {delay_prog.sym} 110 120 0 0 {name=x4}
C {delay_prog.sym} 430 120 0 0 {name=x5}
