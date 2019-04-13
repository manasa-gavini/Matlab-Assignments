function [y] = generate_pulse_train(t,A)

y = zeros( size(t) );

k = -6;
while k <= 6
    p = -1 + k*6;
    q = 1 + k*6;
    
    y(t<=q & t>=p) =  A;
    
    k = k+1;
end




end

