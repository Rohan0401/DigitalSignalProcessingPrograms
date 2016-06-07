clear;
close all;
clc;
% Task 3 specifications
%%%____________________Initialization of parameters________________
fs=10/(2*pi); 
alpha=3;
L=40;
ts=1/fs;
n1=-L/2:-1;
b1=alpha.*(1-(2.*n1./L).^2).^0.5;
n2=1:L/2;
b2=alpha.*(1-(2.*n2./L).^2).^0.5;
%%%__________________Defining Hilbert Transformation_______
for i = 1:size(n1,2)
hiln1(i) = (1-cos(n1(i)*pi))./(n1(i)*pi); % Define Hilbert function for half length Window
kaiser_win1 = besseli(0,b1)./besseli(0,alpha);% Define Kasier Window for Zeroth order Bessel Function
hn1(i) = hiln1(i) * kaiser_win1(i);% Multiplying the window with transformation
end
for i = 1:size(n2,2)
hiln2(i) = (1-cos(n2(i)*pi))./(n2(i)*pi);
kaiser_win2 = besseli(0,b2)./besseli(0,alpha);
hn2(i) = hiln2(i) * kaiser_win2(i);
end
% Plot of the spectrum for Hilbert transformer

for i=1:1000
w(i)=pi*fs*i/1000;% Convolving to the frequency domain transformation 
z=exp(1i*w(i)*ts);
hf(i)=z^(-1*L/2)*(sum(hn1.*z.^(-n1))+sum(hn2.*z.^(-n2))); % Joining the two half of the Window
end
figure;
%%%---------------Magintude Plot-----------------------------------%%%%%%%
plot(w,abs(hf));
xlabel('frequency(Hz)');
ylabel('|H(w)|');
grid on;
title('Magnitude Spectrum of Hilbert Transformer Using Kaiser Windowing');
%%%%--------------------Phase Plot------------------------------%%%%---
figure;
plot(w,angle(hf));
xlabel('frequency(Hz)');
ylabel('Phase ofH(w)');
title('Phase Spectrum');
grid on;