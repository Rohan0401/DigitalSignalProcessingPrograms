clear;
clc

b = 0.379051;
a = [1 1.197386 1.716866 1.025455 0.379501];
[n,d] = residue(b,a);
q = length(d);
fs = 15e3;
syms x y k t T Z
T = 1/fs;
d = d*(2*pi*3000);
for i = 1:1:q
    f(i) = n(i)/(x - d(i));
    f(i) = subs(f(i),x,((2/T)*((Z-1)/(Z+1))));
    Hdz(i) = vpa(f(i),4);
    [g(i),h(i)] = numden(Hdz(i));
    p(i) = solve(h(i) == 0);
    p(i) = vpa(p(i),4);
end

Hbli = vpa(Hdz(1)+Hdz(2)+Hdz(3)+Hdz(4),4)
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

