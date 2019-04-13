close all
clear all
clc

%impulse response of ideal low pass filter

fc=1000;
wc=2*pi*fc;
t=-8*1/fc:0.00001:8*1/fc;
ht=2*fc*sinc(2*fc*t);
figure(1);
plot(t,ht);
title("Impulse response of ideal low pass filter(continuos)");
xlabel("t"); 
ylabel("h(t)"); 


ts0=1/(2*fc); 
t0=-8*1/fc:0.00001:8*1/fc;
ht0=2*fc*sinc(2*fc*t0);
figure(2);
stem(t0,ht0);
title("Impulse response of ideal low pass filter");
xlabel("t"); 
ylabel("h(t)");

%Upsampling the signal

ts1=1/(5*2*fc);
t2=-8*1/fc:ts1:8*1/fc;
ht2=2*fc*sinc(2*fc*t2);
figure(3);
subplot(2,1,1);
stem(t2,ht2);
xlabel("t"); 
ylabel("h(t)");
title("impulse response of ideal low pass filter(sampling rate = 5*wc)");
subplot(2,1,2);
plot(abs(fftshift(fft(ht2))));
xlabel("w");
ylabel("H(w)");

%Down Sampling

ts2=1/(2*fc/5);
t3=-8*1/fc:ts2:8*1/fc;
ht3=2*fc*sinc(2*fc*t3);
figure(4);
subplot(2,1,1);
stem(t3,ht3);
title("impulse response of ideal low pass filter(sampling rate = wc/5)");
subplot(2,1,2);
plot(abs(fftshift(fft(ht3))));
xlabel("w");
ylabel("H(w)");

 
