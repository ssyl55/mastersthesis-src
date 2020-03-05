function am = aM(height, delta)
% Compute the product of the weights on a path starting at height i =
% height with (i-2) ascents, one descent, two ascents, and (i-1) descents
% or the mirror image.
am = 1;
for i = 1:(height-1)
    am = am * ((height + i) + 1 - delta);
end
    i = i - 1;
    am = am * ((height + i) + 1 - delta);
end