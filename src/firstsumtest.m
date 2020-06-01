datapoints = 20;

ds = zeros(length(datapoints),1);
for i = 1:datapoints
    ds(i) = 2*i - 1;
end

fourthsums = zeros(length(datapoints),1);
tests1 = zeros(length(datapoints),1);
tests = zeros(length(datapoints),1);
quos = zeros(length(datapoints),1);

for i = 1:length(ds)
    m = (ds(i) - 1)/2;
    
    % Fourth sum:
    fourthsum = 0;
    for p1 = 2:m
        for p2 = (p1+1):(m-1)
            for q1 = 0:(p2-p1-1)
                fourthsum = fourthsum + (1/(2*p1-1))*kratio(p1+1,p1+q1)*(1/(2*p2-1))*kratio(p2+1,m+1);
            end
        end
    end
    fourthsums(i) = fourthsum;
    
    % test
    test = 0;
    for p1 = 2:m
        testp1 = ((p1*(p1+1)*catalan(p1))/((2*p1-1)*(2^(2*p1-1))));
        for p2 = (p1+1):(m-1)
            testp2 = ((p2*(p2+1)*catalan(p2))/((2*p2-1)*(2^(2*p2-1))));
            for q1 = 0:(p2-p1-1)
                test = test + testp1*testp2*((2^(2*(p1+q1)-1))/((p1+q1)*(p1+q1+1)*catalan(p1+q1)));
            end
        end
    end
    
    test = test * (2^(2*(m+1)-1)/((m+1)*(m+2)*catalan(m+1)));
    
    tests(i) = test;
    
    quos(i) = fourthsums(i)/tests(i);
end

figure(1);
plot(ds, fourthsums, 'ro');
hold on;
plot(ds, tests, 'k.');
hold off;
legend('fourthsum', 'test', 'Location', 'NorthWest');