function D = dist(X,p,t)
%dist Compute the distance matrix of a set of points X
%   X - points
%   p - which p norm we're using
%   t - scaling parameter

n = length(X(1,:));
D = zeros(n,n);
for row = 1:n
    for col = 1:n
        D(row,col) = t*(norm(X(:,row)-X(:,col),p));
    end
end
end