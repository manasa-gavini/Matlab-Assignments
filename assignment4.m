wc= 0.19*pi ;
ws= 0.21 *pi;
w=[0:0.06*pi:wc,ws:0.06*pi:pi];

H=zeros(size(w));
H(w<=wc)=1;
a=0;
H(w>=ws)=a;

N=length(w);
A=zeros(N,N);
for i=1:1:N
    for j=1:1:N
        A(i,j)=exp(-complex(0,1)*w(i)*(j-1));
    end
end

A1=(A.')*A;
A2=(A1)\(A.');
h=A2*(H.');
n=[0:1:length(w)-1].';

y=zeros(size(w));
for w0=1:length(w)
e=exp(-complex(0,1)*w(w0)*n);
xe=h.*e;
y(w0)=sum(xe);
end

figure(1);
plot(w/pi, 20*log(abs(y))/log(10));
title("Magnitude of Frequency Response using Least-Squares");
xlabel("Noramlized Frequency (*pi rad/sample)");
ylabel("Magnitude of Frequency Response");

%Using MATLAB inbuilt function
b = firls(310,[0 0.19 0.21 1],[1 1 a a]);
fvtool(b,1,'OverlayedAnalysis','phase')


