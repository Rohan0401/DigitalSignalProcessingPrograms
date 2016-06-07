function butter = butterD(omega,omega1,T)
z=exp((1i*omega*T)/omega1);
s = (2/T)*((z-1)/(z+1));
butter = (s.^6./(s.^6 + 3.8637033.*s.^5 + 7.4641016.*s.^4 + 9.14161202.*s.^3 + 7.4641016.*s.^2 + 3.8637033.*s + 1));