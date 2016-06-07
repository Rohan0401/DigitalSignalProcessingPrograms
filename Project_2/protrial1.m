

clear;clc;close all;

b = 0.379051;
a = [1 1.197386 1.716866 1.025455 0.379501];
[n,d] = residue(b,a);
q = length(d);
fs = 10e3;
syms x y k t T
T = 1/fs;
d = d*(2*pi*2000);
for i = 1:1:q
    f = n(i)/(x - d(i));
    y = ilaplace(f);
    y = subs(y,t,k*T);
    y = eval(y);
    Hdz(i) = ztrans(y);
    Hdz(i) = vpa(Hdz(i),4);
    [g(i),h(i)] = numden(Hdz(i));
    p(i) = solve(h(i) == 0);
    p(i) = vpa(p(i),4);
end
HdZ = vpa(Hdz(1)+Hdz(2)+Hdz(3)+Hdz(4),4)
poles = vpa(p,4)
poles_d = double(poles)
m_poles = abs(poles_d)
phase_poles = rad2deg(angle(poles_d))
for i = 1:1:length(m_poles)
    if(m_poles(i) > 1)
        counter = 1;
    else
        counter = 0;
    end
end
if counter == 1
    disp('Filter is Unstable');
else
    disp('Filter is Stable');
end

% fs = 10e3;
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