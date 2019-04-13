clc;
clear;
close all;

%assigning variables

wp=0.25*pi;     %Passband frequency
ws=0.4*pi;     %Stopband frequency
T=2;
g1=1;
g2=30;
H_s=1;

%Step1:finding ratio of stop and passband 
Wp=tan(wp/2);
Ws=tan(ws/2);
r=Ws/Wp;

%finding gain
A1=10^(-g1/20);
A2=10^(-g2/20);

%step2: find N
N = ceil(0.5*(log(((1/A2)^2-1)/((1/A1)^2-1))/(log(r))));
disp("N=");
disp(N);

%step3:finding cutoff frequency
w_c=((2/T)*Wp)/((((1/A1)^2-1))^(1/(2*N)));
disp("cutoff frequency");
disp(w_c);

%step4:find H(s)

%if N is even or odd
if mod(N,2)==0
  for k=1:1:N/2
    b(k)=2*sin((((2*k)-1)*pi)/(2*N));
  end
  
  for i=1:1:N/2
      H=tf(w_c^2,[1 b(i)*w_c w_c^2]);
    H_s=H_s*H;
  end
    disp(" The discrete continous time transfer function");
   disp("H(s)");
   disp(H_s);
   
else
    %if N is odd

    for k=1:1:(N-1)/2
    b(k)=2*sin((((2*k)-1)*pi)/(2*N));
    end
   for i=1:1:(N-1)/2
       H=tf(w_c^2,[1 b(i)*w_c w_c^2]);
        H_s=H_s*H;
   end
   H2=tf(w_c,[1 w_c]);
   H_s=H_s*H2;
   disp("discrete continous transfer function");
   disp("H(s)");
   disp(H_s);
end
[x,y]=tfdata(H_s,'v');
[c,d]=bilinear(x,y,1/2);
disp("discrete time transfer function");
disp(H_s);
freqz(c,d);