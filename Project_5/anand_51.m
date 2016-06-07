clc;
clear;
close all;
c=[1,2,3]; 
N=1000; 
x_n=randn(1,N);
d_n=conv(x_n,c);
d_n=d_n(1:N);
 
%  For auto correlation and Cross Correlation 
for i=1:3
    x=[zeros(1,i-1),x_n(1:N-i+1)];
    r(i)=x_n*x'/N;
    P(i)=d_n*x'/N; %P matrix generation
end
 
for j=1:3
    for k=1:3
        R(j,k)=r(abs(j-k)+1); %R matrix generation
    end
end
 

 

w_star=inv(R)*P' %weiner weights calculation
