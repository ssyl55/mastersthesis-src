function D2p0 = D2p0(m)
% Compute D''(0) for dimension 2m+1.
D2p0 = sigma2sum(m,0) + 2*Lsum(m,0);
end

