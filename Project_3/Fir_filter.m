% Project 3 
%Name : Rohan Singh Rajput
%Class : Spring 2016
%Course : Digital Signal Processing Application
clc;clear; close all;


% Task 1 specifications

fs=48000;
f1=9200;
fp=5200;
L=round(3.3*(fs/(f1-fp)));
ts=1/fs;
fc=(f1+fp)/2;
n=-1*L/2:L/2;

%%%________Design Filter Design________________%%%%%
lowpas_filter = zeros(1,size(n,2));
hamming_win = zeros(1,size(n,2));
hn = zeros(1,size(n,2));fileID = fopen('task1.txt','w');
for i = 1:size(n,2)
if (n(i)~=0)
 lowpas_filter(i) = (sinc(2*fc*ts.*n(i)))*2*fc*ts; %%Low pass filter
 hamming_win(i) = 0.54+0.46*cos(2*pi.*n(i)/L);%% Hamming Window
 hn(i) = lowpas_filter(i) * hamming_win(i);%% Window Multiplication
 fprintf(fileID,'The coefficent of h(%d) = %f \n',(i-1),hn(i));
end
end
fclose(fileID);
% Plot of the spectrum for the LPF filter
w = zeros(1,1000);hf = zeros(1,1000);
for i=1:1000
w(i)=pi*fs*i/1000; %% Convolving in frequecy domain
z=exp(1i*w(i)*ts);% Taking Z trasnform 
hf(i)=z^(-1*L/2)*sum(hn.*z.^(-n));% Shift the Signal to make it Causal 
end

%%%____________________Plots_____________________________________

figure;

plot(w/(2*pi),abs(hf));
xlabel('f(Hz)');
ylabel('|H(w)|');
title('Magnitude Spectrum');
grid on;
%%%%-------------------------Phase Plot--------------------------------
figure;
plot(w/(2*pi),angle(hf));
ylabel('Angle(H(w))')
xlabel('f(Hz)');
title('Phase Spectrum');
grid on;

%%--------------------------------------End of Code-------------------%%%%%























































































































































































































































































































































































































































































































