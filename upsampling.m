function [p] = upsampling(y,factor)

num_zeros = zeros([1,factor - 1]);

p  = y(1);

for i = 1:length(y)-1

    p = [p,num_zeros,y(i+1)];

end


end

