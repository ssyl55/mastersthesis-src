function prod = sigma2(k,p1,p2,q1,q2,delta)
% Compute the total product of the weights of sigma_{p1,p2,q1,q2}^k.
prod = 1;
% V's from height 0 to (p1-1).
for i = 0:(p1-1)
    prod = prod * V(i,delta);
end
% Flat step at height p1.
prod = prod * fs(p1,delta);
% M's from p1+1 to p1+q1.
for i = (p1+1):(p1+q1)
    prod = prod * M(i,delta);
end
% V's from p1+q1+1 to p2-1.
for i = (p1+q1+1):(p2-1)
    prod = prod * V(i,delta);
end
% Flat step at p2.
prod = prod * fs(p2,delta);
% M's from p2+1 to p2+q2.
for i = (p2+1):(p2+q2)
    prod = prod * M(i,delta);
end
% V's from p2+q2+1 to k.
for i = (p2+q2+1):k
    prod = prod * V(i,delta);
end
end

