function hn = harmonic(n)
% Computes the nth harmonic number via the formula Hn = sum_{k=1}^n 1/k
hn = 0;
for k = 1:n
    hn = hn + 1/k;
end
end

