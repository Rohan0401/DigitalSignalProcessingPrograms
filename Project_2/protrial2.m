clc
close all;
fs = 10e3;
ws = 2*pi*fs;
T = 1/fs;
f1 = 2e3;
w1 = 2*pi*f1;
w = 0:100:ws/2;
z = 1;
temp = eval(HdZ);
B = zeros(1,length(w));
R =  zeros(1,length(w));

for k = 1:1:length(w)
    z = exp(1i*w(k)*T);
    B(k) = che_filter(1i*w(k)/w1);
    B(k) = B(k)/che_filter(0);
    R(k) = eval(HdZ);
    R(k) = R(k)/temp;
end
figure(1)
plot(w,abs(R),'r--')
hold on
plot(w,abs(B),'b')
legend('Digital','Analog');

figure(2)
plot(w,angle(R),'r--')
hold on
plot(w,angle(B),'b')
legend('Digital','Analog');