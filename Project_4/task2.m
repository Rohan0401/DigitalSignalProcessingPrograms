
clear;close all;clc;
% Task 2a and 2b - To find y(n)
t = zeros(3,16);
i=0:3;
h=0.5.^i;
for n=0:15
x(n+1)=4*sin((2*pi*n)/8);
t(1,n+2) = x(n+1);
t(2,n+3) = x(n+1);
t(3,n+4) = x(n+1);
%Task 2a - y(n) by using the difference equation
y(n+1)=x(n+1)+0.5*t(1,n+1)+0.5^2*t(2,n+1)+0.5^3*t(3,n+1);
%Task 2b - y(n) by using the convolution summation
y_conv(n+1) = h*[x(n+1);t(1,n+1);t(2,n+1);t(3,n+1)];
end
figure;
stem(y);
title('Task 2 a for the diffrenece equation');
xlabel('n');
ylabel('Cofficent of y(n)');

% Task 2c - y(n) by using the FFT
h=[h,zeros(1,12)];
X=d_fft16(x); % 16 point FFT function
H=d_fft16(h);
y_fft=d_ifft16(1/16.*X.*H); % 16 point IFFT function
figure;
stem(y_conv);
title('Task 2 b for the diffrenece equation');
xlabel('n');
ylabel('Cofficent of y(n)');
figure;
stem((y_fft));
title('Task 2 c for the diffrenece equation');
xlabel('n');
ylabel('Cofficent of y(n)');
