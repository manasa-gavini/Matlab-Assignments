close all
clear all
clc

x=[1 1 1];
h=[2 0 1 7 0 0 2 0 1 9 8];

m=length(x);
n=length(h);

if(m>n)
    h=[h,zeros(1,m-n)];
    n=m;
end
x=[x,zeros(1,n-m)];
m=n;

y=zeros(1,n);

y(1)=0;

a(1)=h(1);



for j=2:n
    a(j)=h(n-j+2);
end
%ciruclar conv

for i=1:n
    y(1)=y(1)+x(i)*a(i);
end



for k=2:n
    y(k)=0;
    % circular shift
    for j=2:n
        x2(j)=a(j-1);
    end
    
    x2(1)=a(n);
    
    for i=1:n
        if(i<n+1)
            a(i)=x2(i);
            y(k)=y(k)+x(i)*a(i);
        end
    end
end
disp(y);
figure(1);
stem(y);
title("Circular Convolution");
xlabel("n");
ylabel("y(n)");


