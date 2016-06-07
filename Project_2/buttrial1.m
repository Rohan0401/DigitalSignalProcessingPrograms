clear;
clc

syms x y k t T z 
b = [1 0 0 0 0 0 0];
%b = 1;
a = [1 3.8637033 7.4641016 9.1416202 7.4641016 3.8637033 1];
[n,d] = residue(b,a);
q = length(d);
w1 = 10e3;
ws = 4*w1;
T = (2*pi)/ws;

w1 = 10e3;
d = d*(w1);
for i = 1:1:q
    f(i) = n(i)/(x - d(i));
    f(i) = subs(f(i),x,((2*(z-1))/(T*(z+1))));
    Hdz(i) = vpa(f(i),4);
    [g(i),h(i)] = numden(Hdz(i));
    p(i) = solve(h(i) == 0);
    p(i) = vpa(p(i),4);
end

Hbli = vpa(Hdz(1)+Hdz(2)+Hdz(3)+Hdz(4)+Hdz(5)+Hdz(6),4);
poles = vpa(p,4);
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

