function vol = V1(m)
% Compute the first intrinsic volume of the Euclidean (2m+1) dimensional
% ball using the Kubota formula.
vol = ((2*m+1)*sqrt(pi)*gamma(m+1))/(gamma(m+(3/2)));
end
