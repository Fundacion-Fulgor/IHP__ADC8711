v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 0 0 0 {lab=A}
N 0 -30 0 0 {lab=A}
N 0 0 0 30 {lab=A}
N 0 -120 0 -90 {lab=VDD}
N 0 90 0 120 {lab=VSS}
C {ipin.sym} -80 0 0 0 {name=p1 lab=A}
C {lab_pin.sym} 0 -120 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 0 120 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {sg13g2_pr/dantenna.sym} 0 60 0 0 {name=D1
model=dantenna
l=0.78u
w=0.78u
spiceprefix=X
}
C {sg13g2_pr/dpantenna.sym} 0 -60 0 0 {name=D2
model=dpantenna
l=1.34u
w=1.05u
spiceprefix=X
}
