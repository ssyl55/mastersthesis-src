function res = kratiosimp2(a,b)
res = ((2^(2*b-1))/(2^(2*(a-1)-1)))*(((a-1)*nchoosek(2*(a-1),a-1))/(b*nchoosek(2*b,b)));
end

