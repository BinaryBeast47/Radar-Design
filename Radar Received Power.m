% Radar Range Equation Plot
clc; clear; close all;

% User inputs
Pt = input('Enter Transmit Power Pt (Watts): ');
Gt = input('Enter Transmit Gain Gt (linear): ');
Gr = input('Enter Receive Gain Gr (linear): ');
sigma = input('Enter Radar Cross Section σ (m^2): ');
lambda = input('Enter Wavelength λ (m): ');

% Define range vector (e.g., 1 km to 100 km)


R = linspace(1, 1000, 500);   % in meters

% Radar range equation
Pr = (Pt .* Gt .* Gr .* sigma .* lambda.^2) ./ ((4*pi)^3 .* (R.^4));

%fprintf("Maximum range=%.2f km\n",Pr/1000);

% Convert to dB scale

Pr_dB = 10*log10(Pr);

% Plot
figure;
 plot(R/1e3, Pr_dB,'b--o');
grid on;
xlabel('Range (km)');
ylabel('Received Power (dB)');
title('Radar Range Equation: Range vs Received Power');
