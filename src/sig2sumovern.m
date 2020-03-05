function res = sig2sumovern(m)
% Computes mu(sig2sum)/N.

% First case:
firstsum = 0;
for p2 = 2:(m+1)
    for q1 = 0:(p2-2)
        for q2 = 0:(m+1-p2)
            firstsum = firstsum + kratio(2,q1+1)*(1/(2*p2-1))*kratio(p2+1,p2+q2);
        end
    end
end

% Second case:
secondsum = 0;
for p1 = 2:(m-1)
    for q1 = 0:(m-p1-1)
        secondsum = secondsum + (1/(2*p1-1))*kratio(p1+1,p1+q1)*(1/(2*m-1))*((2*m)/(2*m+1));
    end
end

% Third case:
thirdsum = 0;
for p1 = 2:m
    for q1 = 0:(m+1-p1-1)
        thirdsum = thirdsum + (1/(2*p1-1))*kratio(p1+1,p1+q1)*(1/(2*m+1));
    end
end

% Fourth case:
fourthsum = 0;
for p1 = 2:m
    for p2 = (p1+1):(m-1)
        for q1 = 0:(p2-p1-1)
            fourthsum = fourthsum + (1/(2*p1-1))*kratio(p1+1,p1+q1)*(1/(2*p2-1))*kratio(p2+1,m+1);
        end
    end
end

res = firstsum + secondsum + thirdsum + fourthsum;
end

