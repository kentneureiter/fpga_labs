# ECE 128 Lab 7: 4-Digit Seven-Segment Up Counter

**Authors:** Kent and Shiv
**Board:** Digilent Basys3 (Artix-7 XC7A35T)
**Tools:** Xilinx Vivado

## Project Description

A 12-bit up counter that counts from 0 to 4095 at 1 Hz and displays the value in decimal on the Basys3's four-digit seven-segment display. The counter value is converted to BCD with a double-dabble converter, and a display driver refreshes the four digits at about 95 Hz using an anode shift register and a 4:1 mux.

```
clk (100 MHz) -> clk divider (1 Hz) -> counter (0-4095) -> bin2bcd -> anode_gen (refresh + 4:1 mux) -> BCD decoder -> seg / an
```

## Files

| File | Description |
|------|-------------|
| `top.v` | Top module connecting all components |
| `clk.v` | Clock divider, 100 MHz to 1 Hz |
| `counter.v` | 12-bit up counter, wraps from 4095 to 0 |
| `bin2bcd.v` | 12-bit binary to 16-bit BCD converter (double dabble) |
| `anode_gen.v` | Anode refresh shift register and 4:1 digit mux |
| `BCD.v` | BCD to seven-segment decoder (active-low) |
| `top_tb.v` | Testbench for the top module |
| `bin2bcd_tb.v` | Testbench for the BCD converter |
| `anode_gen_tb.v` | Testbench for the display driver |
| `Basys-3-Master.xdc` | Pin constraints |

## Simulation

1. Create a new RTL project in Vivado targeting `xc7a35tcpg236-1`.
2. Add all design files as design sources and the `_tb.v` files as simulation sources.
3. In the Sources panel under Simulation Sources, right-click the testbench you want to run and select **Set as Top**.
4. Click **Run Simulation → Run Behavioral Simulation**.

`top_tb.v` overrides `SLOW_MAX` and `REFRESH_MAX` so the counter and display refresh run fast enough to see in simulation. The board build uses the real 1 Hz and ~95 Hz values. Set the radix of `bcd` signals to hexadecimal so each digit reads correctly.

## FPGA Implementation

1. Add `Basys-3-Master.xdc` as a constraints source.
2. Set `top.v` as the top module under Design Sources.
3. Run **Synthesis**, **Implementation**, then **Generate Bitstream**.
4. Connect the Basys3 over USB, open **Hardware Manager**, click **Open Target → Auto Connect**, then **Program Device**.
5. The display counts up once per second. Press the reset button to return to 0000.

## Pin Assignments

| Signal | Pin | Board Component |
|--------|-----|-----------------|
| `clk` | W5 | 100 MHz oscillator |
| `rst` | U18 | Center button (btnC) |
| `seg[0]`–`seg[6]` | W7, W6, U8, V8, U5, V5, U7 | Segments A–G |
| `dp` | V7 | Decimal point |
| `an[0]`–`an[3]` | U2, U4, V4, W4 | Digit anodes (right to left) |
