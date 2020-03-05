function f = fs(height, delta)
% Compute the product of the weights(delta) of the pth path containing one
% flat step. Note that the weights for a path with a centered flat step is 
% the same as the weights for a path with a flat step off centered by one.
f = 1;
for i = 1:(height - 1)
    f = f * ((height + i) + 1 - delta);
end
end
