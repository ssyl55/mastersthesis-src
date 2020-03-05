function Dp0 = Dp0(m)
% Compute D'(0) for dimension 2m+1
Dp0 = 0;
for p = 1:(m-1)
    for q = 0:(m-1-p)
        Dp0 = Dp0 + sigma(m-1,p,q,0);
    end
end
end

