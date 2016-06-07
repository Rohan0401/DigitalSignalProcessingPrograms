%%*********************************PROJECT NO 1***********************
% Name : Rohan Singh Rajput
% Course : Digital Signal Processing Application
% Course Id : EEE- 5513
% Term : Spring 2016
% Submitted : 3-Mar-2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%**************Code Starts Here***************************************

clear;clc;close all;
%-------------------------------------------------------------------------
% TASK 1 (A): H(Jw) is a 4th order LP chebychev function. Using the impulse invariant method (Ap=0.5 dB, f1 = 2KHz and fs = 10KHz), 
% obtain HD(z).
[num,deno] = residue(0.379051,[1 1.197386 1.716866 1.025455 0.379501]);
q = length(deno);fs = 10e3;syms s y k t T
T = 1/fs;
deno = deno*(2*pi*2000);
for i = 1:q
    f = num(i)/(s - deno(i)); % Taking partial fraction of Chebyshev Low Pass Filter
    y = ilaplace(f); % Inverse Trasforamtion 
    y = subs(y,t,k*T);% Repalce t with nT
    y = eval(y); % Evaluation of the discrete time 
    Hdz(i) = ztrans(y); %Convert to Z transform 
    Hdz(i) = vpa(Hdz(i),4); % Round to fraction 
    [g(i),h(i)] = numden(Hdz(i)); %Seperate Numberator and Denomenator
    p(i) = solve(h(i) == 0); % Finding Poles of the equation
    z(i) = solve(g(i) == 0);%  Finding Zeros of the equation 
    p(i) = vpa(p(i),4); 
end
disp('%------------------Question 1.(a)----------------------------------')
HdZ = vpa(Hdz(1)+Hdz(2)+Hdz(3)+Hdz(4),4) % Convert to Discrete Domain Transfer Function
poles = vpa(p,4);
poles_d = double(poles);
zeros_v = vpa(z,4);
zeros_d = double(zeros_v);
disp('%------------------------------------Question 1(b)-----------------------%%')
figure(1);
zplaneplot(zeros_d,poles_d); % Plotting the poles of the 
legend('zeros','poles');
title('Poles for the Z plane for f1 = 2khz and fs = 10khz');
m_poles = abs(poles_d) ;
fprintf('The magnitude of poles are |Z(pole)|  =  %1.4f %1.4f %1.4f %1.4f \n',m_poles(1),m_poles(2),m_poles(3),m_poles(4) );
fprintf('The max value of |Z(pole)|  =  %1.4f \n',(max(m_poles)) );
phase_poles = rad2deg(angle(poles_d));
fprintf('The phase of poles are Z(phase)  =  %1.4f %1.4f %1.4f %1.4f \n',phase_poles(1),phase_poles(2),phase_poles(3),phase_poles(4) );
fprintf('The max value of angle Z(pole)  =  %1.4f \n',(max(phase_poles)) );
for i = 1:1:length(m_poles)
    if(m_poles(i) > 1)
        counter = 1;
    else
        counter = 0;
    end
end
if counter == 1
    disp('Stablity :- Filter is Unstable');
else
    disp('Stablity: - Filter is Stable');
end

ws = 2*pi*fs;
T = 1/fs;
f1 = 2e3;
w1 = 2*pi*f1;
w = 0:100:ws/2;
z = 1; 
temp = eval(HdZ);
A = zeros(1,length(w));
D =  zeros(1,length(w));

for k = 1:1:length(w)
    z = exp(1i*w(k)*T); % Place Discretize angular frequecy
    A(k) = che_filter(1i*w(k)/w1); % Analog Chebsev Response
    A(k) = A(k)/che_filter(0); % Normalize value of analog filter 
    D(k) = eval(HdZ); % Taking value of the digital filter
    D(k) = D(k)/temp; % Normalizing value of digital filter
end
disp('%------------------------------Question 1.(c)--------------------')
figure(2)
subplot(2,1,1)
plot(w,abs(A));grid on;ylabel('|H(jw)| Magnitude');xlabel('angular frequency');title('Analog Filter Response'); 
subplot(2,1,2)

plot(w,angle(A));grid on;ylabel('H(jw) angle');xlabel('angular frequency');title('Analog Filter Response');
figure(3)
subplot(2,1,1)
plot(w,abs(D),'--');grid on;ylabel('|H(exp(jw))| Magnitude');xlabel('angular frequency');title('Digital Filter Response'); 
subplot(2,1,2)

plot(w,angle(D),'--');grid on;ylabel('H(exp(jw)) angle');xlabel('angular frequency');title('Digital Filter Response');
%%%-----------------------------Question 2---------------------------------
%TASK 2: Repeat task (1) for f1= 2KHz and fs=20KHz. Compare |Zp|max in task 2 and task 1 as well as approximation 
%accuracy of (1) relative to(0).
close all;clear;
[num,deno] = residue(0.379051,[1 1.197386 1.716866 1.025455 0.379501]);
q = length(deno);fs = 20e3;syms s y k t T
T = 1/fs;
deno = deno*(2*pi*2000);
for i = 1:q
    f = num(i)/(s - deno(i)); % Taking partial fraction of Chebyshev Low Pass Filter
    y = ilaplace(f); % Inverse Trasforamtion 
    y = subs(y,t,k*T);% Repalce t with nT
    y = eval(y); % Evaluation of the discrete time 
    Hdz(i) = ztrans(y); %Convert to Z transform 
    Hdz(i) = vpa(Hdz(i),4); % Round to fraction 
    [g(i),h(i)] = numden(Hdz(i)); %Seperate Numberator and Denomenator
    p(i) = solve(h(i) == 0); % Finding Poles of the equation
    z(i) = solve(g(i) == 0);%  Finding Zeros of the equation 
    p(i) = vpa(p(i),4); 
end
disp('%------------------Question 2.(a)----------------------------------')
HdZ = vpa(Hdz(1)+Hdz(2)+Hdz(3)+Hdz(4),4) % Convert to Discrete Domain Transfer Function
poles = vpa(p,4);
poles_d = double(poles);
zeros_v = vpa(z,4);
zeros_d = double(zeros_v);
disp('%------------------------------------Question 2(b)-----------------------%%')
figure(1);
zplaneplot(zeros_d,poles_d); % Plotting the poles of the 
legend('zeros','poles');
title('Poles for the Z plane for f1 = 2khz and fs = 20khz');
m_poles = abs(poles_d) ;
fprintf('The magnitude of poles are |Z(pole)|  =  %1.4f %1.4f %1.4f %1.4f \n',m_poles(1),m_poles(2),m_poles(3),m_poles(4) );
fprintf('The max value of |Z(pole)|  =  %1.4f \n',(max(m_poles)) );
phase_poles = rad2deg(angle(poles_d));
fprintf('The phase of poles are Z(phase)  =  %1.4f %1.4f %1.4f %1.4f \n',phase_poles(1),phase_poles(2),phase_poles(3),phase_poles(4) );
fprintf('The max value of angle Z(pole)  =  %1.4f \n',(max(phase_poles)) );
for i = 1:1:length(m_poles)
    if(m_poles(i) > 1)
        counter = 1;
    else
        counter = 0;
    end
end
if counter == 1
    disp('Stablity :- Filter is Unstable');
else
    disp('Stablity: - Filter is Stable');
end

ws = 2*pi*fs;
T = 1/fs;
f1 = 2e3;
w1 = 2*pi*f1;
w = 0:100:ws/2;
z = 1; 
temp = eval(HdZ);
A = zeros(1,length(w));
D =  zeros(1,length(w));

for k = 1:1:length(w)
    z = exp(1i*w(k)*T); % Place Discretize angular frequecy
    A(k) = che_filter(1i*w(k)/w1); % Analog Chebsev Response
    A(k) = A(k)/che_filter(0); % Normalize value of analog filter 
    D(k) = eval(HdZ); % Taking value of the digital filter
    D(k) = D(k)/temp; % Normalizing value of digital filter
end
disp('%------------------------------Question 2.(c)--------------------')
figure(2)
subplot(2,1,1)
plot(w,abs(A));grid on;ylabel('|H(jw)| Magnitude');xlabel('angular frequency');title('Analog Filter Response'); 
subplot(2,1,2)

plot(w,angle(A));grid on;ylabel('H(jw) angle');xlabel('angular frequency');title('Analog Filter Response');
figure(3)
subplot(2,1,1)
plot(w,abs(D),'--');grid on;ylabel('|H(exp(jw))| Magnitude');xlabel('angular frequency');title('Digital Filter Response'); 
subplot(2,1,2)

plot(w,angle(D),'--');grid on;ylabel('H(exp(jw)) angle');xlabel('angular frequency');title('Digital Filter Response');

%%%----------------------------Question 3---------------------------------
% TASK 3: Repeat task (1) for f1= 3KHz and fs=15KHz. Compare the pole location here and those in task 1 (B).
close all;clear;
[num,deno] = residue(0.379051,[1 1.197386 1.716866 1.025455 0.379501]);
q = length(deno);fs = 15e3;syms s y k t T
T = 1/fs;
deno = deno*(2*pi*3000);
for i = 1:q
    f = num(i)/(s - deno(i)); % Taking partial fraction of Chebyshev Low Pass Filter
    y = ilaplace(f); % Inverse Trasforamtion 
    y = subs(y,t,k*T);% Repalce t with nT
    y = eval(y); % Evaluation of the discrete time 
    Hdz(i) = ztrans(y); %Convert to Z transform 
    Hdz(i) = vpa(Hdz(i),4); % Round to fraction 
    [g(i),h(i)] = numden(Hdz(i)); %Seperate Numberator and Denomenator
    p(i) = solve(h(i) == 0); % Finding Poles of the equation
    z(i) = solve(g(i) == 0);%  Finding Zeros of the equation 
    p(i) = vpa(p(i),4); 
end
disp('%------------------Question 3.(a)----------------------------------')
HdZ = vpa(Hdz(1)+Hdz(2)+Hdz(3)+Hdz(4),4) % Convert to Discrete Domain Transfer Function
poles = vpa(p,4);
poles_d = double(poles);
zeros_v = vpa(z,4);
zeros_d = double(zeros_v);
disp('%------------------------------------Question 3(b)-----------------------%%')
figure(1);
zplaneplot(zeros_d,poles_d); % Plotting the poles of the 
legend('zeros','poles');
title('Poles for the Z plane for f1 = 3khz and fs = 15khz');
m_poles = abs(poles_d) ;
fprintf('The magnitude of poles are |Z(pole)|  =  %1.4f %1.4f %1.4f %1.4f \n',m_poles(1),m_poles(2),m_poles(3),m_poles(4) );
fprintf('The max value of |Z(pole)|  =  %1.4f \n',(max(m_poles)) );
phase_poles = rad2deg(angle(poles_d));
fprintf('The phase of poles are Z(phase)  =  %1.4f %1.4f %1.4f %1.4f \n',phase_poles(1),phase_poles(2),phase_poles(3),phase_poles(4) );
fprintf('The max value of angle Z(pole)  =  %1.4f \n',(max(phase_poles)) );
for i = 1:1:length(m_poles)
    if(m_poles(i) > 1)
        counter = 1;
    else
        counter = 0;
    end
end
if counter == 1
    disp('Stablity :- Filter is Unstable');
else
    disp('Stablity: - Filter is Stable');
end

ws = 2*pi*fs;
T = 1/fs;
f1 = 3e3;
w1 = 2*pi*f1;
w = 0:100:ws/2;
z = 1; 
temp = eval(HdZ);
A = zeros(1,length(w));
D =  zeros(1,length(w));

for k = 1:1:length(w)
    z = exp(1i*w(k)*T); % Place Discretize angular frequecy
    A(k) = che_filter(1i*w(k)/w1); % Analog Chebsev Response
    A(k) = A(k)/che_filter(0); % Normalize value of analog filter 
    D(k) = eval(HdZ); % Taking value of the digital filter
    D(k) = D(k)/temp; % Normalizing value of digital filter
end
disp('%------------------------------Question 3.(c)--------------------')
figure(2)
subplot(2,1,1)
plot(w,abs(A));grid on;ylabel('|H(jw)| Magnitude');xlabel('angular frequency');title('Analog Filter Response'); 
subplot(2,1,2)

plot(w,angle(A));grid on;ylabel('H(jw) angle');xlabel('angular frequency');title('Analog Filter Response');
figure(3)
subplot(2,1,1)
plot(w,abs(D),'--');grid on;ylabel('|H(exp(jw))| Magnitude');xlabel('angular frequency');title('Digital Filter Response'); 
subplot(2,1,2)

plot(w,angle(D),'--');grid on;ylabel('H(exp(jw)) angle');xlabel('angular frequency');title('Digital Filter Response');
%---------------------------------------------Question 4------------------
% TASK 4: Repeat task (2) for f1= 4KHz and fs=40KHz. Compare the pole location here and those in task 2.
close all;clear;
[num,deno] = residue(0.379051,[1 1.197386 1.716866 1.025455 0.379501]);
q = length(deno);fs = 40e3;syms s y k t T
T = 1/fs;
deno = deno*(2*pi*4000);
for i = 1:q
    f = num(i)/(s - deno(i)); % Taking partial fraction of Chebyshev Low Pass Filter
    y = ilaplace(f); % Inverse Trasforamtion 
    y = subs(y,t,k*T);% Repalce t with nT
    y = eval(y); % Evaluation of the discrete time 
    Hdz(i) = ztrans(y); %Convert to Z transform 
    Hdz(i) = vpa(Hdz(i),4); % Round to fraction 
    [g(i),h(i)] = numden(Hdz(i)); %Seperate Numberator and Denomenator
    p(i) = solve(h(i) == 0); % Finding Poles of the equation
    z(i) = solve(g(i) == 0);%  Finding Zeros of the equation 
    p(i) = vpa(p(i),4); 
end
disp('%------------------Question 4.(a)----------------------------------')
HdZ = vpa(Hdz(1)+Hdz(2)+Hdz(3)+Hdz(4),4) % Convert to Discrete Domain Transfer Function
poles = vpa(p,4);
poles_d = double(poles);
zeros_v = vpa(z,4);
zeros_d = double(zeros_v);
disp('%------------------------------------Question 4(b)-----------------------%%')
figure(1);
zplaneplot(zeros_d,poles_d); % Plotting the poles of the 
legend('zeros','poles');
title('Poles for the Z plane for f1 = 4khz and fs = 40khz');
m_poles = abs(poles_d) ;
fprintf('The magnitude of poles are |Z(pole)|  =  %1.4f %1.4f %1.4f %1.4f \n',m_poles(1),m_poles(2),m_poles(3),m_poles(4) );
fprintf('The max value of |Z(pole)|  =  %1.4f \n',(max(m_poles)) );
phase_poles = rad2deg(angle(poles_d));
fprintf('The phase of poles are Z(phase)  =  %1.4f %1.4f %1.4f %1.4f \n',phase_poles(1),phase_poles(2),phase_poles(3),phase_poles(4) );
fprintf('The max value of angle Z(pole)  =  %1.4f \n',(max(phase_poles)) );
for i = 1:1:length(m_poles)
    if(m_poles(i) > 1)
        counter = 1;
    else
        counter = 0;
    end
end
if counter == 1
    disp('Stablity :- Filter is Unstable');
else
    disp('Stablity: - Filter is Stable');
end

ws = 2*pi*fs;
T = 1/fs;
f1 = 4e3;
w1 = 2*pi*f1;
w = 0:100:ws/2;
z = 1; 
temp = eval(HdZ);
A = zeros(1,length(w));
D =  zeros(1,length(w));

for k = 1:1:length(w)
    z = exp(1i*w(k)*T); % Place Discretize angular frequecy
    A(k) = che_filter(1i*w(k)/w1); % Analog Chebsev Response
    A(k) = A(k)/che_filter(0); % Normalize value of analog filter 
    D(k) = eval(HdZ); % Taking value of the digital filter
    D(k) = D(k)/temp; % Normalizing value of digital filter
end
disp('%------------------------------Question 4.(c)--------------------')
figure(2)
subplot(2,1,1)
plot(w,abs(A));grid on;ylabel('|H(jw)| Magnitude');xlabel('angular frequency');title('Analog Filter Response'); 
subplot(2,1,2)

plot(w,angle(A));grid on;ylabel('H(jw) angle');xlabel('angular frequency');title('Analog Filter Response');
figure(3)
subplot(2,1,1)
plot(w,abs(D),'--');grid on;ylabel('|H(exp(jw))| Magnitude');xlabel('angular frequency');title('Digital Filter Response'); 
subplot(2,1,2)

plot(w,angle(D),'--');grid on;ylabel('H(exp(jw)) angle');xlabel('angular frequency');title('Digital Filter Response');

%%%%%%%---------------------------------------------End of Code 4---------

