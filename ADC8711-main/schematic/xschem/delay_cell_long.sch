v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -500 100 -460 100 {lab=IN}
N -340 180 -340 200 {lab=VSS}
N -340 40 -340 60 {lab=VDD}
N -350 -120 -310 -120 {lab=VDD}
N -460 -120 -420 -120 {lab=IN}
N -220 -120 -180 -120 {lab=OUT1}
N -350 -90 -310 -90 {lab=VSS}
N -20 40 -20 60 {lab=VDD}
N 300 40 300 60 {lab=VDD}
N -20 180 -20 200 {lab=VSS}
N 300 180 300 200 {lab=VSS}
N -220 120 -180 120 {lab=OUT1}
N -180 100 -180 120 {lab=OUT1}
N -180 100 -140 100 {lab=OUT1}
N 100 120 140 120 {lab=OUT2}
N 140 100 140 120 {lab=OUT2}
N 140 100 180 100 {lab=OUT2}
N -180 60 -180 100 {lab=OUT1}
N -220 -90 -180 -90 {lab=OUT3}
N 140 60 140 100 {lab=OUT2}
N 420 120 480 120 {lab=OUT3}
N -160 140 -160 180 {lab=CTRL[2:0]}
N -160 140 -140 140 {lab=CTRL[2:0]}
N -480 140 -480 180 {lab=CTRL[2:0]}
N -480 140 -460 140 {lab=CTRL[2:0]}
N 160 140 160 180 {lab=CTRL[2:0]}
N 160 140 180 140 {lab=CTRL[2:0]}
N -460 -90 -420 -90 {lab=CTRL[2:0]}
C {lab_wire.sym} -340 200 0 0 {name=p23 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -340 40 0 0 {name=p27 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} -500 100 0 0 {name=p32 sig_type=std_logic lab=IN
}
C {ipin.sym} -460 -120 0 0 {name=p2 lab=IN}
C {iopin.sym} -350 -120 0 1 {name=p3 lab=VDD}
C {iopin.sym} -350 -90 0 1 {name=p5 lab=VSS}
C {opin.sym} -220 -120 0 1 {name=p6 lab=OUT1}
C {delay_prog.sym} -320 140 0 0 {name=x1}
C {delay_prog.sym} 0 140 0 0 {name=x2}
C {delay_prog.sym} 320 140 0 0 {name=x3}
C {lab_wire.sym} -20 40 0 0 {name=p7 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 300 40 0 0 {name=p8 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} -20 200 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 300 200 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -180 60 0 0 {name=p11 sig_type=std_logic lab=OUT1
}
C {opin.sym} -220 -90 0 1 {name=p12 lab=OUT3}
C {lab_wire.sym} 140 60 0 1 {name=p13 sig_type=std_logic lab=OUT2
}
C {lab_wire.sym} 480 120 0 1 {name=p14 sig_type=std_logic lab=OUT3
}
C {ipin.sym} -460 -90 0 0 {name=p1 lab=CTRL[2:0]}
C {lab_wire.sym} -480 180 3 0 {name=p15 sig_type=std_logic lab=CTRL[2:0]
}
C {lab_wire.sym} -160 180 3 0 {name=p16 sig_type=std_logic lab=CTRL[2:0]
}
C {lab_wire.sym} 160 180 3 0 {name=p17 sig_type=std_logic lab=CTRL[2:0]
}
