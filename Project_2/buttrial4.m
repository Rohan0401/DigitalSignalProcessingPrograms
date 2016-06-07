
clc;clear ;close all;
den = [1 3.8637033 7.4641016 9.1416202 7.4641016 3.8637033 1];
num = [1 0 0 0 0 0 0];
[num1,den1] = residue(num,den);                         
L = length(den1);
w_s = 4*10^4;
Ts = (2*pi)/w_s;
omega_sample = (2/Ts)*atan(w_s*Ts/2);
f_sample = omega_sample/(2*pi);
syms s y k t T z                                       
w_1 = 10*10^3;
omega_1 = (2/Ts)*atan(w_1*Ts/2);
den1 = den1*(w_1);
for i = 1:1:L
    F(i) = num1(i)/(s - den1(i));                      
    F(i) = subs(F(i),s,((2*(z-1))/(Ts*(z+1))));         
    H_digital(i) = vpa(F(i),3);
    [g(i),h(i)] = numden(H_digital(i));
    P(i) = solve(h(i) == 0);
    P(i) = vpa(P(i),3);
    Z(i) = solve(g(i) == 0);
    
end
H_bilinear = vpa(H_digital(1)+H_digital(2)+H_digital(3)+H_digital(4)+H_digital(5)+H_digital(6),4)
poles = vpa(P,3);
poles_d = double(poles); 
zeros_v = vpa(Z,4);
zeros_d = double(zeros_v);
figure(1);
zplaneplot(zeros_d,poles_d); % Plotting the poles of the 
legend('zeros','poles');
title('Poles for the Z plane');
Magnitudepole = abs(poles_d)                             
Phasepole = rad2deg(angle(poles_d))  
m_poles = abs(poles_d) ;
fprintf('The magnitude of poles are |Z(pole)|  =  %1.4f %1.4f %1.4f %1.4f \n',m_poles(1),m_poles(2),m_poles(3),m_poles(4) );
fprintf('The max value of |Z(pole)|  =  %1.4f \n',(max(m_poles)) );
phase_poles = rad2deg(angle(poles_d));
fprintf('The phase of poles are Z(phase)  =  %1.4f %1.4f %1.4f %1.4f \n',phase_poles(1),phase_poles(2),phase_poles(3),phase_poles(4) );
fprintf('The max value of angle Z(pole)  =  %1.4f \n',(max(phase_poles)) );
for i = 1:1:length(m_poles)
    if(m_poles(i) > 1)
        counter = 1;
    else
        counter = 0;
    end
end
if counter == 1
    disp('Stablity :- Filter is Unstable');
else
    disp('Stablity: - Filter is Stable');
end

[num,den] = zp2tf([1 1 1 1 1 1]',poles_d,1);
A = tf(num,den,Ts);
w = 0:1:w_s/2;
R = freqresp(A,w,'rad/s');                               
M = freqresp(A,w_s/2,'rad/s');                           
L = abs(R(:))/abs(M);
Q = angle(R(:));
for k = 1:1:length(w)
    B(k) = but_filter(w_1/(1i*w(k)));
end
figure(2)
plot(w,L)
hold on
plot(w,abs(B),'r--')
grid on
xlabel('Frequency(rad/sec)');
ylabel('Magnitude of the signal');
title('Magnitude Butterworth filter');
legend('Digital','Ananlog');

figure(3)
plot(w,Q)
hold on
plot(w,angle(B),'r--')
grid on
xlabel('Frequency(rad/sec)');
ylabel('Phase of the signal');
title('Phase Butter Worth filter');
legend('Digital','Ananlog');
index = min(find(L>=0.707));                            %Finding  0.707 COrner Frequency
cutoff_freq = w(index);
disp(sprintf('cutoff frequency: %.2f rad/seconds',cutoff_freq))
disp(sprintf('analytical cutoff frequency : %.2f rad/seconds',omega_1))