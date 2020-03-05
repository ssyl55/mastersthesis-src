function N2p0 = N2p0(m)
% Compute N''(0) for dimension 2m+1.
N2p0 = sigma2sum(m,2) + 2*Lsum(m,2);
end

