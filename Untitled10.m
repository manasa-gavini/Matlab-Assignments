t = -19:0.5:19;

A=5;
y = zeros( size(t) );
k = -6;
while k <= 6
p = -1 + k*6;
q = 1 + k*6;
pulse_train(t<=q & t>=p) = A;
k = k+1;
end




T=6;
del=0.5;
p=100;
k = -p;
i=1;
w = (2/T)*pi;

while k <=p
x = pulse_train.* exp(-1i*k*w*t);

f_coeff(i) = trapz( 0:del:T, x(t>=0 & t<=T) )*1/T;
k = k+1;
i = 1+i;
end


stem(pulse_train);
figure;

stem(abs(f_coeff));
figure;
stem(angle(f_coeff));


