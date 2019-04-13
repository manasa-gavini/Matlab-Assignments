function [y] = CalFourierCoeff(sig,t,T,del,p)
    
k = -p;
i=1;
w = (2/T)*pi;



while k <=p
    x = sig .* exp(-1i*k*w*t);
    y(i) = trapz( 0:del:T, x(t>=0 & t<=T) )*1/T;    
    k = k+1;
    i = 1+i;
end


end

