clc;clear;close all;
%Lowpass filter with hamming window, odd number of samples
fp = 5.2e3;f1 = 9.2e3;fs = 48e3;f = 0:fs/2;w = 2*pi.*f;fc = (fp+f1)/2;Ts = 1/fs;Z = exp(1i.*w.*Ts);L = round(3.3*(fs/(f1-fp)));
stAtten = 50;pbAtten = .3;Wc = 2*pi*fc;n = 0:L+1;hLP = zeros(1,length(n));
for i=0:L+1
    hLP(i+1) = sin(Wc*Ts.*(i-(L/2)))/(pi.*(i-(L/2))); %LP filter equation h(nt)
end
hamm = .54+.46*cos((2*pi.*n)./L);winFiltHamm = hLP.*hamm;
summFreqHamm = zeros(1,length(Z));
for k=0:fs/2
    sum = 0;
for N=-L/2:L/2
    if (N~=0) 
        sum = sum + (((sin(Wc*Ts*N)/(pi*N))*(.54+.46*cos((2*pi*N)/L)))*exp(1i*2*pi*k*Ts*(-N)));
    end
end
    summFreqHamm(k+1) = sum;
end
filtFreqHamm = Z.^(-L/2).*summFreqHamm;
subplot(211);
plot(w,abs(filtFreqHamm));
title('Hamming Windowed Lowpass Mag');
xlabel('Frequency(rad/sec)');
ylabel('Amplitude');
grid on;
subplot(212);
plot(w, rad2deg(angle(filtFreqHamm)));
title('Hamming Windowed Lowpass Phase');
xlabel('Frequency(rad/sec)');
yAxis = sprintf('Angle(%c)',char(176));
ylabel(yAxis);
grid on;  