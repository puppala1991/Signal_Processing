Fs = 34133;            % Sampling frequency                    
T = 1/Fs;              % Sampling period       
L = 1024;              % Length of signal
t = (0:L-1)*T;         % Time vector

freq1 = 100;
freq2 = 500;
S = (0.7*sin(2*pi*freq1*t))+(0.3*sin(2*pi*(freq2)*t));
plot(S);
pause;

%FFT
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

plot(f,P1) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
pause;

%observer spectral leakage for signal covering non int number cycles in
%sampled period
L = 512;               % Length of signal
t = (0:L-1)*T;         % Time vector

freq1 = 100;
freq2 = 500;
S = (0.7*sin(2*pi*freq1*t))+(0.3*sin(2*pi*(freq2)*t));
plot(S);
pause;

%FFT
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

plot(f,P1) 
title('Single-Sided Amplitude Spectrum of S(t)-Spectral Leakage')
xlabel('f (Hz)')
ylabel('|P1(f)|')
pause;

