clc;
clear ;
close all;
c=[1,2,3];
 
N=500;
x_n=randn(1,N);
d=conv(x_n,c);
d=d(1:N);
mu=0.02;
w = zeros(3,3);
 
 
% LMS Algorithm implementation
 
for i=3:N
    y_n(i)=w(1,i)*x_n(i)+w(2,i)*x_n(i-1)+w(3,i)*x_n(i-2);
    eta(i)=0.2*sin(2*pi*i/16);
    e_n(i)=d(i)+eta(i)-y_n(i);
    w(1,i+1)=w(1,i)+2*mu*e_n(i)*x_n(i);
    w(2,i+1)=w(2,i)+2*mu*e_n(i)*x_n(i-1);
    w(3,i+1)=w(3,i)+2*mu*e_n(i)*x_n(i-2);
end
 

j=1:N;
figure(1);
plot(j,w(1,j),'b-',j,w(2,j),'g',j,w(3,j),'r');
legend('w0(n)','w1(n)','w2(n)');
xlabel('N');
ylabel('Magnitude');
 
% Display the result
%display('The output for N=500');
w=[w(1,i+1),w(2,i+1),w(3,i+1)]
 
i=1:500; 
figure(2); 
plot(i,eta(i),i,e_n(i),'--r'); 
legend('error','eta'); 
xlabel('Smaple'); 
ylabel('error') 

