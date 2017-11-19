f1 = 13;
f2 = 21;
Fs = 1000;
dt = 1/Fs;
t = 0:dt:1-dt;
L = size(t,2);

x = cos(2*pi*f1*t+(pi/2));
y = 0.5*cos(2*pi*f2*t+(pi/4));

X = fft(x);
threshold = max(abs(X))/10000;
X2 = X;
X2(abs(X)<threshold) = 0;

Y = fft(y);
threshold = max(abs(Y))/10000;
Y2 = Y;
Y2(abs(Y)<threshold) = 0;


f = Fs*(0:(L/2))/L;

P2 = abs(X/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P4 = abs(Y/L);
P3 = P4(1:L/2+1);
P3(2:end-1) = 2*P3(2:end-1);

subplot(411);
plot(f,P1);
title('Retrieving amplitude and freq');

subplot(413);
plot(f,P3);
title('Retrieving amplitude and freq');

lx = length(x);
f = (-lx/2:lx/2-1)/lx*Fs;
phs = angle(fftshift(X2));
subplot(412);
plot(f,phs*180/pi);
ylabel('phase angle');
xlabel('frequency');
title('Retrieving Phase');

ly = length(y);
f = (-ly/2:ly/2-1)/ly*Fs;
phs = angle(fftshift(Y2));
subplot(414);
plot(f,phs*180/pi);
ylabel('phase angle');
xlabel('frequency');
title('Retrieving Phase');




