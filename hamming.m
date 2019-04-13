m=310; 

n=0:1:m-1; 

p=n-(m-1)/2; 

fc=0.1; 

Z=sin(2*pi*fc*p)./(pi*p); 

[h,w]=freqz(Z); 

figure(1);
subplot(2,1,1);

plot(w/pi,abs(h)); 

title('Frequency response of the sin function') 

xlabel('Frequency') 

ylabel('Amplitude') 



s=2*pi*(n/(m-1)); 

w=0.54-0.46*cos(s); 

t=Z.*w; 

[h,w]=freqz(t); 



subplot(2,1,2)
plot(w/pi,abs(h));grid 

xlabel('Frequency') 

ylabel('Magnitude') 

title('Windowed sine function frequency response') 

figure;grid 

freqz(t) 

title('Windowed sine function frequency response( in dB)') 