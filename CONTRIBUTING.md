# Guía de nombres y subida — IHP__ADC8711 (GRO-TDC)

**Repo:** `IHP__ADC8711` · **Categoría:** Mixed-Signal · **Subcategoría:** ADC · **Top cell:** `ADC8711` · **Proceso:** IHP SG13G2

Esta guía es para quien suba archivos de diseño al repo. Seguila al pie de la letra: el sistema de submission de IHP valida nombres y rutas automáticamente, y un nombre mal puesto rechaza todo el envío.

---

## 1. Regla de oro: un solo nombre cambia

La **celda de nivel superior** (el chip completo, con todos los bloques integrados) tiene que llamarse **`ADC8711`** en TODOS lados:

- Esquemático top-level → celda `ADC8711`
- Layout top-level (GDS) → celda `ADC8711`, archivo `ADC8711.gds`
- Netlist top-level → `ADC8711.spice` (o `.cdl`)

**Las subceldas internas conservan su propio nombre**, no hace falta tocarlas: el oscilador gateado, los comparadores/buffers, el SR latch, los biestables D, los contadores, el árbol de sumadores, el multiplexor de salida — cada uno se llama como ya se llama en el diseño. Solo el nivel más alto de la jerarquía se renombra.

Si alguien no sabe si el archivo que tiene es "el top" o "una subcelda": el top es el que instancia a todos los demás bloques y tiene los pines externos (START, STOP, CTRL[2:0], DECLK, RESET, OUTPUT, VDD, VSS).

---

## 2. Dónde va cada archivo

Toda esta estructura ya existe en el repo (la generó el script), no hay que crear carpetas nuevas — solo copiar los archivos adentro de la que corresponda, dentro de `ADC8711-main/`.

| Carpeta | Qué va ahí | Ejemplo de nombre |
|---|---|---|
| `schematic/xschem/` | Esquemático top-level + esquemáticos de cada subcelda (GRO, comparadores, SR latch, biestables D, sumadores, mux) | `ADC8711.sch`, `GRO.sch`, `dflipflop.sch`, etc. |
| `layout/klayout/` | Layout final, completo con pad ring, ya DRC/LVS limpio | `ADC8711.gds` |
| `netlist/schematic/` | Netlist exportado desde xschem (el de referencia, "golden") | `ADC8711.spice` o `.cdl` |
| `netlist/layout/` | Netlist extraído del layout (el que se compara contra el de arriba en el LVS) | `ADC8711.spice` |
| `netlist/pex/` | Netlist con parásitos post-layout, si lo tienen | `ADC8711_pex.spice` |
| `verification/drc/` | Reporte de DRC (según el informe, ya está 100% limpio) | `ADC8711.lyrdb` |
| `verification/lvs/` | Reporte de LVS (también 100% limpio) | `ADC8711.lvsdb` |
| `testbenches/ac/xschem/` | Testbenches de caracterización AC de las celdas | según corresponda |
| `testbenches/tran/xschem/` | Testbenches transitorios (los que dieron la Tabla 2 del informe: Δt, T_RO, cuentas, error ~9%) | según corresponda |
| `testbenches/corners/xschem/` | Testbenches a corners (si los corrieron) | según corresponda |
| `timing/` | Notas de timing: retardos de propagación y tiempos de transición de la Tabla 1, frecuencia máxima de conteo | un `.md` o `.pdf` con esos datos |
| `layout/magic/`, `layout/lef/`, `layout/def/`, `model/spice/`, `model/verilog-A/`, `netlist/rcx/`, `testbenches/*/qucs-s/` | **Dejar vacías** — son para herramientas que este proyecto no usó (Magic, Verilog-A, qucs-s) | — |

---

## 3. Cómo subir los archivos (git)

Cada persona que va a subir su parte clona el repo, agrega sus archivos en la carpeta que corresponde, y hace push:

```bash
git clone git@github.com:paubrizzio/IHP__ADC8711.git
cd IHP__ADC8711

# copiar los archivos propios a la carpeta correspondiente de ADC8711-main/...

git add .
git commit -s -m "Add <bloque>: breve descripción de lo que se sube"
git push
```

Recomendación: un commit por bloque/entrega (ej: "Add GRO schematic + testbench AC"), no un solo commit gigante con todo junto — así si algo falla se puede rastrear qué archivo lo rompió.

---

## 4. Lo que NO hay que tocar

- **`doc/info.json`**: los campos generales (categoría, proceso, licencia, tamaño del sealring, etc.) los maneja quien está a cargo del repo. Si alguien necesita agregar un dato ahí, que lo pida en vez de editarlo directo, para evitar pisadas entre gente subiendo al mismo tiempo.
- **La estructura de carpetas**: no crear carpetas nuevas ni renombrar las existentes.
- **`release/v.1.0.0/`**: esta carpeta se llena recién al final, con el GDS y netlist definitivos ya congelados. No es donde va el trabajo en curso.

---

## 5. Checklist antes de cada push

- [ ] La celda top se llama `ADC8711` en el archivo que estoy subiendo (si es una vista top-level)
- [ ] El archivo está en la carpeta correcta de la tabla de la sección 2
- [ ] El nombre del archivo usa `ADC8711` si es una vista de nivel superior (GDS, netlist top, reportes DRC/LVS)
- [ ] No toqué `doc/info.json` ni la estructura de carpetas
- [ ] El mensaje de commit dice qué bloque/archivo se está agregando
