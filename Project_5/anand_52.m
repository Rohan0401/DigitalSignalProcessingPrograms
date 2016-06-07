clc;
clear;
close all;
c=[1,2,3]; %c0,c1 and c2 declaration
N=200; %for n=200
x_n=randn(1,N);
d_n=conv(x_n,c);
d_n=d_n(1:N);
mu=0.02;
w = zeros(3,3);
 %LMS Algorithm implementation
for i=3:N
    y_n(i)=w(1,i)*x_n(i)+w(2,i)*x_n(i-1)+w(3,i)*x_n(i-2);
    e_n(i)=d_n(i)-y_n(i);
    w(1,i+1)=w(1,i)+2*mu*e_n(i)*x_n(i);
    w(2,i+1)=w(2,i)+2*mu*e_n(i)*x_n(i-1);
    w(3,i+1)=w(3,i)+2*mu*e_n(i)*x_n(i-2);
end
 
% Plot of w0(n),w1(n) and w2(n)
j=1:N;
figure;
plot(j,w(1,j),'b',j,w(2,j),'g.',j,w(3,j),'r--');
legend('w0(n)','w1(n)','w2(n)');
xlabel('Smaples');
ylabel('Magnitude');
title('For W(0), W(1) and W(2)')
 

 

w_n=[w(1,i+1),w(2,i+1),w(3,i+1)]
