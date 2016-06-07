clear;close all;clc;

% Task 4 specifications
fs=1;
ws=2*pi;
L=20;
ts=1/fs;
n1=-L/2:-1;
n2=1:L/2;
fileID = fopen('task41_1.txt','w');
fileID2 = fopen('task41_2.txt','w');
%%%-------------------------------Starting the Differentiator---------
for i = 1:size(n1,2)  % Taking analysis for first half

 hdif1(i) = cos(n1(i).*pi)./(n1(i).*pi); % Deifining  the rectangular window
 hamming_winfor1(i) = 0.54+0.46*cos(2*pi.*n1(i)/L);% Defining the hamming window
 hNeg = hdif1.*hamming_winfor1;
 fprintf(fileID,'The coefficent of h(%d)*W(%d) for Negetive half for Hamming = %f \n',(i-1),(i-1),hNeg(i));
 fprintf(fileID2,'The coefficent of h(%d)*W(%d) for Negetive half for Rectangular = %f \n',(i-1),(i-1),hdif1(i));

 

end

for i = 1:size(n2,2) % taking analysis for second half

 hdif2(i) = cos(n2(i).*pi)./(n2(i).*pi); % Taking the rectangular window for second half 
 hamming_winfor2(i) = 0.54+0.46*cos(2*pi.*n2(i)/L);% Tanking hamming window for the second half 
 hPos = hdif2.*hamming_winfor2;
 fprintf(fileID,'The coefficent of h(%d)*W(%d) for Positive half for Hamming   = %f \n',(i-1),(i-1),hPos(i));
 fprintf(fileID2,'The coefficent of h(%d)*W(%d) for Positive half for Rectangular = %f \n',(i-1),(i-1),hdif2(i));
end
fclose(fileID); fclose(fileID2);
% Plot of the spectrum for the digital differentiator

for i=1:2001

 w(i)=pi*fs*(i-1001)/1000; % Transforming into frequecy domain 
 z=exp(1i*w(i)*ts);  % Convert to discretized frequency respose
 h_i(i)=1i*w(i)./ws ; % Taking Ideal Filter for the calculation 
 hf(i)=z.^(-1*L/2).*(sum(hdif1.*z.^(-n1))+sum(hdif2.*z.^(-n2))); % Dealying the response for the frequecy calculation
 hm(i)=z.^(-1*L/2).*(sum(hdif1.*hamming_winfor1.*z.^(-n1))+sum(hdif2.*hamming_winfor2.*z.^(-n2))); % For Hamming window
end

figure;

%%% plot for Ideal window%%%%%%%%%%%%%%%%%%%%%%%%%

plot(w/(2*pi),abs(h_i));
axis([-0.6 0.6 0 1]);
xlabel('frequency(Hz)');
ylabel('|H(w)|');
title('Magnitude Spectrum of Ideal case');
grid on;
figure;

plot(w/(2*pi),angle(h_i));
axis([-0.6 0.6 -2 4]);
xlabel('frequency(Hz)');
ylabel('Phase of H(w)');
title('Phase Spectrum of Ideal case');
grid on;
figure;
%%% Plot for Rectangular Window
plot(w/(2*pi),abs(hf));
xlabel('frequency(Hz)');
ylabel('|H(w)|');
title('Magnitude Spectrum of Rectangular Window');
grid on;
figure;

plot(w/(2*pi),angle(hf));
xlabel('frequency(Hz)');
ylabel('Phase of H(w)');
title('Phase Spectrum of Rectangular Window');
grid on;
figure;

%%% Plot for Hamming Window
plot(w/(2*pi),abs(hm));
xlabel('frequency(Hz)');
ylabel('|H(w)|');
title('Magnitude Spectrum of Hamming Window');
grid on;
figure;
plot(w/(2*pi),angle(hm));
xlabel('frequency(Hz)');
ylabel('Phase of H(w)');
title('Phase Spectrum of Hamming Window');
grid on;