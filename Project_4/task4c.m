clear;
clc
close all
tic
tp = 1e-6;
m = 2/tp;
N = 256;
cap_omega = (2*pi)/tp;
omega_s = N*cap_omega;
T = (2*pi)/omega_s;
t = -tp/2:T:tp/2;
n = 0:1:N-1;
t1 = n.*T;



for i=1:1:length(t)-1

    if t(i)<0

        xp(i) = m*t1(i);
    else
xp(i) = m*t1(i);

            end
end





% X = disc_fourt(xp,n,N);
X = fft(xp,N);
coefficients = X./N;

disp(sprintf('Fourier Series Coefficients'));



for i=1:1:N

    if imag(coefficients(i))>=0

        disp(sprintf('%3.4g+%3.4gi',real(coefficients(i)),imag(coefficients(i))));

    elseif imag(coefficients(i))<0

        disp(sprintf('%3.4g%3.4gi',real(coefficients(i)),imag(coefficients(i))));

    end

end

subplot(2,1,1)
stem(n,abs(coefficients))
title('Fourier Transform for 256 bit')
ylabel('Magnatitude')
xlabel('Time')
subplot(2,1,2)
stem(n,angle(coefficients))
ylabel('Angle')
xlabel('Time')

toc