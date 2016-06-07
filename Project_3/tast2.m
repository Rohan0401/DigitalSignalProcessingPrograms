clear;
close all;
clc;
% Task 2 specifications
fs=2000;
fh=550;
fl=250;
trans = 100;
L=round(5.5*(fs/trans));
ts=1/fs;
n=-1*L/2:L/2;
bandpass = zeros(1,size(n,2)); hn = zeros(1,size(n,2));fileID = fopen('task2.txt','w');
for i = 1:size(n,2)
    if (n(i) ~= 0)
        bandpass(i) = sinc(2*fh*ts.*n(i))*2*fh*ts-sinc(2*fl*ts.*n(i))*2*fl*ts;% Band Pass filter for given frequency ranges
        blackman_win(i) = 0.42+0.5*cos(2*pi.*n(i)/L)+0.08*cos(4*pi.*n(i)/L);% BlackMann Window
        hn(i) = bandpass(i) * blackman_win(i);% Signal Extraction filter
        fprintf(fileID,'The coefficent of h(%d) = %f \n',(i-1),hn(i));
    end
end
fclose(fileID);
% Plot for the spectrum of the bandpass filter
for i=1:1000
    w(i)=pi*fs*i/1000; % Convoling into time doamin to frequency
    z=exp(1i*w(i)*ts);% Converting in Z transformation
    hf(i)=z^(-1*L/2)*sum(hn.*z.^(-n)); % Shift signal for convolution
end
figure;
plot(w/(2*pi),abs(hf));
xlabel('frequency (Hz)');
ylabel('|H(w)|');
title('Magnitude Spectrum');
grid on;
figure;

plot(w/(2*pi),angle(hf));
xlabel('frequency (Hz)');
ylabel('AngleH(w)');
title('Phase Plot');
grid on;