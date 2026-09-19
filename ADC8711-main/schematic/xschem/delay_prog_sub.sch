v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 -230 10 -200 {lab=VDD}
N 410 -230 410 -200 {lab=VDD}
N 10 -120 10 -80 {lab=VSS}
N 410 -120 410 -80 {lab=VSS}
N 100 -160 120 -160 {lab=#net1}
N 340 -160 360 -160 {lab=#net2}
N 180 -100 180 -80 {lab=VSS}
N 220 -100 220 -80 {lab=CTRLN[0]}
N 220 -20 220 0 {lab=CTRL[1]}
N 180 -20 180 0 {lab=VDD}
N 180 120 180 140 {lab=VSS}
N 220 120 220 140 {lab=CTRLN[1]}
N 180 -240 180 -220 {lab=VDD}
N 220 -240 220 -220 {lab=CTRL[0]}
N 100 60 120 60 {lab=#net1}
N 100 -160 100 60 {lab=#net1}
N 320 60 340 60 {lab=#net2}
N 340 -160 340 60 {lab=#net2}
N 220 200 220 220 {lab=CTRL[2]}
N 180 200 180 220 {lab=VDD}
N 180 340 180 360 {lab=VSS}
N 220 340 220 360 {lab=CTRLP[2]}
N 100 280 120 280 {lab=#net1}
N 100 60 100 280 {lab=#net1}
N 320 280 340 280 {lab=#net2}
N 340 60 340 280 {lab=#net2}
N -260 -140 -220 -140 {lab=VDD}
N -260 -100 -220 -100 {lab=VSS}
N -260 -60 -220 -60 {lab=CTRL[2:0]}
N -100 -160 -40 -160 {lab=IN}
N -210 -420 -170 -420 {lab=CTRL[0]}
N -50 -420 -10 -420 {lab=CTRLN[0]}
N -120 -490 -120 -460 {lab=VDD}
N -120 -380 -120 -340 {lab=VSS}
N 150 -420 190 -420 {lab=CTRL[1]}
N 310 -420 350 -420 {lab=CTRLN[1]}
N 240 -490 240 -460 {lab=VDD}
N 240 -380 240 -340 {lab=VSS}
N 490 -420 530 -420 {lab=CTRL[2]}
N 650 -420 690 -420 {lab=CTRLN[2]}
N 580 -490 580 -460 {lab=VDD}
N 580 -380 580 -340 {lab=VSS}
N 80 -160 100 -160 {lab=#net1}
N 320 -160 340 -160 {lab=#net2}
N 480 -160 560 -160 {lab=OUT}
C {INV_D1.sym} -80 -20 0 0 {name=x1}
C {INV_D2.sym} 320 -20 0 0 {name=x2}
C {lab_wire.sym} 10 -230 0 0 {name=p21 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 410 -230 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 10 -80 0 0 {name=p2 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 410 -80 0 0 {name=p3 sig_type=std_logic lab=VSS
}
C {TG_2C.sym} 80 0 0 0 {name=x3}
C {TG_2C.sym} 80 220 0 0 {name=x4}
C {TG_2C.sym} 80 440 0 0 {name=x5}
C {lab_wire.sym} 180 -80 0 0 {name=p5 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 220 -80 0 1 {name=p6 sig_type=std_logic lab=CTRLN[0]
}
C {lab_wire.sym} 220 -240 0 1 {name=p7 sig_type=std_logic lab=CTRL[0]
}
C {lab_wire.sym} 180 -20 0 0 {name=p8 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 220 -20 0 1 {name=p9 sig_type=std_logic lab=CTRL[1]
}
C {lab_wire.sym} 180 140 0 0 {name=p10 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 220 140 0 1 {name=p11 sig_type=std_logic lab=CTRLN[1]
}
C {lab_wire.sym} 180 -240 0 0 {name=p4 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 180 200 0 0 {name=p12 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 220 200 0 1 {name=p13 sig_type=std_logic lab=CTRL[2]
}
C {lab_wire.sym} 180 360 0 0 {name=p14 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 220 360 0 1 {name=p15 sig_type=std_logic lab=CTRLN[2]
}
C {ipin.sym} -100 -160 0 0 {name=p40 lab=IN}
C {opin.sym} 560 -160 0 0 {name=p48 lab=OUT}
C {iopin.sym} -260 -140 0 1 {name=p46 lab=VDD}
C {iopin.sym} -260 -100 0 1 {name=p47 lab=VSS}
C {ipin.sym} -260 -60 0 0 {name=p70 lab=CTRL[2:0]}
C {INV_D1.sym} -210 -280 0 0 {name=x6}
C {lab_wire.sym} -120 -490 0 0 {name=p16 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} -120 -340 0 0 {name=p17 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} -210 -420 0 0 {name=p18 sig_type=std_logic lab=CTRL[0]
}
C {lab_wire.sym} -10 -420 0 1 {name=p19 sig_type=std_logic lab=CTRLN[0]
}
C {INV_D1.sym} 150 -280 0 0 {name=x7}
C {lab_wire.sym} 240 -490 0 0 {name=p20 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 240 -340 0 0 {name=p22 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 150 -420 0 0 {name=p23 sig_type=std_logic lab=CTRL[1]
}
C {lab_wire.sym} 350 -420 0 1 {name=p24 sig_type=std_logic lab=CTRLN[1]
}
C {INV_D1.sym} 490 -280 0 0 {name=x8}
C {lab_wire.sym} 580 -490 0 0 {name=p25 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 580 -340 0 0 {name=p26 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 490 -420 0 0 {name=p27 sig_type=std_logic lab=CTRL[2]
}
C {lab_wire.sym} 690 -420 0 1 {name=p28 sig_type=std_logic lab=CTRLN[2]
}
