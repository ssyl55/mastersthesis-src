function m = M(height, delta)
% Compute the product of the weights (dependant on delta) of the path
% starting at i = height consisting of (i-1) ascents, 1
% descent, 1 ascent, and (i-1) descents.
m = 1;
for i = 1:(height - 1)
    m = m * ((height + i) + 1 - delta);
end
m = m * ((height + i) + 1 - delta);
end