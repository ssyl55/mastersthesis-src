function res = DpoverD(m)
% Computes D'/D.
res = 0;

for p = 1:(m-1)
    for q = 0:(m-1-p)
        res = res + (1/(2*p+1))*kratiodelta0(p+1,p+q);
    end
end
end