function res = firstorder(m)
% Compute the first order term of the magnitude function of the Euclidean 
% (2m+1) dimenstional ball at t = 0.
% Compute D0:
D0 = roof(m-1,0);
% Compute N0:
N0 = roof(m+1,2);
% Compute Np0:
Np0 = 0;
for p = 1:(m+1)
    for q = 0:(m+1-p)
        Np0 = Np0 + sigma(m+1,p,q,2);
    end
end
% Compute Dp0:
Dp0 = 0;
for p = 1:(m-1)
    for q = 0:(m-1-p)
        Dp0 = Dp0 + sigma(m-1,p,q,0);
    end
end
res = (Np0*D0-N0*Dp0)/(factorial(2*m+1)*D0^2);
end

