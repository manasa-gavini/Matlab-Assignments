close all
clear all
clc

x1=[1 1 1];
x2=[2 0 1 7 0 0 2 0 1 9 8];
l1=length(x1);
l2=length(x2);
X1=[x1,zeros(1,l2)];
X2=[x2,zeros(1,l1)];
N=l1+l2-1;

%linera convolution
y=zeros(1,N);

for n = 1:1:N
   for k= 1:1:l1
       if(n-k+1>0)
            y(n)=y(n)+X1(k)*X2(n-k+1);
       else
       end
   end
end 
figure(1);
stem(y);
title("Linear Convolution");
xlabel("n"); 
ylabel("y(n)"); 
disp(y);

