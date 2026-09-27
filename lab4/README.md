# Vehicle Warning Signals

This lab implements combinational logic for a vehicle warning system. The `vehicle` module uses vehicle and sensor inputs to determine whether starting is permitted and when to activate the chime and warning signals.

Warnings cover seat belt, door, hood, trunk, battery, airbag, and temperature conditions. Two priority warning outputs indicate higher-level warning conditions.

## Files

- `design` — Verilog implementation of the vehicle logic.
- `tb` — testbench that exercises representative input conditions.
- `basys` — Basys 3 constraints mapping switches to inputs and LEDs to outputs.

The design can be simulated with the testbench or implemented on a Basys 3 board using the provided constraints.