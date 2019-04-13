w1 = 0.25*pi; 

w2 = 0.4*pi; 

a1 = 1; 

a2 = 30; 

T = 2; 

wp = tan(w1/2); 

ws = tan(w2/2); 

[N,wc] = cheb1ord(wp,ws,a1,a2,'s'); 

[b,a] = cheby1(N,a1,wc,'s'); 

[b,a] = bilinear(b,a,1/T); 

freqz(b,a); 

title('Response of Chebyshev1 Filter Function'); 

a1 = 10^((-1*a1)/20); 

E = (a1^-2 - 1)^0.5; 

a2 = 10^(-a2/20); 

N = acosh((1/E)*(((a2^-2)-1)^0.5)); 

N = N / acosh(ws/wp); 

N = ceil(N); 

wc = E^(-1/N) * wp; 

Y = ( 1 + (E^-2) )^0.5 + (E^-1) ; 

yn = ( Y^(1/N) ) -  ( Y^(-1/N) ); 

yn = 0.5 * yn; 

if mod(N,2 ) 

    K = 1:((N-1)/2); 

else 

    K = 1:(N/2); 

end 

bk = 2*yn*sin((2*K - 1 )*pi/(2*N)); 

if mod(N,2) 

    K = 1:((N-1)/2); 

else 

    K = 1:(N/2); 

end 

ck = (yn^2) + (cos(((2*K-1).*pi)./(2*N))).^2; 

if mod(N,2) 

    Bk = ck; 

else 

    mul  = (1 + E^2)^0.5; 

    Bk = ck * mul ;  

end 

flag = 0; 

if mod(N,2) 

    K = ((N-1)/2); 

    flag = 1; 

else 

    K = (N/2); 

end 

i = 1 ; 

num = Bk(i) * (wc^2); 

den = [ 1 , bk(i)*wc, ck(i) * (wc^2) ]; 

for i = 2:K 

    num_temp = Bk(i) * wc^2; 

    den_temp = [ 1 , bk(i)*wc, ck(i) * (wc^2) ]; 

    num = num * num_temp ; 

    den = conv(den,den_temp); 

     

end 

if flag  

    bo = yn; 

    co = yn; 

    num_temp = bo * wc^2 ;  

    den_temp = [ 1 , co  * wc ]; 

    num = num*num_temp; 

    den = conv(den,den_temp);  

end 

b= num; 

a = den; 

concat = zeros([1,N]); 

b = [concat,b]; 

[b,a] = bilinear(b,a,1/T); 

figure; 

freqz(b,a); 

title('Response of our Custom Chebyshev 1 Filter Function'); 