function Np0 = Np0(m)
% Compute N'(0) for dimension 2m+1.
Np0 = 0;
for p = 1:(m+1)
    for q = 0:(m+1-p)
        Np0 = Np0 + sigma(m+1,p,q,2);
    end
end
end

