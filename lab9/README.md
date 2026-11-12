# Lab 9 – RAM and ROM Design

ECE 128 FPGA Laboratory, Lehigh University (Fall 2026) · Shiven and Kent

## Project Description

This lab implements two memory modules in Verilog:

- **RAM** – 8 locations × 8-bit data, synchronous write (`we`) and asynchronous read. The testbench writes A0–A7 to all eight addresses, reads them back, and saves the contents to `ram_dump.txt` with `$writememb`.
- **ROM** – 8 locations × 4-bit data, loaded from `rom_data.mem` with `$readmemb`. Reads are synchronous and gated by a read enable (`re`).

## Files

| File | Description |
|---|---|
| `RAM.v` | 8×8 RAM design |
| `ram_tb.v` | RAM testbench (write/read all 8 locations, dump to `ram_dump.txt`) |
| `ROM.v` | 8×4 ROM design |
| `rom_tb.v` | ROM testbench (read all 8 locations, test `re`) |
| `rom_data.mem` | ROM contents, one 4-bit binary value per line |

## Simulation (Vivado)

1. Create a new RTL project and add `RAM.v` and `ROM.v` as design sources.
2. Add `ram_tb.v`, `rom_tb.v`, and `rom_data.mem` as simulation sources.
3. Set `ram_tb` or `rom_tb` as the simulation top (right-click → Set as Top).
4. Run **Simulation → Run Behavioral Simulation**. Set the radix to hexadecimal to read the data values.
5. After the RAM simulation, `ram_dump.txt` is written to `<project>.sim/sim_1/behav/xsim/`.

## Synthesis and Implementation

1. Set `RAM` or `ROM` as the design top.
2. Run **Synthesis**, then **Implementation**.
3. View resource usage under **Report Utilization** and power under **Report Power**.
