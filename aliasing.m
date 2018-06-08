%aliasing frequency appears at |f-(N*Fs)| where N is an integer; f is the
%freq of the signal and Fs is the sampling frequency.

%here we have |3000-(1*2048)| = 952Hz is the theoretical expected aliasing
%frequency

Fs = 2048;             % Sampling frequency                    
T = 1/Fs;              % Sampling period       
L = 1024;              % Length of signal
t = (0:L-1)*T;         % Time vector

freq1 = 3000;
S = 0.7*sin(2*pi*freq1*t);
plot(S);
pause;

%FFT
Z_fft = fft(S);
threshold = max(abs(Z_fft))/10000;
Z = Z_fft;
Z(abs(Z_fft)<threshold) = 0;

L = length(z);
f = (Fs/L)*(0:L/2);
Z2 = abs(Z_fft/L);
Z1 = Z2(1:L/2+1);
Z1(2:end-1) = 2*Z1(2:end-1);

plot(f,Z1)
xlabel('frequency');
ylabel('Amplitude');
