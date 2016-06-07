clear;clc;close all;
% Task 4- To obtain the Fourier series coefficients
k=1:10;
% Task 4a- Exact
fsc_xact=-(1-cos(pi.*k))./(pi.*k).^2;
figure;
stem(fsc_xact);
title('Exact Harmonics');
xlabel('K--->');
ylabel('magnitude');
grid on;
% Task 4b - Using 64 point FFT
n=0:63;
fsc64=1-abs(1-n./32);
Fsc64=fft(fsc64)/64;
figure;
stem(n,(Fsc64));
title('64 point FFT');
xlabel('K--->');
ylabel('magnitude');
grid on;
% Task 4c - Using 256 point FFT
n=0:255;
fsc256=1-abs(1-n./128);
Fsc256=fft(fsc256)/256;
figure;
stem(n,(Fsc256));
title('256 point FFT');
xlabel('l--->');
ylabel('magnitude');
grid on;