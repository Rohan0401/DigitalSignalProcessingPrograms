function B = but_filterd(o,o1,t)
z=exp((1i*o*t)/o1);
s = (2/t)*((z-1)/(z+1));
B = (s.^6./(s.^6 + 3.8637033.*s.^5 + 7.4641016.*s.^4 + 9.14161202.*s.^3 + 7.4641016.*s.^2 + 3.8637033.*s + 1));