close All;
clear All;
clc;
x=input('x =');
h=input('h=');
L=input('L=');
N1=length(x);
M=length(h);
x=[x zeros(1,mod(N1,L)) zeros(1,L)];
N2=length(x);
h=[h zeros(1,L-1)];
H=fft(h,L+M-1);
S=N2/L;
index=1:L;
xm=x(index);		
x1=[zeros(1,M-1) xm];
disp(x1);
X=[];
for stage=1:S
    X1=fft(x1,L+M-1);
    Y=X1.*H;
    Y=ifft(Y);
    fprintf('%d stage\n',stage);
    disp('after conv');
    disp(Y);
    index2=M:M+L-1;
    Y=Y(index2);
    disp('after discarding');
    disp(Y);
    X=[X Y];
    index3=(((stage)*L)-M+2):((stage+1)*L);		
    if(index3(L+M-1)<=N2)
    x1=x(index3);
    disp('selected');
    disp(x1);
    end
end;
disp(X);
stem(X);
title('Convolution Using Overlap save Method')
xlabel('n');
ylabel('y(n)');
