clear;close all;clc;
% Task 3 - Comparing the energy of 8 point discrete time domain and 8 point DFT signals
N = 8;n=0:N-1;
xen=3*sin(6*pi*n/16);
E_xt=sum(xen.^2);% Energy of 8 point discrete time domain signal
for k=0:N-1
    Xen(k+1)=sum(xen(n+1).*exp(-1i*(2*pi./N)*k.*n));
end
E_xf=1/N*sum(abs(Xen).^2);% Energy of 8 point DFT signal