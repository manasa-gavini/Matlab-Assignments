clc

 
 high_sampling_rate = 5000;
 f = 1200;
 w = 2*pi*f;
 duration = 10; % 10 s long
 t = 0: 1/high_sampling_rate : duration;
 y = sinc(t*f*2) * 2*f;

f_filter = 5^3;
sampling_freq_1 = 10^3;
sampling_freq_2 = 20^3;

t1 = 0:1/sampling_freq_1:6*1/f_filter;
t2 = 0:1/sampling_freq_2:6*1/f_filter;

w_filter = 2*f_filter*pi;

y1 =  sinc(w_filter*t1) *2 * w_filter;
y2 =  sinc(w_filter*t2) *2 * w_filter;

stem(t1,y1);
figure;
stem(t2,y2);
figure;

upsampled_y = upsampling(y,5); 
downsampled_y = downsampling(y,5);  

y_new = upsampling(y,3); 
y_new = downsampling(y_new,2);


fft_upsampled_y = fft(upsampled_y);
fft_downsampled_y = fft(downsampled_y);
fft_y_new = fft(y_new);


plot(abs(fft_upsampled_y));
figure;
plot(abs(fft_downsampled_y));
figure;
plot(abs(fft_y_new));
figure;

pulse_del = 0.1;
pulse_t = -19:pulse_del:19;

pulse_train = generate_pulse_train(pulse_t,5);
f_coeff = CalFourierCoeff(pulse_train,pulse_t,6,pulse_del,100);


stem(pulse_train);
figure;

stem(abs(f_coeff));figure;
stem(angle(f_coeff));




