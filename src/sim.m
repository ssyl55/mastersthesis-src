function sim = sim(D)
%sim Compute the similarity matrix from a distance matrix
sim = exp(-D);
end

