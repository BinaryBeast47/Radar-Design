% Radar Range Equation Plot
clc; %clear the command window
clear;  %remove all the variables in the workspace
close all;  % close all the open figure window

% Taking Input from the user 
% 'input' is a builtin functon in matlab for user input
Pt = input('Enter Transmit Power Pt (Watts): ');
Gt = input('Enter Transmit Gain Gt (linear): ');
Gr = input('Enter Receive Gain Gr (linear): ');
sigma = input('Enter Radar Cross Section σ (m^2): ');
lambda = input('Enter Wavelength λ (m): ');

% Define range vector (e.g., 1 km to 100 km)
% creating a vector variable R
%linspace is a matlab function that generate linearly spaced vector for the plot function.
%linspace(start( start value ), end( End value), Number of points (how many points we need in between the start and end point))
R = linspace(1, 1000, 500);   % in meters

% Radar range equation
% Received power forumula
% put .* , ./ , .^  simple multiplication not matrix multiplication.
Pr = (Pt .* Gt .* Gr .* sigma .* lambda.^2) ./ ((4*pi)^3 .* (R.^4));


%fprintf --> print the output
%  %.2f --> 2 decibal values
fprintf("Maximum range=%.2f km\n",Pr/1000); 

% Convert to dB scale

Pr_dB = 10*log10(Pr);  % converting the linear scale to db scale for plotting the graph the received power is always calculated in dB

% Plot  --->the main function for 2D plot
figure; % A function that opens a graph window

 plot(R/1e3, Pr_dB,'b--o');    % plot (X axis , Y axis, Style)  
 %style 'b--o'
 % b --> blue, --  --> dashed line o --> circle marked 
 
grid on;    % enables grid line on the current axis  for better readability

% label() function to label y and x axis
xlabel('Range (km)');    
ylabel('Received Power (dB)');

%title() for the title
title('Radar Range Equation: Range vs Received Power');


