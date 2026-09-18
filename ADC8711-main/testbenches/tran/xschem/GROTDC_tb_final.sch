v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 3620 1380 3620 1410 {lab=GND}
N 3620 1280 3620 1320 {lab=VSS}
N 3740 1380 3740 1410 {lab=VSS}
N 3740 1280 3740 1320 {lab=VDD}
N 4440 1390 4440 1420 {lab=VSS}
N 4440 1290 4440 1330 {lab=RESET}
N 4130 1390 4130 1420 {lab=VSS}
N 3860 1390 3860 1420 {lab=VSS}
N 4130 1290 4130 1330 {lab=STOP}
N 3860 1290 3860 1330 {lab=START}
N 4100 1600 4140 1600 {lab=START}
N 4100 1620 4140 1620 {lab=STOP}
N 4260 1520 4260 1550 {lab=VDD}
N 4620 1700 4620 1730 {lab=VSS}
N 4100 1670 4140 1670 {lab=RESET}
N 3620 1640 3620 1670 {lab=VSS}
N 3620 1540 3620 1580 {lab=CTRL[0]}
N 3740 1640 3740 1670 {lab=VSS}
N 3740 1540 3740 1580 {lab=CTRL[1]}
N 3860 1640 3860 1670 {lab=VSS}
N 3860 1540 3860 1580 {lab=CTRL[2]}
N 4100 1640 4140 1640 {lab=CTRL[2:0]}
N 4380 1640 4440 1640 {lab=OUT}
N 4620 1610 4620 1640 {lab=OUT}
N 4260 1730 4260 1760 {lab=VSS}
C {vsource.sym} 3620 1350 0 0 {name=V1 value=0 savecurrent=false
}
C {gnd.sym} 3620 1410 0 0 {name=l1 lab=GND
}
C {lab_wire.sym} 3620 1280 0 0 {name=p1 sig_type=std_logic lab=VSS
}
C {vsource.sym} 3740 1350 0 0 {name=V5 value=\{vdd\} savecurrent=false
}
C {lab_wire.sym} 3740 1410 0 0 {name=p2 sig_type=std_logic lab=VSS
}
C {devices/launcher.sym} 3965 1145 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 3580 1150 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {lab_wire.sym} 4440 1290 0 1 {name=p6 sig_type=std_logic lab=RESET
}
C {lab_wire.sym} 3740 1280 0 0 {name=p5 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 4440 1420 0 0 {name=p49 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 3860 1420 0 0 {name=p54 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 4130 1290 0 1 {name=p55 sig_type=std_logic lab=STOP
}
C {lab_wire.sym} 3860 1290 0 1 {name=p56 sig_type=std_logic lab=START
}
C {lab_wire.sym} 4130 1420 0 0 {name=p60 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 4620 1730 2 1 {name=p43 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 4260 1520 0 0 {name=p61 sig_type=std_logic lab=VDD
}
C {lab_wire.sym} 4100 1600 0 0 {name=p62 sig_type=std_logic lab=START
}
C {lab_wire.sym} 4100 1620 0 0 {name=p63 sig_type=std_logic lab=STOP
}
C {code.sym} 4770 1460 0 0 {name=NGSPICE2 only_toplevel=true 
value="
.param temp=65
.param vdd=1.2

* Agrega una resistencia gigante en los nodos flotantes
.OPTION RSHUNT=1e9

* Agrega un cap pequeño a cada nodo
* evita dv/dt infinito
.OPTION CSHUNT=1e-15

* Conducción minima en Junturas de diodos
* diodos duros
.options gmin=1e-10

* resistencia serie global (a fuentes ideales e inductores)
.option rseries = 1e-4

* integrador robusto
* ayuda a resolver la no linealidad
.options method=gear

* limita el orden del integrador
* limita cuantos pasos anteriores usa el integrador
.options maxord=2

* tolerancias : error relativo (%) - error absoluto en voltaje - error absoluto en corriente
.options reltol=1e-2 vabstol=1e-4 iabstol=1e-9

* paciencia del solver: DC - Transitorio - Newton interno
.option ITL1=1000 ITL2=400 ITL4=500


* .nodeset all=0

.control

save all


* uic: saltearse el punto de operación
*tran 5p 100n 0 5p uic

* .tran <tstep> <tstop> [tstart] [tmax] [uic]
* tmax Limita el paso máximo que puede usar el integrador
tran 5p 10p 0 10p


write GRO_TDC_tb_final.raw

.endc
"
spice_ignore=true}
C {vsource.sym} 3860 1360 0 0 {name=V9 value="dc 0 ac 0 pulse(0, \{vdd\}, 10n, 50p, 50p, 15n)" savecurrent=false
}
C {vsource.sym} 4130 1360 0 0 {name=V13 value="dc 0 ac 0 pulse(\{vdd\}, 0, 5n, 50p, 50p, 55n, 100n)" savecurrent=false
}
C {GROTDC.sym} 4120 1750 0 0 {name=XDUT}
C {lab_wire.sym} 4100 1670 0 0 {name=p7 sig_type=std_logic lab=RESET
}
C {vsource.sym} 3620 1610 0 0 {name=V4 value=\{vdd\} savecurrent=false
}
C {lab_wire.sym} 3620 1670 0 0 {name=p8 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 3620 1540 0 0 {name=p9 sig_type=std_logic lab=CTRL[0]
}
C {lab_wire.sym} 3740 1670 0 0 {name=p10 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 3740 1540 0 0 {name=p11 sig_type=std_logic lab=CTRL[1]
}
C {lab_wire.sym} 3860 1670 0 0 {name=p12 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 3860 1540 0 0 {name=p13 sig_type=std_logic lab=CTRL[2]
}
C {lab_wire.sym} 4100 1640 0 0 {name=p14 sig_type=std_logic lab=CTRL[2:0]
}
C {vsource.sym} 3740 1610 0 0 {name=V10 value=0 savecurrent=false
}
C {vsource.sym} 3860 1610 0 0 {name=V7 value=0 savecurrent=false
}
C {lab_wire.sym} 4440 1640 0 1 {name=p15 sig_type=std_logic lab=OUT
}
C {capa.sym} 4620 1670 0 0 {name=C1
m=1
value=30p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 4620 1610 0 0 {name=p3 sig_type=std_logic lab=OUT
}
C {lab_wire.sym} 4260 1760 2 1 {name=p4 sig_type=std_logic lab=VSS
}
C {code.sym} 4770 1300 0 0 {name=NGSPICE1 only_toplevel=true 
value="
.param temp=65
.param vdd=1.2

* Agrega una resistencia gigante en los nodos flotantes
.OPTION RSHUNT=1e9

* Agrega un cap pequeño a cada nodo
* evita dv/dt infinito
.OPTION CSHUNT=1e-15

* Conducción minima en Junturas de diodos
* diodos duros
.options gmin=1e-10

* resistencia serie global (a fuentes ideales e inductores)
.option rseries = 1e-4

* integrador robusto
* ayuda a resolver la no linealidad
.options method=gear

* limita el orden del integrador
* limita cuantos pasos anteriores usa el integrador
.options maxord=2

* tolerancias : error relativo (%) - error absoluto en voltaje - error absoluto en corriente
.options reltol=1e-2 vabstol=1e-4 iabstol=1e-9

* paciencia del solver: DC - Transitorio - Newton interno
.option ITL1=1000 ITL2=400 ITL4=500


* .nodeset all=0

.ic v(START)=0 v(STOP)=0 v(RESET)=0


.ic v(XDUT.IN0)=0 v(XDUT.IN1)=0 v(XDUT.IN2)=0
.ic v(XDUT.K0)=0 v(XDUT.K1)=0 v(XDUT.K2)=0

.ic v(XDUT.D0[0])=0 v(XDUT.D0[1])=0 v(XDUT.D0[2])=0
.ic v(XDUT.D0[3])=0 v(XDUT.D0[4])=0 v(XDUT.D0[5])=0

.ic v(XDUT.D1[0])=0 v(XDUT.D1[1])=0 v(XDUT.D1[2])=0
.ic v(XDUT.D1[3])=0 v(XDUT.D1[4])=0 v(XDUT.D1[5])=0

.ic v(XDUT.D2[0])=0 v(XDUT.D2[1])=0 v(XDUT.D2[2])=0
.ic v(XDUT.D2[3])=0 v(XDUT.D2[4])=0 v(XDUT.D2[5])=0

.ic v(XDUT.C0_B[0])=0 v(XDUT.C1_B[0])=0 v(XDUT.C2_B[0])=0
.ic v(XDUT.C0_B[1])=0 v(XDUT.C1_B[1])=0 v(XDUT.C2_B[1])=0
.ic v(XDUT.C0_B[2])=0 v(XDUT.C1_B[2])=0 v(XDUT.C2_B[2])=0
.ic v(XDUT.C0_B[3])=0 v(XDUT.C1_B[3])=0 v(XDUT.C2_B[3])=0
.ic v(XDUT.C0_B[4])=0 v(XDUT.C1_B[4])=0 v(XDUT.C2_B[4])=0
.ic v(XDUT.C0_B[5])=0 v(XDUT.C1_B[5])=0 v(XDUT.C2_B[5])=0

.ic v(XDUT.S1[0])=0 v(XDUT.S1[1])=0 v(XDUT.S1[2])=0
.ic v(XDUT.S1[3])=0 v(XDUT.S1[4])=0 v(XDUT.S1[5])=0

.ic v(XDUT.COUT1)=0

.ic v(XDUT.S2[0])=0 v(XDUT.S2[1])=0 v(XDUT.S2[2])=0
.ic v(XDUT.S2[3])=0 v(XDUT.S2[4])=0 v(XDUT.S2[5])=0 v(XDUT.S2[6])=0

.ic v(XDUT.COUT2)=0

.ic v(XDUT.ADDER[0])=0 v(XDUT.ADDER[1])=0 v(XDUT.ADDER[2])=0
.ic v(XDUT.ADDER[3])=0 v(XDUT.ADDER[4])=0 v(XDUT.ADDER[5])=0
.ic v(XDUT.ADDER[6])=0 v(XDUT.ADDER[7])=0


.control

* Sources
save v(START) v(STOP) v(RESET)

save v(XDUT.START_PAD) v(XDUT.STOP_PAD) v(XDUT.RESET_PAD)
save v(XDUT.VSS) v(XDUT.VDD) v(XDUT.EN)


* GRO
save v(XDUT.IN0) v(XDUT.IN1) v(XDUT.IN2)


* Buffers
save v(XDUT.K0) v(XDUT.K1) v(XDUT.K2)

* Delay cell
save v(XDUT.DRV_STOP) v(XDUT.DECLK) v(XDUT.DECLK2)

* Counters Reg
* C0_B
save v(XDUT.net1_0)
save v(XDUT.net1_1)
save v(XDUT.net1_2)
save v(XDUT.net1_3)
save v(XDUT.net1_4)
save v(XDUT.net1_5)

* C1_B
save v(XDUT.net2_0)
save v(XDUT.net2_1)
save v(XDUT.net2_2)
save v(XDUT.net2_3)
save v(XDUT.net2_4)
save v(XDUT.net2_5)

* C2_B
save v(XDUT.net3_0)
save v(XDUT.net3_1)
save v(XDUT.net3_2)
save v(XDUT.net3_3)
save v(XDUT.net3_4)
save v(XDUT.net3_5)

* Counters regs
save v(XDUT.D0[0]) v(XDUT.D0[1]) v(XDUT.D0[2])
save v(XDUT.D0[3]) v(XDUT.D0[4]) v(XDUT.D0[5])

save v(XDUT.D1[0]) v(XDUT.D1[1]) v(XDUT.D1[2])
save v(XDUT.D1[3]) v(XDUT.D1[4]) v(XDUT.D1[5])

save v(XDUT.D2[0]) v(XDUT.D2[1]) v(XDUT.D2[2])
save v(XDUT.D2[3]) v(XDUT.D2[4]) v(XDUT.D2[5])

* FA
save v(XDUT.S1[0]) v(XDUT.S1[1]) v(XDUT.S1[2])
save v(XDUT.S1[3]) v(XDUT.S1[4]) v(XDUT.S1[5])

save v(XDUT.COUT1)

save v(XDUT.S2[0]) v(XDUT.S2[1]) v(XDUT.S2[2])
save v(XDUT.S2[3]) v(XDUT.S2[4]) v(XDUT.S2[5]) v(XDUT.S2[6])

save v(XDUT.COUT2)


* FA Regs
save v(XDUT.ADDER[0]) v(XDUT.ADDER[1]) v(XDUT.ADDER[2])
save v(XDUT.ADDER[3]) v(XDUT.ADDER[4]) v(XDUT.ADDER[5])
save v(XDUT.ADDER[6]) v(XDUT.ADDER[7])

save v(OUT)

* uic: saltearse el punto de operación
*tran 5p 100n 0 5p uic

* .tran <tstep> <tstop> [tstart] [tmax] [uic]
* tmax Limita el paso máximo que puede usar el integrador
tran 5p 90n 0 10p


write GRO_TDC_tb_final.raw

.endc
"
}
C {vsource.sym} 4440 1360 0 0 {name=V2 value="dc 0 ac 0 pulse(0, \{vdd\}, 88n, 50p, 50p, 5n)" savecurrent=false
}
