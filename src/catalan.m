function cn = catalan(n)
% Computes the nth catalan number via the formula 1/(n+1)*(2n choose n)
cn = (1/(n+1))*nchoosek(2*n,n);
end

