%TASK 5: Repeat task 1 using bilinear transformation method. Compute analytically the new value of f1 of HD(Z).
clc;
clear;
close all;
den = [1 1.197386 1.716866 1.025455 0.379501];
num = 0.379051;
[num1,den1] = residue(num,den);                          
L = length(den1);
f_sample = 10*10^3;
syms s y k t T Z                                         
T = 1/f_sample;
den1 = den1*(2*pi*2000);                                 %Normalizing  Frequency
for i = 1:1:L
    f(i) = num1(i)/(s - den1(i));
    f(i) = subs(f(i),s,((2/T)*((Z-1)/(Z+1))));           %Bilinear Transformation  by (2/T)*(z-1)/(z+1)
    H_digital(i) = vpa(f(i),3);
    [g(i),h(i)] = numden(H_digital(i));                 
    p(i) = solve(h(i) == 0);
     z(i) = solve(g(i) == 0);
    p(i) = vpa(p(i),3);
end
%%%%%%%%% Plot for the magnatude and frequency%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H_bilinear = vpa(H_digital(1)+H_digital(2)+H_digital(3)+H_digital(4),4)
poles = vpa(p,3)
poles_d = double(poles);
zeros_v = vpa(z,4);
zeros_d = double(zeros_v);

figure(1);
zplaneplot(zeros_d,poles_d); % Plotting the poles of the 
legend('zeros','poles');
title('Poles for the Z plane for f1 = 2khz and fs = 20khz');
                  
m_poles = abs(poles_d) ;
fprintf('The magnitude of poles are |Z(pole)|  =  %1.4f %1.4f %1.4f %1.4f \n',m_poles(1),m_poles(2),m_poles(3),m_poles(4) );
fprintf('The max value of |Z(pole)|  =  %1.4f \n',(max(m_poles)) );
phase_poles = rad2deg(angle(poles_d));
fprintf('The phase of poles are Z(phase)  =  %1.4f %1.4f %1.4f %1.4f \n',phase_poles(1),phase_poles(2),phase_poles(3),phase_poles(4) );
fprintf('The max value of angle Z(pole)  =  %1.4f \n',(max(phase_poles)) );

ws = 2*pi*f_sample;
T = 1/f_sample;
f_1 = 2*10^3;
w1 = 2*pi*f_1
w = 0:100:ws/2;
w_1 = (2/T)*atan(w1*T/2) ;                               %wT/2= tan(omegaT/2)
omega = (2/T)*atan(w*T/2);                               
for k = 1:1:length(w)
    Z = exp(1i*omega(k)*T); 
    C(k) = chebyshev_filter(1i*w(k)/w1);
    C(k) = C(k)/chebyshev_filter(0);
    D(k) = che_filterd(Z);
    D(k) = D(k)/che_filterd(1);
end

subplot(2,1,1)
plot(w,abs(C));grid on;ylabel('|H(jw)| Magnitude');xlabel('angular frequency');title('Analog Filter Response Bilinear'); 
subplot(2,1,2)

plot(w,angle(C));grid on;ylabel('H(jw) angle');xlabel('angular frequency');title('Analog Filter Response Bilinear');
figure(3)
subplot(2,1,1)
plot(w,abs(D),'--');grid on;ylabel('|H(exp(jw))| Magnitude');xlabel('angular frequency');title('Digital Filter Response Bilinear'); 
subplot(2,1,2)

plot(w,angle(D),'--');grid on;ylabel('H(exp(jw)) angle');xlabel('angular frequency');title('Digital Filter Response Bilinear');
