f1 = 130;
a = 2;
ph_1 = pi/6;
f2 = 222;
b = 3;
ph_2 = pi/4;

Fs = 1000;
dt = 1/Fs;
stopTime = 1;
t = 0:dt:stopTime-dt;

x = a*cos(2*pi*f1*t+ph_1);
y = b*cos(2*pi*t*f2+ph_2);

z = x+y;

Z_fft = fft(z);
threshold = max(abs(Z))/10000;
Z = Z_fft;
Z(abs(Z_fft)<threshold) = 0;

L = length(z);
f = (Fs/L)*(0:L/2);
Z2 = abs(Z_fft/L);
Z1 = Z2(1:L/2+1);
Z1(2:end-1) = 2*Z1(2:end-1);

subplot(211);
plot(f,Z1)
xlabel('frequency');
ylabel('Amplitude');
title('Mixed signal amp and freq');

f = (Fs/L)*(-L/2:L/2-1);
phs = angle(fftshift(Z));

subplot(212);
plot(f,phs*180/pi);
xlabel('frequency');
ylabel('phase angle');
title('retrieving phase angles from mixed signal');