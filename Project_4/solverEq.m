clear;close all;clc;
[t,x] = ode45(@equ,[0 2.2],[0; 0]);
figure;
plot(t,x(:,1));
figure;
plot(t,x(:,2));