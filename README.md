# DC-DC Converters Simulation using MATLAB/Simulink
## Project Overview
This project involves the **design, simulation, and performance analysis** of three key types of DC-DC converters:
- Buck Converter (Step-Down)
- Boost Converter (Step-Up)
- Buck-Boost Converter (Inverting/Non-inverting)
The objective was to simulate these converters using **MATLAB/Simulink** and evaluate:
- Voltage regulation under varying loads
- Converter efficiency
- Output ripple
- Transient response
- Behavior in CCM and DCM
## Tools & Tech Stack
- MATLAB/Simulink (R2023 or later)
- Simscape Electrical Toolbox
- PWM control via closed-loop duty cycle modulation
- Time-domain analysis
## Converters Designed
| Type        | Input Voltage | Output Voltage        |
|-------------|---------------|------------------------|
| Buck        | 12V           | 5V                     |
| Boost       | 5V            | 12V                    |
| Buck-Boost  | 12V           | 3V – 15V (variable)    |
Each converter was modeled using:
- Power MOSFET
- Diode
- Inductor
- Capacitor
- Voltage source
- PWM generator (controlled duty cycle)
## Performance Evaluation
Performance metrics include:
- Output Voltage Ripple
- Transient Response
- Conversion Efficiency
- Mode analysis: CCM vs. DCM
