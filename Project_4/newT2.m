N = 16;
x_n = 4*sin((2*pi*n)/8);
i=0:3;
h_n=0.5.^i;
for k=0:N-1
    xfftEvenSum = 0;
    hfftEvenSum = 0;
    xfftOddSum = 0;
    hfftOddSum = 0;
for n=0:(N/2)-1
    
    xfftEvenSum = xfftEvenSum + x_n((2*n)+1)*exp((1i*2*pi*(-k*n))/(N/2));
    hfftEvenSum = hfftEvenSum + h_n((2*n)+1)*exp((1i*2*pi*(-k*n))/(N/2));
    xfftOddSum = xfftOddSum + x_n(((2*n)+1)+1)*exp((1i*2*pi*(-k*n))/(N/2));
    hfftOddSum = hfftOddSum + h_n(((2*n)+1)+1)*exp((1i*2*pi*(-k*n))/(N/2));
%     fftEvenSum1 = fftEvenSum1 + x1((2*n)+1)*exp((1i*2*pi*(-k*n))/(N/2));
%     fftEvenSum2 = fftEvenSum2 + x2((2*n)+1)*exp((1i*2*pi*(-k*n))/(N/2));
%     fftOddSum1 = fftOddSum1 + x1(((2*n)+1)+1)*exp((1i*2*pi*(-k*n))/(N/2));
%     fftOddSum2 = fftOddSum2 + x2(((2*n)+1)+1)*exp((1i*2*pi*(-k*n))/(N/2));
end
    XFFT(1,k+1) = xfftEvenSum + (exp((1i*2*pi*(-k))/N)*xfftOddSum);
    HFFT(1,k+1) = hfftEvenSum + (exp((1i*2*pi*(-k))/N)*hfftOddSum);
end