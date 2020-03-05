function sigma2sum = sigma2sum(m,delta)
% Compute sum of sigma2(m-1/m+1(delta),p1,p2,q1,q2) for all p1,p2,q1,q2.
max = 0;
if delta == 0
    max = m - 1;
elseif delta == 2
    max = m + 1;
end

sigma2sum = 0;
for p1 = 1:(max-1)
    for p2 = (p1+1):max
        for q1 = 0:(p2-p1-1)
            for q2 = 0:(max-p2)
                sigma2sum = sigma2sum + sigma2(max,p1,p2,q1,q2,delta);
            end
        end
    end
end
end

