function dxdt = equ(t,x)
dxdt = [x(2);(2+cos(t)*x(1))];
end