function mu = mu(m)
% Computes N''-d!D'' using a simplification via the mu-trick.

sig2sum = 0;
% First flat step at 1, second flat step anywhere else.
p1 = 1;
for p2 = (p1+1):(m+1)
    for q1 = 0:(p2-p1-1)
        for q2 = 0:(m+1-p2)
            sig2sum = sig2sum + sigma2(m+1,p1,p2,q1,q2,2);
        end
    end
end

% First flat step >= 2, second flat step at m
for p1 = 2:(m-1)
    p2 = m;
    for q1 = 0:(p2-p1-1)
        % Can't have roof above p2.
        q2 = m+1-p2;
        sig2sum = sig2sum + sigma2(m+1,p1,p2,q1,q2,2);
    end
end

% First flat stept >= 2, second flat step at m+1
for p1 = 2:m
    p2 = m+1;
    for q1 = 0:(p2-p1-1)
        q2 = 0;
        sig2sum = sig2sum + sigma2(m+1,p1,p2,q1,q2,2);
    end
end

% First flat step > 1, second flat step <= m-1, all M's above second flat
% step.
for p1 = 2:m
    for p2 = (p1+1):(m-1)
        for q1 = 0:(p2-p1-1)
            q2 = m+1-p2;
            sig2sum = sig2sum + sigma2(m+1,p1,p2,q1,q2,2);
        end
    end
end

Lsum = 0;
% First flat step at 1, second flat step anywhere else.
p1 = 1;
for p2 = (p1+1):(m+1)
    for q1 = 0:(m+1-p2)
        for q2 = 0:(m+1-p2-q1)
            Lsum = Lsum + L(m+1,p1,p2,q1,q2,2);
        end
    end
end

% First flat step >= 2, second flat step at m

for p1 = 2:(m-1)
    p2 = m;
    for q1 = 0:1
        % Need to fill up so no roofs at top.
        if q1 == 0
            q2 = 1;
        elseif q1 == 1
            q2 = 0;
        end
        Lsum = Lsum + L(m+1,p1,p2,q1,q2,2);
    end
end

% First flat step >= 2, second flat step at m+1

for p1 = 2:m
    p2 = m+1;
    q1 = 0;
    q2 = 0;
    Lsum = Lsum + L(m+1,p1,p2,q1,q2,2);
end

% First flat step > 1, second flat step <= m-1, all M's or aM's above.
for p1 = 2:m
    for p2 = (p1+1):(m-1)
        for q1 = 0:(m+1-p2)
            q2 = m+1-p2-q1;
            Lsum = Lsum + L(m+1,p1,p2,q1,q2,2);
        end
    end
end

mu = sig2sum + 2*Lsum;
end