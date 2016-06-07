clc;clear;close all;
%Lowpass filter with hamming window, odd number of samples
fh = 550;fl = 250;fs = 2e3;f = 0:fs/2;w = 2*pi.*f;fc = (fh+fl)/2;Ts = 1/fs;Z = exp(1i.*w.*Ts);trans = 100;
L=round(5.5*(fs/trans));stAtten = 50;pbAtten = .3;Wl = 2*pi*fl;n = 0:L+1;hBP = zeros(1,length(n));Wh = 2*pi*fh;
for i=0:L+1
    hBP(i+1) = sin(Wh*Ts.*(i-(L/2)))/(pi.*(i-(L/2)))-sin(Wl*Ts.*(i-(L/2)))/(pi.*(i-(L/2))); %LP filter equation h(nt)
end
blackmann_win = 0.42+0.5*cos(2*pi.*n/L)+0.08*cos(4*pi.*n/L);
winFiltBlack = hBP.*blackmann_win;
summFreqHamm = zeros(1,length(Z));