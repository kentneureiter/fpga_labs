
# ECE 128 FPGA Labs (Fall 2026)

Verilog designs, testbenches, and constraint files for the ECE 128 lab sequence at Lehigh University. Each lab was simulated in Vivado and implemented on a Digilent Basys3 board.

**Authors:** Kent and Shiv
**Board:** Digilent Basys3 (Artix-7 XC7A35T, `xc7a35tcpg236-1`)
**Tools:** Xilinx Vivado

## Labs

| Lab | Topic | Key Concepts |
|-----|-------|--------------|
| [Lab 1](https://github.com/kentneureiter/fpga-lab2/tree/main) | 8-to-1 Multiplexer | Structural, dataflow, and behavioral modeling |
| [Lab 2](https://github.com/kentneureiter/lab2-adders-and-CLAA-fpga-lab) | Ripple Carry and Carry Look-Ahead Adders | Full adders, carry propagation, area comparison |
| [Lab 3](./lab3) | 4-Bit Adder with Seven-Segment Display | Module hierarchy, BCD to seven-segment decoding |
| [Lab 4](./lab4) | Vehicle Safety Interlock and Warning System | Combinational logic with many inputs and outputs |
| [Lab 5](./lab5) | Latches, Flip-Flops, Counters, Clock Divider | Sequential logic, synchronous vs. asynchronous reset |
| [Lab 6](./lab6) | Switch Debouncer and Sequence Detectors | Moore and Mealy finite state machines |
| [Lab 7](./lab7) | 4-Digit Seven-Segment Up Counter (0–4095) | Display multiplexing, binary to BCD, clock division |

Labs 1 and 2 are in separate repositories, linked above.

## Repository Structure

Each lab folder contains:
- Verilog design files (`.v`)
- Testbenches (`*_tb.v`)
- Constraint file (`.xdc`) for labs implemented on the board
- A `README.md` with lab-specific simulation and implementation instructions

## General Usage

1. Create a new RTL project in Vivado targeting `xc7a35tcpg236-1`.
2. Add the lab's design files as design sources, testbenches as simulation sources, and the `.xdc` file as a constraints source.
3. **Simulate:** set the desired testbench as top under Simulation Sources, then run **Run Behavioral Simulation**.
4. **Implement:** set the top module under Design Sources, then run **Synthesis**, **Implementation**, and **Generate Bitstream**.
5. **Program:** open **Hardware Manager**, click **Open Target → Auto Connect**, then **Program Device**.

See each lab's README for its top module, pin assignments, and expected behavior.
