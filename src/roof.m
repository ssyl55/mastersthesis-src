function d = roof(k,delta)
% Compute the total product of weights(delta) of sigma_{roof}^k.
d = 1;
for i = 0:k
    d = d * V(i,delta);
end
end

