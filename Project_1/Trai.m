clc;	% Clear command window.
% workspace;	% Make sure the workspace panel is showing.
% fontSize = 15;
% Define some parameters that define the triangle wave.
elementsPerHalfPeriod = 4e+4; % Number of elements in each rising or falling section.
amplitude = 1; % Peak-to-peak amplitude.
verticalOffset = 2; % Also acts as a phase shift.
numberOfPeriods = 4; % How many replicates of the triangle you want.
% Construct one cycle, up and down.
%risingSignal = linspace(0, amplitude, elementsPerHalfPeriod);
%fallingSignal = linspace(amplitude, 0, elementsPerHalfPeriod);
fallingSignal = linspace(0, amplitude, elementsPerHalfPeriod);
risingSignal = linspace(amplitude, 0, elementsPerHalfPeriod);
% Combine rising and falling sections into one single triangle.
oneCycle = [risingSignal, fallingSignal(2:end-1)] + verticalOffset;
x = 0 : length(oneCycle)-1;
% Now plot the triangle.
subplot(2, 1, 1);
plot(x, oneCycle);
grid on;

% Now replicate this cycle several (numberOfPeriods) times.
waveform = repmat(oneCycle, [1 numberOfPeriods]);
x = 0 : length(waveform)-1;
% Now plot the triangle wave.
subplot(2, 1, 2);
plot(x, waveform);
grid on;
