clear variables;
close all;
clc;
% Task 1- To compute 16 point DFT and IDFT(magnitude and phase)
N=16; %number of points
n=0:N-1;
    x1=cos(2*pi.*n./16)+2*cos(4*pi.*n./16); % signal x1(n)
    x2=sin(2*pi.*n./16)+2*sin(4*pi.*n./16); % signal x2(n)
%DFT of x1(n) and x2(n)
for k=0:N-1
    X1(k+1)=sum(x1(n+1).*exp(-1i*(2*pi./N)*k.*n)); % DFT signal X1(k)
    X2(k+1)=sum(x2(n+1).*exp(-1i*(2*pi./N)*k.*n)); % DFT signal X2(k)
end
%IDFT of X1(k) and X2(k)
for k=0:N-1
    x1_IDFT(k+1)=(1/N)*sum(X1(n+1).*exp(1i*(2*pi./N)*k.*n));% IDFT signal x1(n) 
    x2_IDFT(k+1)=(1/N)*sum(X2(n+1).*exp(1i*(2*pi./N)*k.*n));% IDFT signal x2(n)
end
% To compare the original signal x1(n) and the resultant IDFT signal
figure;%1
subplot(211);
stem(n,abs(x1));
title('Magnitude x1(n)');
xlabel('n');
ylabel('Amplitude');
grid on;
subplot(212);
stem(n,angle(x1));
grid on;
title('Phase x1(n)');
xlabel('n');
ylabel('Phase');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;%2
subplot(211);
stem(n,abs(x1_IDFT));
grid on;
title('Magnitude IDFT X1(k)')
xlabel('n');
ylabel('Amplitude');

subplot(212);
stem(n,angle(x1_IDFT));
grid on;
title('Phase IDFT X1(k)');
ylabel('Phase');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To compare the original signal x2(n) and the resultant IDFT signal
figure;%3
subplot(211);
stem(n,abs(x2));
grid on;
title('Magnitude x2(n)');
xlabel('n');
ylabel('Amplitude');
subplot(212);
stem(n,angle(x2));
grid on;
title('Phase x2(n)');
xlabel('n');
ylabel('Phase');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;%4
subplot(211);
stem(n,abs(x2_IDFT));
grid on;
title('Magnitude IDFT X2(k)');
xlabel('n');
ylabel('Amplitude');

subplot(212);
stem(n,angle(x2_IDFT));
grid on;
title('Phase IDFT X2(k)');
xlabel('n');
ylabel('Phase');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot for DFT of x1(n)
figure;%5
subplot(211);
stem(n,abs(X1));
grid on;
title('Magnitude DFT x1(n)');
xlabel('k');
ylabel('Amplitude');
subplot(212);
stem(n,angle(X1));
grid on;
title('Phase DFT x1(n)');
xlabel('k');
ylabel('Phase');
%Plot for DFT of x2(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;%6
subplot(211);
stem(n,abs(X2));
grid on;
title('Magnitude DFT x2(n)');
xlabel('k');
ylabel('Amplitude');
subplot(212);
stem(n,angle(X2));
grid on;
title('Phase DFT x2(n)');
xlabel('k');
ylabel('Phase');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%