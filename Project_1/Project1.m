%%*********************************PROJECT NO 1***********************
% Name : Rohan Singh Rajput
% Course : Digital Signal Processing Application
% Course Id : EEE- 5513
% Term : Spring 2016
% Submitted : 15-Feb-2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;close all;clc;

%%%%%%%%%%%%
freq=8000;
Ts=1/freq;
ws=2*pi*freq;fc=2000;bw=2*pi*fc;w0=bw;
w1=0:1:2*bw ;
n=1:length(w1);
x(n)=1;
l=1;
fOrder = 1;
i = true;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%************************ TASK(A)**************************************
% Firstly, ?_s and ? are to initialized for all the necessary calculations in frequency domain. It is given ? is defined from -20 kHz to +20 kHz.
% Also,
% ?_s=f_s*2?=8000*2?    Hz
% ?=f*2?=20000*2?     Hz

%%------------------------ Code For Task A--------------------------------%
while(i)
    S=0;
    for  w=0:1:bw
        H = butterWorth(fOrder,w,w0);
        S=S+(abs(H))^2;
    end
    NoiseArray=[-6 -5 -4 -3 -2 -1 1 2 3 4 5 6 ];
    Noise=0;
    
    for  w=0:1:bw
        N =0;
        
        
        
        
        for  n=1:12
            
            k=w+NoiseArray(n)*ws;
            H = butterWorth(fOrder,k,w0);
            
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
%%-------------------End of Task A-----------------------------------------
% Firstly, w_s and w are to initialized for all the necessary calculations
% in frequency domain. It is given w is defined from 0 to 2 kHz

%%%%%%%%%%%%%%%%%% TASK (B) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fque = -10000:100:10000;
w = 2*pi*fque;
s=1i*w/w0;
ButterOutput = zeros(1,length(w));
for i= 1:length(w)
    H = butterWorth(fOrder,w(i),w0);
    ButterOutput(i) = H;
end



figure(1)
subplot(2,1,1)
plot(fque,abs(ButterOutput));title('Output Magnitude at Point 2');xlabel('Frequency(Hz)');ylabel('Value');
grid on
subplot(2,1,2)
plot(fque,angle(ButterOutput));title('Output Phase at Point 2');xlabel('Frequency(Hz)');ylabel('Value');
grid on
%%%________________________End of Task B______________________________
%%%%%%%%%%%%%%%%%%%%%%%% TASK (C)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fque = -10000:100:10000;
Ideal_Samp = zeros(1,length(w));
for i= 1:length(w)
    
    H =  butterWorth(fOrder,(w(i)-3*ws),w0)+ butterWorth(fOrder,(w(i)-2*ws),w0)+ butterWorth(fOrder,(w(i)-1*ws),w0)+ butterWorth(fOrder,w(i),w0)+ butterWorth(fOrder,(w(i)+1*ws),w0)+butterWorth(fOrder,(w(i)+2*ws),w0)+butterWorth(fOrder,(w(i)+3*ws),w0);
    Ideal_Samp(i) = H;
end

figure(2)
subplot(2,1,1)
plot(fque,abs(Ideal_Samp));title('Output Magnitude at Point 3');xlabel('Frequency(Hz)');ylabel('Value');
ylim([0,1.5])
grid on
subplot(2,1,2)
plot(fque, angle(Ideal_Samp));title('Output Phase at Point 3');xlabel('Frequency(Hz)');ylabel('Value');
grid on

%%%%%-----------------------------End of Task C---------------

%%%%%%%%%%%%%%%% TASK (D)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_signal = sawtooth(w/8000,0.5);
M_signal = (1-M_signal)/2;
figure(3)
% plot(fque,M_signal);title('Output Magnitude at M signal');xlabel('frequecy');ylabel('Value');

H_dsp = (M_signal).*(Ideal_Samp);
subplot(2,1,1)
plot(fque,abs(H_dsp));title('Output Magnitude at Point 4');xlabel('frequecy');ylabel('Value');
grid on;
subplot(2,1,2)
plot(fque,angle(H_dsp));title('Output Frequency at Point 4');xlabel('Frequency(Hz)');ylabel('Value');
grid on;
%%%%---------------------End of Task D--------------------------
%%%%%%%%%%%%%%%%%%%%%% TASK (E)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Sinc_signal =sinc(fque/8000);

Samp_Hold = H_dsp.*Sinc_signal;
figure(7)
subplot(2,1,1)
plot(fque,abs(Samp_Hold));title('Output Magnitude at Point 5');xlabel('Frequency(Hz)');ylabel('Value');
grid on;
subplot(2,1,2)
plot(fque,angle(Samp_Hold));title('Output Phase at Point 5');xlabel('Frequency(Hz)');ylabel('Value');
grid on;
%%%%---------------------------End of Task E
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TASK F %%%%%%%%%%%%%%%
SNR_Jitter_dB = 60;
SNR_Jitter =1e+6; 
T_signal = 1/2000;
T_jitter = ((T_signal)/sqrt(SNR_Jitter))*(sqrt(3/(8*(pi)^2)))
disp(T_jitter)
%%%%%%___________________End of Task F_______________
%%%%%%%%%%%%%%%%%%%%%%%%%TASK G %%%%%%%%%%%%%%%%
n_bits = 12;
SNR_quant = 20*n_bits*log10(2)

%%%%%%__________________End of Task G________________
%%%%%%%%%%%%%%%% Task H %%%%%%%%%%%%%%%%%%%%%%%%
i =0
freqq = -200:200;
freqq = freqq.*100;
H_r = zeros(1,length(freqq));
T_hold = 125e-6;
for i = (find(freqq == -2000):find(freqq == 2000))
    H_r(i) = 1./sinc(freqq(i)*T_hold);
end
figure(8)
plot(freqq,abs(H_r));title('Output Magnitude of H_r');xlabel('Frequency(Hz)');ylabel('Value');
grid on;
%%%%%_______________________End of Task F_________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%TASK G%%%%%%%%%%%%%%%%%%%%%%%%

Samp_Hold = [ones(1,100) Samp_Hold ones(1,100)];
reconstoR = Samp_Hold.*H_r;
figure(9)
subplot(2,1,1)
plot(freqq,abs(reconstoR));title('Output Magnitude at Point 6');xlabel('Frequency(Hz)');ylabel('Value');
grid on;
subplot(2,1,2)
plot(freqq,angle(reconstoR));title('Output Phase at Point 6');xlabel('Frequency(Hz)');ylabel('Value');
grid on;
%%%%_________________End of Task G__________________
%++++++++++++++++++++++++++End of Program+++++++++++++++++++++++++++++++++