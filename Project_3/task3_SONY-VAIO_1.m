clear;
close all;
clc;
% Task 3 specifications
fs=10/(2*pi);
a=3;
L=10;
ts=1/fs;
n1=-L/2:-1;
b1=a.*(1-(2.*n1./L).^2).^0.5;
n2=1:L/2;
b2=a.*(1-(2.*n2./L).^2).^0.5;
for i = 1:size(n1,2)
hiln1(i) = (1-cos(n1(i)*pi))./(n1(i)*pi);
kaiser_win1 = besseli(0,b1)./besseli(0,a);
hn1(i) = hiln1(i) * kaiser_win1(i);
end
for i = 1:size(n2,2)
hiln2(i) = (1-cos(n2(i)*pi))./(n2(i)*pi);
kaiser_win2 = besseli(0,b2)./besseli(0,a);
hn2(i) = hiln2(i) * kaiser_win2(i);
end
% Plot of the spectrum for Hilbert transformer

for i=1:1000
w(i)=pi*fs*i/1000;
z=exp(1i*w(i)*ts);
hf(i)=z^(-1*L/2)*(sum(hn1.*z.^(-n1))+sum(hn2.*z.^(-n2)));
end
figure;
subplot(2,1,1);
plot(w,abs(hf));
xlabel('frequency(Hz)');
ylabel('|H(w)|');
title('Magnitude Spectrum');
subplot(2,1,2);
plot(w,angle(hf));
xlabel('frequency(Hz)');
ylabel('Phase ofH(w)');
title('Phase Spectrum');