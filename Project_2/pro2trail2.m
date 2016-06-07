clc;
clear;
close all;
w_s = 4*10^4;
T=2*pi/w_s;
omga_s = (2/T)*tan(w_s*T/2);                    
w_1 = 1*10^3;
omg_1 = (2/T)*atan(w_1*T/2);                  
w = 1:10:w_s/2;                                
omg = (2/T)*tan(w*T/2);                        

for i = 1:1:length(w)
    C(i) = but_filterd(omg(i),omg_1,T);
    D(i) = butterth_filter(w_1/(1i*w(i)));    
end
C = C/C(length(C));                           
D = D/D(length(D));                          
figure(1)
subplot(2,1,1)
plot(w,abs(D),'k')
xlabel('Frequency (radians/second)')
ylabel('Magnitude of digital signal');
grid on
hold on
subplot(2,1,2)
plot(w,abs(C),'b')
xlabel('Frequency (radians/second)')
ylabel('Magnitude of analog signal');
grid on
figure(2)
subplot(2,1,1)
plot(w,angle(D),'k')
xlabel('Frequency (radians/second)')
ylabel('Phase of digital signal');
title('Digital');
grid on
hold on
subplot(2,1,2)
plot(w,angle(C),'b--')
xlabel('Frequency (radians/second)')
ylabel('Phase of analog signal');
title('Ananlog')
grid on