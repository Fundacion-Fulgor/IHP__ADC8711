from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt


# ============================================================
# CONFIGURATION
# ============================================================

SCRIPT_DIR = Path(__file__).resolve().parent

RAW_FILE = SCRIPT_DIR / "GRO_TDC_tb_final.raw"

# Optional time window in seconds
# Example:
# TMIN = 10e-9
# TMAX = 80e-9

TMIN = None
TMAX = None


# ============================================================
# MEASURE TIMES FOR TABLE / DECIMAL VALUES
# ============================================================
#
# Time is expressed in seconds.
#
# Examples:
#     75e-9  -> 75 ns
#     80e-9  -> 80 ns
#
# Use None to measure at the LAST simulation point.
#
# Each bus has its own independent measurement time.
# All bits belonging to that bus are sampled at the same time.
#

MEASURE_TIME_NET1  = None
MEASURE_TIME_NET2  = None
MEASURE_TIME_NET3  = None

MEASURE_TIME_D0    = 85e-9
MEASURE_TIME_D1    = 85e-9
MEASURE_TIME_D2    = 85e-9

MEASURE_TIME_S1    = 87e-9
MEASURE_TIME_S2    = 87e-9

MEASURE_TIME_ADDER = 87e-9


MEASURE_TIMES = {
    "XDUT.NET1": MEASURE_TIME_NET1,
    "XDUT.NET2": MEASURE_TIME_NET2,
    "XDUT.NET3": MEASURE_TIME_NET3,

    "XDUT.D0": MEASURE_TIME_D0,
    "XDUT.D1": MEASURE_TIME_D1,
    "XDUT.D2": MEASURE_TIME_D2,

    "XDUT.S1": MEASURE_TIME_S1,
    "XDUT.S2": MEASURE_TIME_S2,

    "XDUT.ADDER": MEASURE_TIME_ADDER,
}


# ============================================================
# BIT ORDER CONFIGURATION
# ============================================================
#
# False:
#   Normal interpretation:
#       bus[max_bit] = MSB
#       bus[0]       = LSB
#
#   Example for ADDER[7:0]:
#       ADDER[7] -> 2^7
#       ...
#       ADDER[0] -> 2^0
#
# True:
#   Reversed interpretation:
#       bus[0]       = MSB
#       bus[max_bit] = LSB
#
#   Example for ADDER[7:0]:
#       ADDER[0] -> 2^7
#       ...
#       ADDER[7] -> 2^0
#

INVERT_BIT_ORDER = True


# ============================================================
# SIGNAL GROUPS
# ============================================================

FIGURE_GROUPS = {

    # --------------------------------------------------------
    # FIGURE 1
    # --------------------------------------------------------
    "Figure 1 - Control GRO Buffers": {

        "Control": [
            "v(start)",
            "v(stop)",
            "v(reset)",
        ],

        "GRO": [
            "v(xdut.in0)",
            "v(xdut.in1)",
            "v(xdut.in2)",
        ],

        "Buffers": [
            "v(xdut.k0)",
            "v(xdut.k1)",
            "v(xdut.k2)",
        ],
    },

    # --------------------------------------------------------
    # FIGURE 2
    # --------------------------------------------------------
    "Figure 2 - DRV_STOP DECLK DECLK2": {

        "DRV_STOP / DECLK / DECLK2": [
            "v(xdut.drv_stop)",
            "v(xdut.declk)",
            "v(xdut.declk2)",
        ],
    },

    # --------------------------------------------------------
    # FIGURE 3
    # --------------------------------------------------------
    "Figure 3 - Counter Internal Nets": {

        "NET1": [
            "v(xdut.net1_0)",
            "v(xdut.net1_1)",
            "v(xdut.net1_2)",
            "v(xdut.net1_3)",
            "v(xdut.net1_4)",
            "v(xdut.net1_5)",
        ],

        "NET2": [
            "v(xdut.net2_0)",
            "v(xdut.net2_1)",
            "v(xdut.net2_2)",
            "v(xdut.net2_3)",
            "v(xdut.net2_4)",
            "v(xdut.net2_5)",
        ],

        "NET3": [
            "v(xdut.net3_0)",
            "v(xdut.net3_1)",
            "v(xdut.net3_2)",
            "v(xdut.net3_3)",
            "v(xdut.net3_4)",
            "v(xdut.net3_5)",
        ],
    },

    # --------------------------------------------------------
    # FIGURE 4
    # --------------------------------------------------------
    "Figure 4 - D0 D1 D2": {

        "D0[5:0]": [
            "v(xdut.d0[0])",
            "v(xdut.d0[1])",
            "v(xdut.d0[2])",
            "v(xdut.d0[3])",
            "v(xdut.d0[4])",
            "v(xdut.d0[5])",
        ],

        "D1[5:0]": [
            "v(xdut.d1[0])",
            "v(xdut.d1[1])",
            "v(xdut.d1[2])",
            "v(xdut.d1[3])",
            "v(xdut.d1[4])",
            "v(xdut.d1[5])",
        ],

        "D2[5:0]": [
            "v(xdut.d2[0])",
            "v(xdut.d2[1])",
            "v(xdut.d2[2])",
            "v(xdut.d2[3])",
            "v(xdut.d2[4])",
            "v(xdut.d2[5])",
        ],
    },

    # --------------------------------------------------------
    # FIGURE 5
    # --------------------------------------------------------
    "Figure 5 - S1 S2": {

        "S1[5:0]": [
            "v(xdut.s1[0])",
            "v(xdut.s1[1])",
            "v(xdut.s1[2])",
            "v(xdut.s1[3])",
            "v(xdut.s1[4])",
            "v(xdut.s1[5])",
            "v(xdut.cout1)",
        ],

        "S2[6:0]": [
            "v(xdut.s2[0])",
            "v(xdut.s2[1])",
            "v(xdut.s2[2])",
            "v(xdut.s2[3])",
            "v(xdut.s2[4])",
            "v(xdut.s2[5])",
            "v(xdut.s2[6])",
            "v(xdut.cout2)",
        ],
    },

    # --------------------------------------------------------
    # FIGURE 6
    # --------------------------------------------------------
    "Figure 6 - ADDER / OUT": {

        "ADDER[7:0]": [
            "v(xdut.adder[0])",
            "v(xdut.adder[1])",
            "v(xdut.adder[2])",
            "v(xdut.adder[3])",
            "v(xdut.adder[4])",
            "v(xdut.adder[5])",
            "v(xdut.adder[6])",
            "v(xdut.adder[7])",
        ],

        "OUT": [
            "v(out)",
        ],
    },
}

# ============================================================
# RAW HEADER READER
# ============================================================

def read_raw_header(filename):

    header_lines = []

    with open(filename, "rb") as f:

        while True:

            line = f.readline()

            if not line:
                raise RuntimeError(
                    "Unexpected end of file while reading RAW header."
                )

            decoded = line.decode(
                "latin-1",
                errors="ignore"
            ).strip()

            header_lines.append(decoded)

            if decoded.lower() == "binary:":
                return header_lines, "binary", f.tell()

            if decoded.lower() == "values:":
                return header_lines, "ascii", f.tell()


# ============================================================
# HEADER PARSER
# ============================================================

def parse_header(header_lines):

    num_variables = None
    num_points = None
    flags = ""
    variable_names = []

    reading_variables = False

    for line in header_lines:

        lower = line.lower()

        if lower.startswith("no. variables:"):

            num_variables = int(
                line.split(":", 1)[1].strip()
            )

        elif lower.startswith("no. points:"):

            num_points = int(
                line.split(":", 1)[1].strip()
            )

        elif lower.startswith("flags:"):

            flags = line.split(
                ":", 1
            )[1].strip().lower()

        elif lower == "variables:":

            reading_variables = True
            continue

        elif lower in ("binary:", "values:"):

            reading_variables = False

        elif reading_variables:

            parts = line.split()

            if len(parts) >= 3:
                variable_names.append(parts[1])

    if num_variables is None:
        raise RuntimeError(
            "Could not determine number of variables."
        )

    if num_points is None:
        raise RuntimeError(
            "Could not determine number of points."
        )

    if len(variable_names) != num_variables:

        print(
            f"WARNING: RAW header says {num_variables} variables "
            f"but {len(variable_names)} variable names were found."
        )

    return (
        num_variables,
        num_points,
        flags,
        variable_names,
    )


# ============================================================
# BINARY RAW READER
# ============================================================

def read_ngspice_binary(
    filename,
    data_offset,
    num_variables,
    num_points,
    flags,
    variable_names,
):

    if "complex" in flags:
        raise RuntimeError(
            "Complex RAW files are not supported "
            "by this transient reader."
        )

    fast_access = "fastaccess" in flags

    total_values = num_variables * num_points

    with open(filename, "rb") as f:

        f.seek(data_offset)

        raw_data = np.fromfile(
            f,
            dtype=np.float64,
            count=total_values,
        )

    print()
    print("Binary values expected :", total_values)
    print("Binary values read     :", len(raw_data))

    if len(raw_data) != total_values:

        raise RuntimeError(
            "\nBinary RAW size does not match the expected "
            "number of values.\n"
            f"Expected: {total_values}\n"
            f"Read:     {len(raw_data)}"
        )

    if fast_access:

        data_matrix = raw_data.reshape(
            num_variables,
            num_points
        ).T

    else:

        data_matrix = raw_data.reshape(
            num_points,
            num_variables
        )

    data = {}

    for index, name in enumerate(variable_names):

        data[name.lower()] = data_matrix[:, index]

    return data


# ============================================================
# ASCII RAW READER
# ============================================================

def read_ngspice_ascii(
    filename,
    data_offset,
    num_variables,
    num_points,
    variable_names,
):

    values = []

    with open(
        filename,
        "r",
        encoding="latin-1",
        errors="ignore",
    ) as f:

        f.seek(data_offset)

        for line in f:

            parts = line.split()

            if not parts:
                continue

            try:

                value = float(parts[-1])
                values.append(value)

            except ValueError:
                continue

    expected = num_variables * num_points

    if len(values) < expected:

        raise RuntimeError(
            f"Not enough ASCII values.\n"
            f"Expected: {expected}\n"
            f"Found:    {len(values)}"
        )

    values = np.asarray(
        values[:expected],
        dtype=float
    )

    matrix = values.reshape(
        num_points,
        num_variables
    )

    data = {}

    for index, name in enumerate(variable_names):

        data[name.lower()] = matrix[:, index]

    return data


# ============================================================
# GENERAL RAW READER
# ============================================================

def read_ngspice_raw(filename):

    (
        header,
        raw_format,
        data_offset,
    ) = read_raw_header(filename)

    (
        num_variables,
        num_points,
        flags,
        variable_names,
    ) = parse_header(header)

    print()
    print("=" * 70)
    print("NGSPICE RAW INFORMATION")
    print("=" * 70)

    print("RAW file      :", filename)
    print("Format        :", raw_format.upper())
    print("Variables     :", num_variables)
    print("Points        :", num_points)
    print("Flags         :", flags)
    print("Data offset   :", data_offset)

    if raw_format == "binary":

        data = read_ngspice_binary(
            filename,
            data_offset,
            num_variables,
            num_points,
            flags,
            variable_names,
        )

    else:

        data = read_ngspice_ascii(
            filename,
            data_offset,
            num_variables,
            num_points,
            variable_names,
        )

    return data, variable_names


# ============================================================
# PLOT FUNCTION
# ============================================================

def create_figure(
    figure_title,
    groups,
    data,
    time_ns,
    mask,
):

    valid_groups = []

    for group_name, signals in groups.items():

        valid_signals = []

        for signal in signals:

            signal_lower = signal.lower()

            if signal_lower in data:

                valid_signals.append(signal)

            else:

                print(
                    f"WARNING: signal not found: {signal}"
                )

        if valid_signals:

            valid_groups.append(
                (group_name, valid_signals)
            )

    if not valid_groups:

        print(
            f"Skipping '{figure_title}': "
            "no valid signals found."
        )

        return

    num_plots = len(valid_groups)

    fig, axes = plt.subplots(
        num_plots,
        1,
        figsize=(16, 3.5 * num_plots),
        sharex=True,
    )

    if num_plots == 1:
        axes = [axes]

    for ax, (group_name, signals) in zip(
        axes,
        valid_groups
    ):

        for signal in signals:

            signal_lower = signal.lower()

            ax.plot(
                time_ns[mask],
                data[signal_lower][mask],
                label=signal,
                linewidth=1.0,
            )

        ax.set_ylabel("Voltage [V]")

        ax.set_title(
            group_name,
            fontweight="bold",
        )

        ax.grid(True)

        ax.legend(
            loc="upper right",
            fontsize=8,
            ncol=2,
        )

    axes[-1].set_xlabel(
        "Time [ns]"
    )

    fig.suptitle(
        figure_title,
        fontsize=16,
        fontweight="bold",
    )

    plt.tight_layout(
        rect=[0, 0, 1, 0.96]
    )


# ============================================================
# MEASUREMENT-TIME HELPERS
# ============================================================

def get_measure_index(data, measure_time=None):
    """
    Return the RAW sample index used for a measurement.

    measure_time:
        None   -> last simulation point
        float  -> nearest available RAW time sample, in seconds

    Returns:
        index, actual_time_seconds
    """

    if "time" not in data:
        raise RuntimeError("The RAW file does not contain the time vector.")

    time = np.asarray(data["time"], dtype=float)

    if len(time) == 0:
        raise RuntimeError("The RAW time vector is empty.")

    if measure_time is None:
        index = len(time) - 1
    else:
        index = int(np.argmin(np.abs(time - float(measure_time))))

    return index, float(time[index])


def get_signal_value_at_time(data, signal, measure_time=None):
    """
    Read one signal at its requested measurement time.
    The nearest available simulation sample is used.
    """

    signal = signal.lower()

    if signal not in data:
        raise RuntimeError(f"Signal not found: {signal}")

    index, actual_time = get_measure_index(
        data,
        measure_time=measure_time,
    )

    return float(data[signal][index]), index, actual_time


def format_measure_time(measure_time, actual_time):
    """
    Human-readable requested/actual measurement time.
    """

    if measure_time is None:
        return f"LAST point ({actual_time * 1e9:.6f} ns)"

    return (
        f"requested {measure_time * 1e9:.6f} ns, "
        f"used {actual_time * 1e9:.6f} ns"
    )



# ============================================================
# PRINT FINAL BUS VALUES
# ============================================================

# ============================================================
# PRINT FINAL BUS VALUES
# ============================================================

def print_final_bus_values(data, measure_times=None):

    if measure_times is None:
        measure_times = {}

    bus_groups = {
        "XDUT.NET1": "v(xdut.net1_{})",
        "XDUT.NET2": "v(xdut.net2_{})",
        "XDUT.NET3": "v(xdut.net3_{})",

        "XDUT.D0": "v(xdut.d0[{}])",
        "XDUT.D1": "v(xdut.d1[{}])",
        "XDUT.D2": "v(xdut.d2[{}])",

        "XDUT.S1": "v(xdut.s1[{}])",
        "XDUT.S2": "v(xdut.s2[{}])",

        "XDUT.ADDER": "v(xdut.adder[{}])",
    }

    # Digital threshold
    VTH = 0.6

    # --------------------------------------------------------
    # LOGIC VALUES
    # --------------------------------------------------------

    indices_logic = list(range(7, -1, -1))

    print()
    print("=" * 125)
    print("BUS LOGIC VALUES AT CONFIGURED MEASURE TIMES")
    print("=" * 125)

    header = f"{'SIGNAL':<16}{'MEASURE TIME':<38}"

    for idx in indices_logic:
        header += f"{'[' + str(idx) + ']':>8}"

    print(header)
    print("-" * 125)

    for group_name, signal_template in bus_groups.items():

        measure_time = measure_times.get(group_name)

        _, actual_time = get_measure_index(
            data,
            measure_time=measure_time,
        )

        time_text = format_measure_time(
            measure_time,
            actual_time,
        )

        row = f"{group_name:<16}{time_text:<38}"

        for idx in indices_logic:

            signal = signal_template.format(idx).lower()

            if signal in data:

                voltage, _, _ = get_signal_value_at_time(
                    data,
                    signal,
                    measure_time=measure_time,
                )

                logic = 1 if voltage >= VTH else 0

                row += f"{logic:>8}"

            else:
                row += f"{'---':>8}"

        print(row)

    print("=" * 125)

    # --------------------------------------------------------
    # VOLTAGE VALUES
    # --------------------------------------------------------

    indices_voltage = list(range(7, -1, -1))

    print()
    print("=" * 145)
    print("BUS VOLTAGE VALUES AT CONFIGURED MEASURE TIMES")
    print("=" * 145)

    header = f"{'SIGNAL':<16}{'MEASURE TIME':<38}"

    for idx in indices_voltage:
        header += f"{'[' + str(idx) + ']':>11}"

    print(header)
    print("-" * 145)

    for group_name, signal_template in bus_groups.items():

        measure_time = measure_times.get(group_name)

        _, actual_time = get_measure_index(
            data,
            measure_time=measure_time,
        )

        time_text = format_measure_time(
            measure_time,
            actual_time,
        )

        row = f"{group_name:<16}{time_text:<38}"

        for idx in indices_voltage:

            signal = signal_template.format(idx).lower()

            if signal in data:

                value, _, _ = get_signal_value_at_time(
                    data,
                    signal,
                    measure_time=measure_time,
                )

                row += f"{value:11.6f}"

            else:
                row += f"{'---':>11}"

        print(row)

    print("=" * 145)



# ============================================================
# DIGITAL / OSCILLATION ANALYSIS
# ============================================================

def count_rising_edges(signal_values, vth=0.6):
    """
    Count complete oscillations using rising crossings of VTH.

    One rising threshold crossing is interpreted as one cycle.
    """

    values = np.asarray(signal_values)

    if len(values) < 2:
        return 0

    rising = (
        (values[:-1] < vth)
        &
        (values[1:] >= vth)
    )

    return int(np.count_nonzero(rising))


def percent_error(reference, measured):
    """
    Absolute percent error taking 'reference' as the nominal value.

        error [%] = |measured - reference| / |reference| * 100

    If both are zero, the error is 0 %.
    If reference is zero but measured is not zero, returns infinity.
    """

    if reference == 0:
        return 0.0 if measured == 0 else float("inf")

    return abs(measured - reference) / abs(reference) * 100.0


def print_in_k_oscillation_counts(data, vth=0.6):
    """
    Count oscillations of IN0/1/2 and K0/1/2 and compare each IN-K pair.
    """

    print()
    print("=" * 86)
    print("IN / K OSCILLATION COUNT")
    print(f"One oscillation = one rising crossing of VTH = {vth:.3f} V")
    print("=" * 86)

    header = (
        f"{'PAIR':<10}"
        f"{'IN COUNT':>14}"
        f"{'K COUNT':>14}"
        f"{'K-IN':>12}"
        f"{'ABS DIFF':>14}"
        f"{'ERROR [%]':>16}"
    )

    print(header)
    print("-" * 86)

    results = {}

    for idx in range(3):

        in_name = f"v(xdut.in{idx})"
        k_name = f"v(xdut.k{idx})"

        if in_name not in data:
            print(f"WARNING: signal not found: {in_name}")
            in_count = None
        else:
            in_count = count_rising_edges(data[in_name], vth=vth)

        if k_name not in data:
            print(f"WARNING: signal not found: {k_name}")
            k_count = None
        else:
            k_count = count_rising_edges(data[k_name], vth=vth)

        if in_count is None or k_count is None:

            print(
                f"IN{idx}-K{idx:<5}"
                f"{str(in_count):>14}"
                f"{str(k_count):>14}"
                f"{'---':>12}"
                f"{'---':>14}"
                f"{'---':>16}"
            )

            results[idx] = {
                "in_count": in_count,
                "k_count": k_count,
                "difference": None,
                "abs_difference": None,
                "error_percent": None,
            }

            continue

        difference = k_count - in_count
        abs_difference = abs(difference)
        error = percent_error(in_count, k_count)

        error_text = "INF" if np.isinf(error) else f"{error:.6f}"

        print(
            f"IN{idx}-K{idx:<5}"
            f"{in_count:>14d}"
            f"{k_count:>14d}"
            f"{difference:>12d}"
            f"{abs_difference:>14d}"
            f"{error_text:>16}"
        )

        results[idx] = {
            "in_count": in_count,
            "k_count": k_count,
            "difference": difference,
            "abs_difference": abs_difference,
            "error_percent": error,
        }

    print("=" * 86)

    return results


# ============================================================
# BUS / DECIMAL ANALYSIS
# ============================================================

def bus_to_decimal(
    data,
    signal_template,
    max_bit,
    vth=0.6,
    measure_time=None,
    invert_bit_order=False,
):
    """
    Read a digital bus at a requested time and return:
        decimal_value, binary_string, actual_time

    Normal mode (invert_bit_order=False):
        bus[max_bit] is MSB
        bus[0]       is LSB

    Reversed mode (invert_bit_order=True):
        bus[0]       is MSB
        bus[max_bit] is LSB

    measure_time:
        None  -> last simulation point
        float -> nearest available RAW sample, in seconds
    """

    decimal_value = 0

    _, actual_time = get_measure_index(
        data,
        measure_time=measure_time,
    )

    # --------------------------------------------------------
    # Decide which physical signal index is interpreted as
    # MSB -> LSB.
    # --------------------------------------------------------

    if invert_bit_order:
        bit_indices_msb_to_lsb = list(range(0, max_bit + 1))
    else:
        bit_indices_msb_to_lsb = list(range(max_bit, -1, -1))

    bits = []

    # position_from_msb = 0 means the first bit in the interpreted word.
    # Its binary weight is 2^max_bit.
    for position_from_msb, signal_idx in enumerate(bit_indices_msb_to_lsb):

        signal = signal_template.format(signal_idx).lower()

        if signal not in data:
            raise RuntimeError(
                f"Signal not found while rebuilding bus: {signal}"
            )

        voltage, _, _ = get_signal_value_at_time(
            data,
            signal,
            measure_time=measure_time,
        )

        logic = 1 if voltage >= vth else 0

        bits.append(str(logic))

        bit_weight = max_bit - position_from_msb

        if logic:
            decimal_value |= (1 << bit_weight)

    binary_string = "".join(bits)

    return decimal_value, binary_string, actual_time




def carry_bus_to_decimal(
    data,
    carry_signal,
    bus_signal_template,
    bus_max_bit,
    vth=0.6,
    measure_time=None,
    invert_bit_order=False,
):
    """
    Build a composite unsigned value from COUT and BUS.

    Normal interpretation (invert_bit_order=False):

        {COUT, BUS[bus_max_bit], ..., BUS[0]}

    Reversed interpretation (invert_bit_order=True):

        {BUS[0], BUS[1], ..., BUS[bus_max_bit], COUT}

    In other words, when bit order is reversed, the ENTIRE composite word
    is reversed, including the carry bit.

    Returns:
        decimal_value,
        binary_string,
        actual_time
    """

    bus_decimal, bus_binary, actual_time = bus_to_decimal(
        data,
        bus_signal_template,
        max_bit=bus_max_bit,
        vth=vth,
        measure_time=measure_time,
        invert_bit_order=invert_bit_order,
    )

    carry_voltage, _, _ = get_signal_value_at_time(
        data,
        carry_signal,
        measure_time=measure_time,
    )

    carry_logic = 1 if carry_voltage >= vth else 0

    if invert_bit_order:
        # Reversed composite:
        # BUS[0] ... BUS[max] COUT
        composite_decimal = (bus_decimal << 1) | carry_logic
        composite_binary = f"{bus_binary}{carry_logic}"
    else:
        # Normal composite:
        # COUT BUS[max] ... BUS[0]
        composite_decimal = (
            (carry_logic << (bus_max_bit + 1))
            | bus_decimal
        )
        composite_binary = f"{carry_logic}{bus_binary}"

    return composite_decimal, composite_binary, actual_time



def print_arithmetic_summary(data, vth=0.6, measure_times=None):
    """
    Verify the corrected arithmetic chain:

        D0 + D1 = {COUT1, S1[5:0]}

        {COUT1, S1[5:0]} + D2
            = {COUT2, S2[6:0]}

        {COUT2, S2[6:0]}
            = ADDER[7:0]

    With normal bit order, COUT1/COUT2 are the MSB of the composite word.

    With reversed bit order, the ENTIRE composite word is reversed, so
    COUT1/COUT2 become the LSB of the composite word.
    """

    if measure_times is None:
        measure_times = {}

    mt_d0 = measure_times.get("XDUT.D0")
    mt_d1 = measure_times.get("XDUT.D1")
    mt_d2 = measure_times.get("XDUT.D2")
    mt_s1 = measure_times.get("XDUT.S1")
    mt_s2 = measure_times.get("XDUT.S2")
    mt_adder = measure_times.get("XDUT.ADDER")

    # --------------------------------------------------------
    # Counter register outputs
    # --------------------------------------------------------

    d0_decimal, d0_binary, d0_time = bus_to_decimal(
        data,
        "v(xdut.d0[{}])",
        max_bit=5,
        vth=vth,
        measure_time=mt_d0,
        invert_bit_order=INVERT_BIT_ORDER,
    )

    d1_decimal, d1_binary, d1_time = bus_to_decimal(
        data,
        "v(xdut.d1[{}])",
        max_bit=5,
        vth=vth,
        measure_time=mt_d1,
        invert_bit_order=INVERT_BIT_ORDER,
    )

    d2_decimal, d2_binary, d2_time = bus_to_decimal(
        data,
        "v(xdut.d2[{}])",
        max_bit=5,
        vth=vth,
        measure_time=mt_d2,
        invert_bit_order=INVERT_BIT_ORDER,
    )

    # --------------------------------------------------------
    # First adder result:
    # {COUT1, S1[5:0]}  -> 7-bit value
    # --------------------------------------------------------

    s1_full_decimal, s1_full_binary, s1_time = carry_bus_to_decimal(
        data,
        carry_signal="v(xdut.cout1)",
        bus_signal_template="v(xdut.s1[{}])",
        bus_max_bit=5,
        vth=vth,
        measure_time=mt_s1,
        invert_bit_order=INVERT_BIT_ORDER,
    )

    # --------------------------------------------------------
    # Second adder result:
    # {COUT2, S2[6:0]} -> 8-bit value
    # --------------------------------------------------------

    s2_full_decimal, s2_full_binary, s2_time = carry_bus_to_decimal(
        data,
        carry_signal="v(xdut.cout2)",
        bus_signal_template="v(xdut.s2[{}])",
        bus_max_bit=6,
        vth=vth,
        measure_time=mt_s2,
        invert_bit_order=INVERT_BIT_ORDER,
    )

    # --------------------------------------------------------
    # Final registered ADDER[7:0]
    # --------------------------------------------------------

    adder_decimal, adder_binary, adder_time = bus_to_decimal(
        data,
        "v(xdut.adder[{}])",
        max_bit=7,
        vth=vth,
        measure_time=mt_adder,
        invert_bit_order=INVERT_BIT_ORDER,
    )

    # --------------------------------------------------------
    # Arithmetic checks
    # --------------------------------------------------------

    expected_s1_full = d0_decimal + d1_decimal
    expected_s2_full = s1_full_decimal + d2_decimal

    s1_difference = s1_full_decimal - expected_s1_full
    s2_difference = s2_full_decimal - expected_s2_full
    adder_difference = adder_decimal - s2_full_decimal

    s1_match = s1_full_decimal == expected_s1_full
    s2_match = s2_full_decimal == expected_s2_full
    adder_match = adder_decimal == s2_full_decimal

    print()
    print("=" * 126)
    print("ARITHMETIC CHAIN AT CONFIGURED MEASURE TIMES")
    print(f"Digital threshold VTH = {vth:.3f} V")
    print(
        "Expected chain: "
        "D0 + D1 = {COUT1,S1[5:0]} ; "
        "{COUT1,S1[5:0]} + D2 = {COUT2,S2[6:0]} ; "
        "{COUT2,S2[6:0]} = ADDER[7:0]"
    )
    print(
        "Bit order      : "
        + (
            "REVERSED inside indexed buses (index 0 = MSB of bus portion)"
            if INVERT_BIT_ORDER
            else "NORMAL inside indexed buses (highest index = MSB of bus portion)"
        )
    )
    print(
        "Composite rule : "
        + (
            "REVERSED -> {BUS reversed, COUT}"
            if INVERT_BIT_ORDER
            else "NORMAL -> {COUT, BUS}"
        )
    )
    print("=" * 126)

    print(
        f"{'BUS / COMPOSITE':<24}"
        f"{'BINARY':>18}"
        f"{'DECIMAL':>12}"
        f"{'MEASURE TIME':>62}"
    )
    print("-" * 126)

    rows = [
        ("D0[5:0]", d0_binary, d0_decimal, mt_d0, d0_time),
        ("D1[5:0]", d1_binary, d1_decimal, mt_d1, d1_time),
        ("D2[5:0]", d2_binary, d2_decimal, mt_d2, d2_time),
        ("{COUT1,S1[5:0]}", s1_full_binary, s1_full_decimal, mt_s1, s1_time),
        ("{COUT2,S2[6:0]}", s2_full_binary, s2_full_decimal, mt_s2, s2_time),
        ("ADDER[7:0]", adder_binary, adder_decimal, mt_adder, adder_time),
    ]

    for label, binary, decimal, requested_time, actual_time in rows:
        print(
            f"{label:<24}"
            f"{binary:>18}"
            f"{decimal:>12d}"
            f"{format_measure_time(requested_time, actual_time):>62}"
        )

    print("-" * 126)

    print(
        f"STAGE 1 : D0 + D1 = "
        f"{d0_decimal} + {d1_decimal} = {expected_s1_full}"
    )
    print(
        f"          {{COUT1,S1[5:0]}} = {s1_full_decimal}"
    )
    print(
        f"          RESULT = {'PASS' if s1_match else 'FAIL'}"
        f" ; difference = {s1_difference}"
    )

    print()

    print(
        f"STAGE 2 : {{COUT1,S1[5:0]}} + D2 = "
        f"{s1_full_decimal} + {d2_decimal} = {expected_s2_full}"
    )
    print(
        f"          {{COUT2,S2[6:0]}} = {s2_full_decimal}"
    )
    print(
        f"          RESULT = {'PASS' if s2_match else 'FAIL'}"
        f" ; difference = {s2_difference}"
    )

    print()

    print(
        f"FINAL   : {{COUT2,S2[6:0]}} = {s2_full_decimal}"
        f" ; ADDER[7:0] = {adder_decimal}"
    )
    print(
        f"          RESULT = {'PASS' if adder_match else 'FAIL'}"
        f" ; difference = {adder_difference}"
    )

    print("=" * 126)

    return {
        "d0_decimal": d0_decimal,
        "d1_decimal": d1_decimal,
        "d2_decimal": d2_decimal,

        "s1_full_decimal": s1_full_decimal,
        "s1_full_binary": s1_full_binary,

        "s2_full_decimal": s2_full_decimal,
        "s2_full_binary": s2_full_binary,

        "adder_decimal": adder_decimal,
        "adder_binary": adder_binary,

        "expected_s1_full": expected_s1_full,
        "expected_s2_full": expected_s2_full,

        "s1_difference": s1_difference,
        "s2_difference": s2_difference,
        "adder_difference": adder_difference,

        "s1_match": s1_match,
        "s2_match": s2_match,
        "adder_match": adder_match,
    }



# ============================================================
# COUNTER REGISTER DECIMAL SUMMARY
# ============================================================

def print_counter_register_decimal_summary(
    data,
    vth=0.6,
    measure_times=None,
):
    """
    Decode D0[5:0], D1[5:0] and D2[5:0] using an independent
    measurement time for each counter register.
    """

    if measure_times is None:
        measure_times = {}

    buses = [
        ("XDUT.D0", "D0[5:0]", "v(xdut.d0[{}])", 5),
        ("XDUT.D1", "D1[5:0]", "v(xdut.d1[{}])", 5),
        ("XDUT.D2", "D2[5:0]", "v(xdut.d2[{}])", 5),
    ]

    print()
    print("=" * 105)
    print("COUNTER REGISTER VALUES AT CONFIGURED MEASURE TIMES")
    print(f"Digital threshold VTH = {vth:.3f} V")
    print(
        "Bit order      : "
        + ("REVERSED (index 0 = MSB)" if INVERT_BIT_ORDER else "NORMAL (highest index = MSB)")
    )
    print("=" * 105)

    print(
        f"{'REGISTER':<14}"
        f"{'BINARY':>16}"
        f"{'DECIMAL':>12}"
        f"{'MEASURE TIME':>58}"
    )

    print("-" * 105)

    results = {}

    for measure_key, label, template, max_bit in buses:

        measure_time = measure_times.get(measure_key)

        try:
            decimal_value, binary_string, actual_time = bus_to_decimal(
                data,
                template,
                max_bit=max_bit,
                vth=vth,
                measure_time=measure_time,
                invert_bit_order=INVERT_BIT_ORDER,
            )

            print(
                f"{label:<14}"
                f"{binary_string:>16}"
                f"{decimal_value:>12d}"
                f"{format_measure_time(measure_time, actual_time):>58}"
            )

            results[label] = {
                "binary": binary_string,
                "decimal": decimal_value,
                "actual_time": actual_time,
            }

        except RuntimeError as exc:

            print(
                f"{label:<14}"
                f"{'---':>16}"
                f"{'---':>12}"
                f"{'---':>58}"
            )

            print(f"WARNING: {exc}")

            results[label] = {
                "binary": None,
                "decimal": None,
                "actual_time": None,
            }

    print("=" * 105)

    return results



# ============================================================
# DRV_STOP -> DECLK / DECLK2 DELAY ANALYSIS
# ============================================================

def find_threshold_edges(time, values, vth=0.6):
    """
    Find threshold crossings using linear interpolation.

    Returns a list of dictionaries sorted in chronological order:
        {"type": "RISE" or "FALL", "time": crossing_time_seconds}

    A rising edge is detected when the waveform goes from below VTH to
    equal/above VTH. A falling edge is detected in the opposite direction.
    """

    time = np.asarray(time, dtype=float)
    values = np.asarray(values, dtype=float)

    if len(time) != len(values):
        raise ValueError("time and values must have the same length")

    edges = []

    for i in range(len(values) - 1):
        v0 = values[i]
        v1 = values[i + 1]
        t0 = time[i]
        t1 = time[i + 1]

        edge_type = None

        if v0 < vth <= v1:
            edge_type = "RISE"
        elif v0 >= vth > v1:
            edge_type = "FALL"

        if edge_type is None:
            continue

        # Linear interpolation gives a better crossing estimate than using
        # only the discrete simulation sample time.
        dv = v1 - v0

        if dv == 0:
            tcross = t1
        else:
            fraction = (vth - v0) / dv
            tcross = t0 + fraction * (t1 - t0)

        edges.append({
            "type": edge_type,
            "time": float(tcross),
        })

    return edges


def match_propagation_edges(input_edges, output_edges, edge_type, max_delay=None):
    """
    Match each input edge to the first unused output edge of the same type
    occurring at or after the input edge.

    max_delay is in seconds. If None, there is no upper delay limit.
    """

    in_edges = [e for e in input_edges if e["type"] == edge_type]
    out_edges = [e for e in output_edges if e["type"] == edge_type]

    matches = []
    out_idx = 0

    for edge_number, in_edge in enumerate(in_edges, start=1):

        # Discard output edges that occurred before this input edge.
        while out_idx < len(out_edges) and out_edges[out_idx]["time"] < in_edge["time"]:
            out_idx += 1

        if out_idx >= len(out_edges):
            matches.append({
                "edge_number": edge_number,
                "edge_type": edge_type,
                "input_time": in_edge["time"],
                "output_time": None,
                "delay": None,
            })
            continue

        out_edge = out_edges[out_idx]
        delay = out_edge["time"] - in_edge["time"]

        if max_delay is not None and delay > max_delay:
            matches.append({
                "edge_number": edge_number,
                "edge_type": edge_type,
                "input_time": in_edge["time"],
                "output_time": None,
                "delay": None,
            })
            # Do not consume the output edge: it may belong to a later input.
            continue

        matches.append({
            "edge_number": edge_number,
            "edge_type": edge_type,
            "input_time": in_edge["time"],
            "output_time": out_edge["time"],
            "delay": delay,
        })

        out_idx += 1

    return matches


def analyze_delay_path(
    data,
    input_signal,
    output_signal,
    vth=0.6,
    max_delay=None,
):
    """
    Measure propagation delay for all rising and falling edges between an
    input waveform and one output waveform.
    """

    input_signal = input_signal.lower()
    output_signal = output_signal.lower()

    if "time" not in data:
        raise RuntimeError("The RAW file does not contain the time vector.")

    if input_signal not in data:
        print(f"WARNING: delay input signal not found: {input_signal}")
        return []

    if output_signal not in data:
        print(f"WARNING: delay output signal not found: {output_signal}")
        return []

    time = data["time"]

    input_edges = find_threshold_edges(
        time,
        data[input_signal],
        vth=vth,
    )

    output_edges = find_threshold_edges(
        time,
        data[output_signal],
        vth=vth,
    )

    rise_matches = match_propagation_edges(
        input_edges,
        output_edges,
        "RISE",
        max_delay=max_delay,
    )

    fall_matches = match_propagation_edges(
        input_edges,
        output_edges,
        "FALL",
        max_delay=max_delay,
    )

    # Put all input edges back in chronological order for the printed table.
    matches = rise_matches + fall_matches
    matches.sort(key=lambda x: x["input_time"])

    # Global chronological edge index, independent of rise/fall type.
    for i, row in enumerate(matches, start=1):
        row["global_edge_number"] = i

    return matches


def print_delay_table(
    data,
    input_signal="v(xdut.drv_stop)",
    output_signals=("v(xdut.declk)", "v(xdut.declk2)"),
    vth=0.6,
    max_delay=None,
):
    """
    Print one propagation-delay table per output.

    Delay is measured at VTH using linear interpolation:

        delay = t(output crossing) - t(DRV_STOP crossing)

    Rising input edges are paired with rising output edges and falling input
    edges with falling output edges.
    """

    all_results = {}

    print()
    print("=" * 104)
    print("DRV_STOP PROPAGATION DELAY ANALYSIS")
    print(f"Threshold VTH = {vth:.3f} V")

    if max_delay is None:
        print("Edge matching: first same-polarity output edge after each DRV_STOP edge")
    else:
        print(
            "Edge matching: first same-polarity output edge after each DRV_STOP edge "
            f"within {max_delay * 1e12:.3f} ps"
        )

    print("=" * 104)

    for output_signal in output_signals:

        results = analyze_delay_path(
            data,
            input_signal=input_signal,
            output_signal=output_signal,
            vth=vth,
            max_delay=max_delay,
        )

        all_results[output_signal] = results

        print()
        print(f"PATH: {input_signal} -> {output_signal}")
        print("-" * 104)
        print(
            f"{'EDGE':>6}"
            f"{'TYPE':>10}"
            f"{'DRV_STOP [ns]':>20}"
            f"{'OUTPUT [ns]':>20}"
            f"{'DELAY [ps]':>20}"
            f"{'STATUS':>14}"
        )
        print("-" * 104)

        if not results:
            print("No measurable edges found for this path.")
            continue

        valid_delays = []
        rise_delays = []
        fall_delays = []

        for row in results:
            edge_no = row["global_edge_number"]
            edge_type = row["edge_type"]
            tin_ns = row["input_time"] * 1e9

            if row["delay"] is None:
                tout_text = "---"
                delay_text = "---"
                status = "NO MATCH"
            else:
                tout_ns = row["output_time"] * 1e9
                delay_ps = row["delay"] * 1e12

                tout_text = f"{tout_ns:.6f}"
                delay_text = f"{delay_ps:.3f}"
                status = "OK"

                valid_delays.append(delay_ps)

                if edge_type == "RISE":
                    rise_delays.append(delay_ps)
                else:
                    fall_delays.append(delay_ps)

            print(
                f"{edge_no:>6d}"
                f"{edge_type:>10}"
                f"{tin_ns:>20.6f}"
                f"{tout_text:>20}"
                f"{delay_text:>20}"
                f"{status:>14}"
            )

        print("-" * 104)

        if valid_delays:
            print(
                f"ALL edges : count={len(valid_delays):4d}   "
                f"min={np.min(valid_delays):10.3f} ps   "
                f"mean={np.mean(valid_delays):10.3f} ps   "
                f"max={np.max(valid_delays):10.3f} ps"
            )

        if rise_delays:
            print(
                f"RISE      : count={len(rise_delays):4d}   "
                f"min={np.min(rise_delays):10.3f} ps   "
                f"mean={np.mean(rise_delays):10.3f} ps   "
                f"max={np.max(rise_delays):10.3f} ps"
            )

        if fall_delays:
            print(
                f"FALL      : count={len(fall_delays):4d}   "
                f"min={np.min(fall_delays):10.3f} ps   "
                f"mean={np.mean(fall_delays):10.3f} ps   "
                f"max={np.max(fall_delays):10.3f} ps"
            )

        print("=" * 104)

    return all_results



# ============================================================
# SAVE AVAILABLE SIGNALS TO TXT
# ============================================================

def save_available_signals_reports(
    available_signals,
    output_dir,
    all_filename="available_signals.txt",
    debug_filename="debug_signals.txt",
):
    """
    Save all RAW signals to a text file and also create a filtered debug file.

    The complete list is written to:
        available_signals.txt

    A reduced list useful for debugging hierarchy/names is written to:
        debug_signals.txt
    """

    output_dir = Path(output_dir)

    all_path = output_dir / all_filename
    debug_path = output_dir / debug_filename

    debug_keywords = [
        "drv",
        "stop",
        "declk",
        "c0",
        "c1",
        "c2",
        "net1",
        "net2",
        "net3",
        "d0",
        "d1",
        "d2",
        "s1",
        "s2",
        "adder",
        "out",
    ]

    # --------------------------------------------------------
    # Complete signal list
    # --------------------------------------------------------

    with open(all_path, "w", encoding="utf-8") as f:

        f.write("AVAILABLE SIGNALS\n")
        f.write("=" * 70 + "\n")
        f.write(f"Total signals: {len(available_signals)}\n")
        f.write("=" * 70 + "\n\n")

        for signal in available_signals:
            f.write(signal + "\n")

    # --------------------------------------------------------
    # Filtered debug list
    # --------------------------------------------------------

    filtered_signals = []

    for signal in available_signals:

        signal_lower = signal.lower()

        if any(
            keyword in signal_lower
            for keyword in debug_keywords
        ):
            filtered_signals.append(signal)

    with open(debug_path, "w", encoding="utf-8") as f:

        f.write("FILTERED DEBUG SIGNALS\n")
        f.write("=" * 70 + "\n")
        f.write(
            "Keywords: "
            + ", ".join(debug_keywords)
            + "\n"
        )
        f.write(
            f"Filtered signals: {len(filtered_signals)} / "
            f"{len(available_signals)}\n"
        )
        f.write("=" * 70 + "\n\n")

        for signal in filtered_signals:
            f.write(signal + "\n")

    print()
    print("=" * 70)
    print("RAW SIGNAL REPORTS")
    print("=" * 70)
    print(f"Total available signals : {len(available_signals)}")
    print(f"Complete list saved to  : {all_path}")
    print(f"Filtered debug saved to : {debug_path}")
    print("=" * 70)

    return all_path, debug_path



# ============================================================
# MAIN
# ============================================================

print()
print("=" * 70)
print("NGSPICE RAW PLOTTER")
print("=" * 70)

print()
print("Script directory:")
print(SCRIPT_DIR)

print()
print("RAW file:")
print(RAW_FILE)

print()
print("RAW files found:")

for f in SCRIPT_DIR.glob("*.raw"):
    print("  ", f.name)


# ============================================================
# CHECK FILE
# ============================================================

if not RAW_FILE.exists():

    raise FileNotFoundError(
        f"\nRAW file not found:\n{RAW_FILE}"
    )


# ============================================================
# READ RAW
# ============================================================

data, available_signals = read_ngspice_raw(
    RAW_FILE
)
print_final_bus_values(
    data,
    measure_times=MEASURE_TIMES,
)

# Digital threshold used for counters and bus decoding
VTH_DIGITAL = 0.6

# Optional maximum propagation delay used to avoid pairing an input edge
# with a much later, unrelated output edge. None disables the limit.
# Example: MAX_PROP_DELAY = 2e-9   # 2 ns
MAX_PROP_DELAY = None

# Count IN/K oscillations and compare each pair
print_in_k_oscillation_counts(
    data,
    vth=VTH_DIGITAL,
)

# Verify D0+D1->{COUT1,S1}, then +D2->{COUT2,S2}, then compare with ADDER
print_arithmetic_summary(
    data,
    vth=VTH_DIGITAL,
    measure_times=MEASURE_TIMES,
)

# Decode D0, D1 and D2 register outputs in binary and decimal
print_counter_register_decimal_summary(
    data,
    vth=VTH_DIGITAL,
    measure_times=MEASURE_TIMES,
)

# Measure propagation delay from DRV_STOP to DECLK and DECLK2, edge by edge.
print_delay_table(
    data,
    input_signal="v(xdut.drv_stop)",
    output_signals=("v(xdut.declk)", "v(xdut.declk2)"),
    vth=VTH_DIGITAL,
    max_delay=MAX_PROP_DELAY,
)

# ============================================================
# SAVE AVAILABLE SIGNALS TO TXT
# ============================================================

save_available_signals_reports(
    available_signals,
    SCRIPT_DIR,
)


# ============================================================
# TIME VECTOR
# ============================================================

if "time" not in data:

    raise RuntimeError(
        "The RAW file does not contain a 'time' vector."
    )

time = data["time"]

time_ns = time * 1e9


# ============================================================
# TIME WINDOW
# ============================================================

mask = np.ones(
    len(time),
    dtype=bool
)

if TMIN is not None:

    mask &= time >= TMIN

if TMAX is not None:

    mask &= time <= TMAX


# ============================================================
# CREATE FIGURES
# ============================================================

for figure_title, groups in FIGURE_GROUPS.items():

    create_figure(
        figure_title,
        groups,
        data,
        time_ns,
        mask,
    )


# ============================================================
# SHOW ALL FIGURES
# ============================================================

plt.show()