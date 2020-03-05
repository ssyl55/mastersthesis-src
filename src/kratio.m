function prod = kratio(lower,upper)
% Computes prod_(k=lower)^(upper) of (2k-2)/(2k-1)
prod = 1;
for k = lower:upper
    prod = prod * ((2*k-2)/(2*k-1));
end
end

