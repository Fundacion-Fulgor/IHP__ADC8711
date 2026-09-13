v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -260 -140 -220 -140 {lab=VDD}
N -260 -100 -220 -100 {lab=VSS}
N -260 -60 -220 -60 {lab=CTRL[2:0]}
N -100 -160 -40 -160 {lab=IN}
N 220 -240 220 -200 {lab=VDD}
N 60 -160 100 -160 {lab=IN}
N 60 -120 100 -120 {lab=CTRL[2:0]}
N 220 -80 220 -40 {lab=VSS}
N 340 -140 380 -140 {lab=OUT0}
N -100 -120 -40 -120 {lab=OUT}
N 380 -160 380 -140 {lab=OUT0}
N 380 -160 440 -160 {lab=OUT0}
N 400 -120 440 -120 {lab=CTRL[2:0]}
N 560 -240 560 -200 {lab=VDD}
N 560 -80 560 -40 {lab=VSS}
N 680 -140 720 -140 {lab=OUT1}
N 720 -160 720 -140 {lab=OUT1}
N 720 -160 780 -160 {lab=OUT1}
N 740 -120 780 -120 {lab=CTRL[2:0]}
N 900 -240 900 -200 {lab=VDD}
N 900 -80 900 -40 {lab=VSS}
N 1020 -140 1060 -140 {lab=OUT2}
N 1060 -160 1060 -140 {lab=OUT2}
N 1060 -160 1120 -160 {lab=OUT2}
N 1080 -120 1120 -120 {lab=CTRL[2:0]}
N 1240 -240 1240 -200 {lab=VDD}
N 1240 -80 1240 -40 {lab=VSS}
N 1360 -140 1400 -140 {lab=OUT3}
N 1400 -160 1400 -140 {lab=OUT3}
N 1400 -160 1460 -160 {lab=OUT3}
N 1420 -120 1460 -120 {lab=CTRL[2:0]}
N 1580 -240 1580 -200 {lab=VDD}
N 1580 -80 1580 -40 {lab=VSS}
N 1700 -140 1740 -140 {lab=OUT4}
N 1740 -160 1740 -140 {lab=OUT4}
N 1740 -160 1800 -160 {lab=OUT4}
N 1760 -120 1800 -120 {lab=CTRL[2:0]}
N 1920 -240 1920 -200 {lab=VDD}
N 1920 -80 1920 -40 {lab=VSS}
N 2040 -140 2080 -140 {lab=OUT5}
N 2080 -160 2080 -140 {lab=OUT5}
N 2080 -160 2140 -160 {lab=OUT5}
N 2100 -120 2140 -120 {lab=CTRL[2:0]}
N 2260 -240 2260 -200 {lab=VDD}
N 2260 -80 2260 -40 {lab=VSS}
N 2380 -140 2420 -140 {lab=OUT6}
N 2420 -160 2420 -140 {lab=OUT6}
N 2420 -160 2480 -160 {lab=OUT6}
N 2440 -120 2480 -120 {lab=CTRL[2:0]}
N 2600 -240 2600 -200 {lab=VDD}
N 2600 -80 2600 -40 {lab=VSS}
N 2720 -140 2760 -140 {lab=OUT7}
N 2760 -160 2760 -140 {lab=OUT7}
N 2760 -160 2820 -160 {lab=OUT7}
N 2780 -120 2820 -120 {lab=CTRL[2:0]}
N 2940 -240 2940 -200 {lab=VDD}
N 2940 -80 2940 -40 {lab=VSS}
N 3060 -140 3100 -140 {lab=OUT8}
N 3100 -160 3100 -140 {lab=OUT8}
N 3100 -160 3160 -160 {lab=OUT8}
N 3120 -120 3160 -120 {lab=CTRL[2:0]}
N 3280 -240 3280 -200 {lab=VDD}
N 3280 -80 3280 -40 {lab=VSS}
N 4080 -140 4140 -140 {lab=OUT0}
N 3400 -140 3440 -140 {lab=OUT9}
N 3440 -160 3440 -140 {lab=OUT9}
N 3440 -160 3500 -160 {lab=OUT9}
N 3460 -120 3500 -120 {lab=CTRL[2:0]}
N 3620 -240 3620 -200 {lab=VDD}
N 3620 -80 3620 -40 {lab=VSS}
N 3740 -140 3780 -140 {lab=OUT10}
N 3780 -160 3780 -140 {lab=OUT10}
N 3780 -160 3840 -160 {lab=OUT10}
N 3800 -120 3840 -120 {lab=CTRL[2:0]}
N 3960 -240 3960 -200 {lab=VDD}
N 3960 -80 3960 -40 {lab=VSS}
C {ipin.sym} -100 -160 0 0 {name=p40 lab=IN}
C {iopin.sym} -260 -140 0 1 {name=p46 lab=VDD}
C {iopin.sym} -260 -100 0 1 {name=p47 lab=VSS}
C {ipin.sym} -260 -60 0 0 {name=p70 lab=CTRL[2:0]}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 240 -120 0 0 {name=x1}
C {lab_wire.sym} 220 -240 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 60 -160 0 0 {name=p2 sig_type=std_logic lab=IN}
C {lab_wire.sym} 60 -120 0 0 {name=p3 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 220 -40 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 380 -160 3 1 {name=p5 sig_type=std_logic lab=OUT0}
C {opin.sym} -100 -120 2 0 {name=p6 lab=OUT}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 580 -120 0 0 {name=x2}
C {lab_wire.sym} 400 -120 3 0 {name=p7 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 560 -240 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 560 -40 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 720 -160 3 1 {name=p10 sig_type=std_logic lab=OUT1}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 920 -120 0 0 {name=x3}
C {lab_wire.sym} 740 -120 3 0 {name=p11 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 900 -240 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 900 -40 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1060 -160 3 1 {name=p14 sig_type=std_logic lab=OUT2}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 1260 -120 0 0 {name=x4}
C {lab_wire.sym} 1080 -120 3 0 {name=p15 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 1240 -240 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1240 -40 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1400 -160 3 1 {name=p18 sig_type=std_logic lab=OUT3}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 1600 -120 0 0 {name=x5}
C {lab_wire.sym} 1420 -120 3 0 {name=p19 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 1580 -240 0 0 {name=p20 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1580 -40 0 0 {name=p21 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1740 -160 3 1 {name=p22 sig_type=std_logic lab=OUT4}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 1940 -120 0 0 {name=x6}
C {lab_wire.sym} 1760 -120 3 0 {name=p23 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 1920 -240 0 0 {name=p24 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1920 -40 0 0 {name=p25 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 2080 -160 3 1 {name=p26 sig_type=std_logic lab=OUT5}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 2280 -120 0 0 {name=x7}
C {lab_wire.sym} 2100 -120 3 0 {name=p27 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 2260 -240 0 0 {name=p28 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 2260 -40 0 0 {name=p29 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 2420 -160 3 1 {name=p30 sig_type=std_logic lab=OUT6}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 2620 -120 0 0 {name=x8}
C {lab_wire.sym} 2440 -120 3 0 {name=p31 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 2600 -240 0 0 {name=p32 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 2600 -40 0 0 {name=p33 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 2760 -160 3 1 {name=p34 sig_type=std_logic lab=OUT7}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 2960 -120 0 0 {name=x9}
C {lab_wire.sym} 2780 -120 3 0 {name=p35 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 2940 -240 0 0 {name=p36 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 2940 -40 0 0 {name=p37 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 3100 -160 3 1 {name=p38 sig_type=std_logic lab=OUT8}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 3300 -120 0 0 {name=x10}
C {lab_wire.sym} 3120 -120 3 0 {name=p39 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 3280 -240 0 0 {name=p41 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 3280 -40 0 0 {name=p42 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 4140 -140 0 1 {name=p43 sig_type=std_logic lab=OUT}
C {lab_wire.sym} 3440 -160 3 1 {name=p44 sig_type=std_logic lab=OUT9}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 3640 -120 0 0 {name=x11}
C {lab_wire.sym} 3460 -120 3 0 {name=p45 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 3620 -240 0 0 {name=p48 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 3620 -40 0 0 {name=p49 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 3780 -160 3 1 {name=p50 sig_type=std_logic lab=OUT10}
C {/foss/designs/GRO-TDC/std_cells/delay_prog_sub.sym} 3980 -120 0 0 {name=x12}
C {lab_wire.sym} 3800 -120 3 0 {name=p51 sig_type=std_logic lab=CTRL[2:0]}
C {lab_wire.sym} 3960 -240 0 0 {name=p52 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 3960 -40 0 0 {name=p53 sig_type=std_logic lab=VSS}
