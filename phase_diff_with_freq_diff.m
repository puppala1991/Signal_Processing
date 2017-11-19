f1 = 13;
f2 = 21;
Fs = 1000;
dt = 1/Fs;
t = 0:dt:1-dt;

x = cos(2*pi*f1*t);
y = cos(2*pi*f2*t);

h1 = hilbert(x);
h2 = hilbert(y);

angle1 = angle(h1);
angle2 = angle(h2);

angle_diff = unwrap(angle1)-unwrap(angle2);

figure;
subplot(311);
plot(t,angle1,t,x);
ylabel('instantaneous phase');
xlabel('time');
subplot(312);
plot(t,angle2,t,y);
ylabel('instantaneous phase');
xlabel('time');
subplot(313);
plot(t,(angle_diff*180/pi));
ylabel('instantaneous phase');
xlabel('time');