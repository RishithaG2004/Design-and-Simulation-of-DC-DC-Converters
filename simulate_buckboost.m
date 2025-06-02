% simulate_buckboost.m
% Simulates Buck-Boost Converter using BuckBoost_Model.slx
clear; clc;

%% Parameters
Vin = 12;           % Input voltage in volts
Vout_ref = 7;       % Desired output voltage (between 3V–15V)
Rload = 15;         % Load resistance in ohms
L = 150e-6;         % Inductance
C = 100e-6;         % Capacitance
f_switch = 50e3;    % Switching frequency
sim_time = 0.01;    % Simulation time

%% Set duty cycle (basic case, fixed)
D = Vout_ref / (Vout_ref + Vin);  % D = Vout / (Vout + Vin)

%% Load and run Simulink model
load_system('BuckBoost_Model');
set_param('BuckBoost_Model', 'StopTime', num2str(sim_time));

% Pass parameters to Simulink workspace
assignin('base', 'Vin', Vin);
assignin('base', 'Rload', Rload);
assignin('base', 'L', L);
assignin('base', 'C', C);
assignin('base', 'D', D);
assignin('base', 'f_switch', f_switch);

% Simulate
simOut = sim('BuckBoost_Model');

%% Plot Results
Vout = simOut.logsout.getElement('Vout').Values;
figure;
plot(Vout.Time, Vout.Data);
title('Output Voltage - Buck-Boost Converter');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
