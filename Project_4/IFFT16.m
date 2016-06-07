

function [ X ] = IFFT16( x )
w=exp(-j*2*pi/16);
x4(1)=x(1);
x4(2)=x(9);
x4(3)=x(5);
x4(4)=x(13);
x4(5)=x(3);
x4(6)=x(11);
x4(7)=x(7);
x4(8)=x(15);
x4(9)=x(2);
x4(10)=x(10);
x4(11)=x(6);
x4(12)=x(14);
x4(13)=x(4);
x4(14)=x(12);
x4(15)=x(8);
x4(16)=x(16);
for k=1:8
x3(2*k-1)=x4(2*k-1)+x4(2*k);
x3(2*k) =x4(2*k-1)-x4(2*k);
end
for k=1:4
x2(4*k-3)=x3(4*k-3)+x3(4*k-1);
x2(4*k-2)=x3(4*k-2)+x3(4*k)*w^(-4);
x2(4*k-1)=x3(4*k-3)-x3(4*k-1);
x2(4*k) =x3(4*k-2)-x3(4*k)*w^(-4);
end
for k=1:2
x1(8*k-7)=x2(8*k-7)+x2(8*k-3);
x1(8*k-6)=x2(8*k-6)+x2(8*k-2)*w^(-2);
x1(8*k-5)=x2(8*k-5)+x2(8*k-1)*w^(-4);
x1(8*k-4)=x2(8*k-4)+x2(8*k) *w^(-6);
x1(8*k-3)=x2(8*k-7)-x2(8*k-3);
x1(8*k-2)=x2(8*k-6)-x2(8*k-2)*w^(-2);
x1(8*k-1)=x2(8*k-5)-x2(8*k-1)*w^(-4);
x1(8*k) =x2(8*k-4)-x2(8*k) *w^(-6);
end
for i=1:8
X(i)=x1(i)+x1(8+i)*w^(1-i);
X(i+8)=x1(i)-x1(8+i)*w^(1-i);
end