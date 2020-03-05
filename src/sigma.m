function prod = sigma(k,p,q,delta)
% Compute the total product of the weights (delta) of sigma_{p,q}^k.
prod = 1;
% V's until height (p-1).
for i = 0:(p-1)
    prod = prod * V(i,delta);
end
% flat step at height p.
prod = prod * fs(p,delta);
% M's from height p + 1 to p + q.
for i = (p+1):(p+q)
    prod = prod * M(i,delta);
end
%V's from height p + q + 1 to k.
for i = (p+q+1):k
    prod = prod * V(i,delta);
end
end

