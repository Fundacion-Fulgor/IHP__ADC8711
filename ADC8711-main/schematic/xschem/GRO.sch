v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 520 -300 520 -280 {lab=VSS}
N 780 -300 780 -280 {lab=VSS}
N 1060 -300 1060 -280 {lab=VSS}
N 650 -340 730 -340 {lab=K0}
N 520 -440 520 -380 {lab=S}
N 1060 -440 1060 -380 {lab=S}
N 780 -440 780 -380 {lab=S}
N 430 -340 430 -250 {lab=K2}
N 430 -250 1170 -250 {lab=K2}
N 1170 -340 1170 -250 {lab=K2}
N 1130 -340 1170 -340 {lab=K2}
N 650 -340 650 -300 {lab=K0}
N 930 -340 930 -300 {lab=K1}
N 850 -340 930 -340 {lab=K1}
N 1170 -340 1190 -340 {lab=K2}
N 430 -340 470 -340 {lab=K2}
N 930 -340 1010 -340 {lab=K1}
N 230 -420 230 -400 {lab=VDD}
N 780 -440 1060 -440 {lab=S}
N 230 -370 280 -370 {lab=VDD}
N 280 -420 280 -370 {lab=VDD}
N 230 -420 280 -420 {lab=VDD}
N 230 -450 230 -420 {lab=VDD}
N 150 -370 190 -370 {lab=G}
N 580 -600 630 -600 {lab=#net1}
N 750 -600 790 -600 {lab=#net2}
N 910 -600 940 -600 {lab=EN_N}
N 1060 -600 1100 -600 {lab=G}
N 420 -600 460 -600 {lab=EN}
N 510 -560 510 -540 {lab=VSS}
N 680 -560 680 -540 {lab=VSS}
N 840 -560 840 -540 {lab=VSS}
N 990 -560 990 -540 {lab=VSS}
N 510 -660 510 -640 {lab=VDD}
N 680 -660 680 -640 {lab=VDD}
N 840 -660 840 -640 {lab=VDD}
N 990 -660 990 -640 {lab=VDD}
N 160 -680 200 -680 {lab=VDD}
N 160 -630 200 -630 {lab=VSS}
N 50 -680 90 -680 {lab=EN}
N 300 -680 340 -680 {lab=K0}
N 300 -640 340 -640 {lab=K1}
N 300 -600 340 -600 {lab=K2}
N 150 -250 190 -250 {lab=G}
N 230 -250 280 -250 {lab=VSS}
N 280 -250 280 -190 {lab=VSS}
N 230 -190 280 -190 {lab=VSS}
N 230 -220 230 -190 {lab=VSS}
N 230 -310 230 -280 {lab=S}
N 1110 -80 1150 -80 {lab=G}
N 1190 -80 1240 -80 {lab=VSS}
N 1240 -80 1240 -20 {lab=VSS}
N 1190 -20 1240 -20 {lab=VSS}
N 1190 -50 1190 -20 {lab=VSS}
N 1190 -160 1190 -110 {lab=K2}
N 520 -440 780 -440 {lab=S}
N 590 -340 650 -340 {lab=K0}
N 230 -310 280 -310 {lab=S}
N 230 -340 230 -310 {lab=S}
N 570 -80 610 -80 {lab=G}
N 650 -80 700 -80 {lab=VSS}
N 700 -80 700 -20 {lab=VSS}
N 650 -20 700 -20 {lab=VSS}
N 650 -50 650 -20 {lab=VSS}
N 650 -160 650 -110 {lab=K0}
N 850 -80 890 -80 {lab=G}
N 930 -80 980 -80 {lab=VSS}
N 980 -80 980 -20 {lab=VSS}
N 930 -20 980 -20 {lab=VSS}
N 930 -50 930 -20 {lab=VSS}
N 930 -160 930 -110 {lab=K1}
C {INV3.sym} 430 -200 0 0 {name=x2}
C {lab_wire.sym} 650 -300 0 0 {name=p10 sig_type=std_logic lab=K0}
C {lab_wire.sym} 930 -300 0 0 {name=p11 sig_type=std_logic lab=K1}
C {lab_wire.sym} 1190 -340 0 1 {name=p14 sig_type=std_logic lab=K2}
C {lab_wire.sym} 520 -280 0 0 {name=p15 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 780 -280 0 0 {name=p16 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1060 -280 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 230 -450 0 0 {name=p21 sig_type=std_logic lab=VDD
}
C {INV3.sym} 690 -200 0 0 {name=x3}
C {INV3.sym} 970 -200 0 0 {name=x4}
C {sg13g2_pr/sg13_lv_pmos.sym} 210 -370 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=64
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_wire.sym} 150 -370 0 0 {name=p34 sig_type=std_logic lab=G
}
C {INV_D1.sym} 420 -460 0 0 {name=x5[1:0]}
C {INV_D1.sym} 590 -460 0 0 {name=x6[3:0]}
C {INV_D1.sym} 750 -460 0 0 {name=x7[7:0]}
C {INV_D1.sym} 900 -460 0 0 {name=x8[15:0]}
C {lab_wire.sym} 510 -540 0 0 {name=p23 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 680 -540 0 0 {name=p24 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 840 -540 0 0 {name=p25 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 990 -540 0 0 {name=p26 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 510 -660 0 0 {name=p27 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 680 -660 0 0 {name=p28 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 840 -660 0 0 {name=p29 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 990 -660 0 0 {name=p30 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 1100 -600 0 1 {name=p31 sig_type=std_logic lab=G
}
C {lab_wire.sym} 420 -600 0 0 {name=p32 sig_type=std_logic lab=EN
}
C {ipin.sym} 50 -680 0 0 {name=p1 lab=EN}
C {iopin.sym} 160 -680 0 1 {name=p2 lab=VDD}
C {iopin.sym} 160 -630 0 1 {name=p3 lab=VSS}
C {opin.sym} 300 -680 0 1 {name=p4 lab=K0}
C {opin.sym} 300 -640 0 1 {name=p5 lab=K1}
C {opin.sym} 300 -600 0 1 {name=p6 lab=K2}
C {lab_wire.sym} 520 -440 0 0 {name=p7 sig_type=std_logic lab=S
}
C {lab_wire.sym} 150 -250 0 0 {name=p8 sig_type=std_logic lab=G
}
C {sg13g2_pr/sg13_lv_nmos.sym} 210 -250 0 0 {name=M2
l=0.13u
w=0.15u
ng=1
m=32
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 230 -190 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1110 -80 0 0 {name=p12 sig_type=std_logic lab=G
}
C {lab_wire.sym} 1190 -20 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1190 -160 0 1 {name=p18 sig_type=std_logic lab=K2}
C {lab_wire.sym} 930 -600 3 0 {name=p22 sig_type=std_logic lab=EN_N
}
C {lab_wire.sym} 280 -310 2 0 {name=p35 sig_type=std_logic lab=S
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1170 -80 0 0 {name=M4
l=0.13u
w=0.15u
ng=1
m=16
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 570 -80 0 0 {name=p19 sig_type=std_logic lab=G
}
C {lab_wire.sym} 650 -20 0 0 {name=p20 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 650 -160 0 1 {name=p33 sig_type=std_logic lab=K0}
C {sg13g2_pr/sg13_lv_nmos.sym} 630 -80 0 0 {name=M3
l=0.13u
w=0.15u
ng=1
m=16
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_wire.sym} 850 -80 0 0 {name=p36 sig_type=std_logic lab=G
}
C {lab_wire.sym} 930 -20 0 0 {name=p37 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 930 -160 0 1 {name=p38 sig_type=std_logic lab=K1}
C {sg13g2_pr/sg13_lv_nmos.sym} 910 -80 0 0 {name=M5
l=0.13u
w=0.15u
ng=1
m=16
model=sg13_lv_nmos
spiceprefix=X
}
