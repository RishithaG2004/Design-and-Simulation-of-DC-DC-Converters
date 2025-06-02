% simulate_boost.m
% Simulates Boost Converter using Boost_Model.slx
clear; clc;

%% Parameters
Vin = 5;           % Input voltage in volts
Vout_ref = 12;     % Desired output voltage
Rload = 20;        % Load resistance in ohms
L = 220e-6;        % Inductance
C = 100e-6;        % Capacitance
f_switch = 50e3;   % Switching frequency
sim_time = 0.01;   % Simulation time

%% Set duty cycle (basic case, fixed)
D = 1 - (Vin / Vout_ref);

%% Load and run Simulink model
load_system('Boost_Model');
set_param('Boost_Model', 'StopTime', num2str(sim_time));

% Pass parameters to Simulink workspace
assignin('base', 'Vin', Vin);
assignin('base', 'Rload', Rload);
assignin('base', 'L', L);
assignin('base', 'C', C);
assignin('base', 'D', D);
assignin('base', 'f_switch', f_switch);

% Simulate
simOut = sim('Boost_Model');

%% Plot Results
Vout = simOut.logsout.getElement('Vout').Values;
figure;
plot(Vout.Time, Vout.Data);
title('Output Voltage - Boost Converter');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
