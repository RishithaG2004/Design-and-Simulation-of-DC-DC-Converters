% simulate_buck.m
% Simulates Buck Converter using Buck_Model.slx
clear; clc;

%% Parameters
Vin = 12;           % Input voltage in volts
Vout_ref = 5;       % Desired output voltage
Rload = 10;         % Load resistance in ohms
L = 100e-6;         % Inductance
C = 100e-6;         % Capacitance
f_switch = 50e3;    % Switching frequency
sim_time = 0.01;    % Simulation time

%% Set duty cycle (basic case, fixed)
D = Vout_ref / Vin;

%% Load and run Simulink model
load_system('Buck_Model');
set_param('Buck_Model', 'StopTime', num2str(sim_time));

% Pass parameters to Simulink workspace
assignin('base', 'Vin', Vin);
assignin('base', 'Rload', Rload);
assignin('base', 'L', L);
assignin('base', 'C', C);
assignin('base', 'D', D);
assignin('base', 'f_switch', f_switch);

% Simulate
simOut = sim('Buck_Model');

%% Plot Results
Vout = simOut.logsout.getElement('Vout').Values;
figure;
plot(Vout.Time, Vout.Data);
title('Output Voltage - Buck Converter');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
