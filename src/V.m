function v = V(height, delta)
% Compute the product of the weights (depending on the delta parameter) of
% the path starting at i = height consisting of i ascents and i descents.
v = 1;
for i = 1:height
    v = v * ((height + i) + 1 - delta);
end
end
