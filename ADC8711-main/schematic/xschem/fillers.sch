v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 80 110 80 130 {lab=VSS}
N 0 60 40 60 {lab=VSS}
N 0 -70 40 -70 {lab=VDD}
N 80 -120 80 -100 {lab=VDD}
N 80 -70 100 -70 {lab=VDD}
N 100 -120 100 -70 {lab=VDD}
N 80 60 100 60 {lab=VSS}
N 100 60 100 110 {lab=VSS}
N 80 -120 100 -120 {lab=VDD}
N 80 -140 80 -120 {lab=VDD}
N 80 110 100 110 {lab=VSS}
N 80 90 80 110 {lab=VSS}
N 80 0 80 30 {lab=VSS}
N 0 -0 80 -0 {lab=VSS}
N 0 -0 0 60 {lab=VSS}
N 0 110 80 110 {lab=VSS}
N -0 60 -0 110 {lab=VSS}
N 0 -120 -0 -70 {lab=VDD}
N 0 -120 80 -120 {lab=VDD}
N 80 -40 80 -20 {lab=VDD}
N 0 -20 80 -20 {lab=VDD}
N 0 -70 -0 -20 {lab=VDD}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 -70 0 0 {name=M2
l=0.13u
w=0.3u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 80 -140 0 0 {name=p1 lab=VDD}
C {iopin.sym} 80 130 0 0 {name=p2 lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 60 60 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
