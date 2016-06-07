clc;
home;
close all;

%% Task - 1
% Design a LPF to meet Following Parameters
% With Hanning Window

% =------------Parameters-----------=

% In Hertz 
fs = 48e3;      % Sampling Frequency
f1 = 9.2e3;     % Stop-band frequnecy
fp = 5.2e3;     % Passband edge frequency
fc = (f1+fp)/2; % Cut-off frequency
% in randians
ws = (2*pi*fs);   
w1 = pi*(2*pi*f1)/(ws/2)
wp = pi*(2*pi*fp)/(ws/2)
wc = (2*pi*fc)/(ws/2)
wb = w1- wp    % Mainlobe Width

% Passband Stopband Attenuations
As = 50;        % in dB desired >= 50dB
Ap = 0.3;       % in dB desired <= 0.3dB

% Stop band and Passband ripple
rp = (10^(Ap/20) - 1) / (10^(Ap/20) + 1); 
rs = 10^-(As/20);
delta = min(rp,rs);

A = -20*log10(delta)
M = (6.6*pi)/wb;
M = ceil(M)
    if(rem(M,2) == 1)
        M = M + 1
    end
L = M+1;
n = 0:M;

% Hamming/Hanning Window Function
a = 0.54;
Wh = a +(1-a)*cos(2*pi*n*(L-1)^-1); %  Hanning  Window Function
Wh = circshift(Wh,[0,M/2]);         %  Non-Causal to Causal

Hd = (wc/pi)*sinc((wc/pi)*(n-M/2)); %  Ideal Low Pass Filter
Hf = conv(Wh,Hd);                        %  Filter-co-efficient 


sys = filt([Hf],[1]);

figure(1);
stem(Wh);
figure(2);
stem(Hd);
figure(3);
stem(Hf);
figure(4);
bode(sys);

w = -pi/2:0.01:pi/2;
[M,P] = freqresp(sys,w);

figure(5);
subplot(2,1,1)
plot(w,log10(squeeze(abs(M))));
subplot(2,1,2)
plot(w,squeeze(angle(M)));


%% Task - 2
% Design a BPF to meet Following Parameters
% With Blackman Window

% % =------------Parameters-----------=
% 
% % In Hertz 
% fs  = 2e3;      % Sampling Frequency
% fs1 = 200;      % Stopband frequency-1
% fp1 = 300;      % Passband frequnecy-1
% fp2 = 500;      % Passband frequency-2
% fs2 = 500;      % Stopband frequency-2
% 
% % Normalized Frequencies
% ws = (2*pi*fs);   
% wp1= pi*(2*pi*fp1)/(ws/2);
% wp2= pi*(2*pi*fp2)/(ws/2);
% ws1= pi*(2*pi*fs1)/(ws/2);
% ws1= pi*(2*pi*fs1)/(ws/2);
% 
% wc1= (wp1-ws2)/2;   % Lower Cut-off Frequency
% wc2= (ws2-wp2)/2;   % Upper Cut-off Freqeuncy
% 
% % Passband Stopband Attenuations
% As = 60;        % in dB desired >= 60dB
% Ap = 0.3;       % in dB desired <= 0.1dB
% 
% % Stop band and Passband ripple
% rp = (10^(Ap/20) - 1) / (10^(Ap/20) + 1); 
% rs = 10^-(As/20);
% delta = min(rp,rs);
% 
% A = -20*log10(delta)
% M = (6.6*pi)/wb;
% M = ceil(M)
%     if(rem(M,2) == 1)
%         M = M + 1
%     end
% L = M+1;
% n = 0:M;
% 
% % Hamming/Hanning Window Function
% a = 0.54;
% Wh = a +(1-a)*cos(2*pi*n*(L-1)^-1); %  Hanning  Window Function
% Wh = circshift(Wh,[0,M/2]);         %  Non-Causal to Causal
% 
% Hd = (sin()-sin())(pi*(n-(M/2)))^-1; %  Ideal Low Pass Filter
% Hf = conv(Wh,Hd);                        %  Filter-co-efficient 
% 
% 
% sys = filt([Hf],[1]);
% 
% figure(1);
% stem(Wh);
% figure(2);
% stem(Hd);
% figure(3);
% stem(Hf);
% figure(4);
% bode(sys);
% 
% w = -pi/2:0.01:pi/2;
% [M,P] = freqresp(sys,w);
% 
% figure(5);
% subplot(2,1,1)
% plot(w,log10(squeeze(abs(M))));
% subplot(2,1,2)
% plot(w,squeeze(angle(M)));
% 
% 
% 


