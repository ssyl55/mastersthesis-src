function mags = magfinite(X,p,ts)
%magfinite Calculate the magnitude of a finite space
%   X   - finite column matrix of points
%   p   - which norm to use
%   ts  - scaling parameters t
mags = zeros(length(ts),1);
for i = 1:length(mags)
    weighting = sim(dist(X,p,ts(i)))\ones(length(X(1,:)),1);
    mags(i) = sum(weighting);
    %mags(i) = sum(sum(inv(exp(-dist(X,p,ts(i))))));
end
end

