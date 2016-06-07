clc
close all;
ws = 40e3;
omega_s = (2/T)*tan(ws*T/2);
w1 = 10e3;
w = 1:100:ws/2;
%w2 = 0:100:omega_s;
omega = (2/T)*tan(w*T/2);
omega1 = (2/T)*atan(w1*T/2);
%z = exp(1i*omega_s/2*T);

%temp1 = eval(Hbli);
for k = 1:1:length(w)
    z = exp((1i*omega(k)*T)); % replace Z with e(jWT)
    S(k) = eval(Hbli); % Evaluate Digital Filter
    Y(k) = butterD(omega(k),omega1,T);
    B(k) = but_filter(w1/(1i*w(k))); % response from analog filter
end
Y = Y/Y(length(Y));


B = B/B(length(B));
figure(1)
plot(w,abs(B),'b')
hold on
plot(w,abs(Y),'r')
grid on
legend('Digital','Analog');

figure(3)
plot(w,angle(B),'b')
hold on
plot(w,angle(Y),'r')
grid on
legend('Digital','Analog');

