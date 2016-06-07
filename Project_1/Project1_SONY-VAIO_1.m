clear;close all;clc;
%Finding Order of the System
 
freq=8000;
Ts=1/freq;
ws=2*pi*freq;fc=2000;bw=2*pi*fc;w0=bw;    
w1=0:1:2*bw ;
n=1:length(w1);
x(n)=1;
l=1;
fOrder = 1;
S=0;

i = true;
while(i)
for  w=0:1:bw

      s=1i*w/w0;
     %B = bTfn(fOrder,w0);
     %H=1/(s^6 +3.8637*s^5 +7.4641*s^4 +9.14162*s^3 +7.4641*s^2 +3.8637*s +1);
    % H = 1/(s^2 + 1.4142*s + 1);
     %butterH = (s^2 -(2*(s)*cos((((2*t+n-1)*pi*0.5)/n))) +1)
    H = butterWorth(fOrder,w,w0);
    
     i = i+1;
     
    
     %H = 1/(s+1);
      %H = 1/B;
     %H = 1/((s^2 + 0.7654*s + 1)*(s^2 + 1.8478*s + 1));
     S=S+(abs(H))^2;

end

 

 %arr=[-6 -5 -4 -3 -2 -1 1 2 3 4 5 6 ];
 arr = -6:6;
Noise=0;

for  w=0:1:bw

     N=0;

      

     for  n=1:10

          k=w+arr(n)*ws;

         s=1i*k/w0;
         H = butterWorth(fOrder,k,w0);
          % B = bTfn(fOrder,w0);
%      H=1/(s^6 +3.8637*s^5 +7.4641*s^4 +9.14162*s^3 +7.4641*s^2 +3.8637*s +1);
        %H = 1/(s^2 + 1.4142*s + 1);
        %H = 1/(s+1);
      %H = 1/B;
          N=N+H;

     end

    
      Noise=Noise+(abs(N))^2;

 end

 

 SNR=10*log10(S/Noise);
 if SNR >= 60
     i = false;
 else
     fOrder = fOrder+1;
 end
end
 
fque = -10000:100:10000;
w = 2*pi*fque;
s=1i*w/w0;
B = zeros(1,length(w));
for i= 1:length(w)
    H = butterWorth(fOrder,w(i),w0);
    B(i) = H;
end

% for m = 
% for
%     i= 1:length(w)
%    % H = butterWorth(fOrder,-3*w(i),w0) + butterWorth(fOrder,-2*w(i),w0)+ butterWorth(fOrder,w(i),w0)+ butterWorth(fOrder,w(i),w0) butterWorth(fOrder,w(i),w0);
%     B(i) = H;
% end


subplot(2,1,1)
plot(fque,abs(B));
grid on
subplot(2,1,2)
plot(fque,angle(B));
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% for m = -8:1:8;
%     w1=0:1:2*bw ;
%     
%     H = butterWorth(fOrder,w(i)+ m*ws,w0);
%     
    


     